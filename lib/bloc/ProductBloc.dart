import 'dart:async';

import 'package:ChStore/api/Product.dart';
import 'package:rxdart/rxdart.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ChStore/model/Product.dart';

// State
abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductUninitialized extends ProductState {}

class ProductError extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  final bool hasReachedMax;

  const ProductLoaded({
    this.products,
    this.hasReachedMax,
  });

  ProductLoaded copyWith({
    List<Product> products,
    bool hasReachedMax,
  }) {
    return ProductLoaded(
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [products, hasReachedMax];

  @override
  String toString() =>
      'ProductLoaded { products: ${products.length}, hasReachedMax: $hasReachedMax }';
}

// Events
abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Fetch extends ProductEvent {}

class FetchNews extends ProductEvent {}

// Bloc Instance
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  @override
  get initialState => ProductUninitialized();

  @override
  Stream<ProductState> transformEvents(
    Stream<ProductEvent> events,
    Stream<ProductState> Function(ProductEvent event) next,
  ) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    final currentState = state;
    if (event is Fetch && !_hasReachedMax(currentState)) {
      if (currentState is ProductUninitialized) {
        final products = await _fetchProducts(0, 20);
        yield ProductLoaded(products: products, hasReachedMax: false);
        return;
      }
      if (currentState is ProductLoaded) {
        final products = await _fetchProducts(currentState.products.length, 20);
        yield products.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : ProductLoaded(
                products: currentState.products + products,
                hasReachedMax: false,
              );
      }
    }
  }

  bool _hasReachedMax(ProductState state) =>
      state is ProductLoaded && state.hasReachedMax;

  Future<List<Product>> _fetchProducts(int startIndex, int limit) async {
    return await api.getProducts(startIndex, limit, 0);
    // if () {
    // } else {
    //   throw Exception('error fetching posts');
    // }
  }
}
