import 'dart:async';

import 'package:ChStore/api/main.dart';
import 'package:ChStore/model/main.dart';
import 'package:rxdart/rxdart.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// State
abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

class DataUninitialized extends DataState {}

class DataError extends DataState {}

class DataLoaded extends DataState {
  final List<Product> products;
  final List<Category> categories;
  final List<Topic> topics;
  final List<ProductType> types;
  final bool hasReachedMax;

  const DataLoaded({
    this.products,
    this.categories,
    this.topics,
    this.types,
    this.hasReachedMax,
  });

  DataLoaded copyWith({
    List<Product> products,
    List<Category> categories,
    List<Topic> topics,
    List<Type> types,
    bool hasReachedMax,
  }) {
    return DataLoaded(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      topics: topics ?? this.topics,
      types: types ?? this.types,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props =>
      [products, categories, topics, types, hasReachedMax];

  @override
  String toString() =>
      'DataLoaded { products: ${products.length}, categories: ${categories.length}, topics: ${topics.length}, types: ${types.length}, hasReachedMax: $hasReachedMax }';
}

// Events
abstract class DataEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Fetch extends DataEvent {}

class Reset extends DataEvent {}

// Bloc Instance
class DataBloc extends Bloc<DataEvent, DataState> {
  @override
  get initialState => DataUninitialized();

  @override
  Stream<DataState> transformEvents(
    Stream<DataEvent> events,
    Stream<DataState> Function(DataEvent event) next,
  ) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    final currentState = state;

    if (event is Fetch && !_hasReachedMax(currentState)) {
      if (currentState is DataUninitialized) {
        final categories = api.getCategories();
        final topics = api.getTopics();
        final types = api.getProductTypes();
        final products = await _fetchProducts(0, 20);

        yield DataLoaded(
            products: products,
            categories: categories,
            topics: topics,
            types: types,
            hasReachedMax: false);
        return;
      }

      if (currentState is DataLoaded) {
        final products = await _fetchProducts(currentState.products.length, 20);
        yield products.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : currentState.copyWith(
                products: currentState.products + products,
                hasReachedMax: false,
              );
      }
    }

    if (event is Reset) {
      if (currentState is DataLoaded) {
        currentState.products.removeRange(20, currentState.products.length);
        yield currentState.copyWith(hasReachedMax: false);
      }
    }
  }

  bool _hasReachedMax(DataState state) =>
      state is DataLoaded && state.hasReachedMax;

  Future<List<Product>> _fetchProducts(int startIndex, int limit) async {
    return await api.getProducts(startIndex, limit, 0);
  }
}
