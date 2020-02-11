import 'package:ChStore/bloc/main.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/utility/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Template Type
const NORMAL_LIST_TYPE = 1;

class TopicView extends StatelessWidget {
  TopicView(this._parentContext, {this.type: NORMAL_LIST_TYPE});
  final BuildContext _parentContext;
  final int type;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(builder: (context, state) {
      if (state is DataError) {
        return Center(child: Text('failed to fetch data'));
      }
      if (state is DataLoaded) {
        if (state.topics.isEmpty) {
          return Center(child: Text("No items", style: ChTextStyle.noItem));
        }
        List<GestureDetector> _categories = state.topics
            .asMap()
            .map((index, topic) {
              AlignmentGeometry _alignment = Alignment.centerRight;

              if (index % 2 > 0) {
                _alignment = Alignment.centerLeft;
              }
              return MapEntry(
                index,
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      _parentContext,
                      '/${topic.name.toLowerCase()}-topic',
                      arguments: topic,
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                        height: 130,
                        width: System.screenSize.width,
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(10.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: ChColor.shadow,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 10.0,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(10.0),
                          child: topic.image != null
                              ? Image.asset(
                                  topic.image,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  color: ChColor.main,
                                ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        bottom: 0,
                        child: Container(
                          height: 130,
                          width: System.screenSize.width,
                          alignment: _alignment,
                          padding: EdgeInsets.only(right: 20.0, left: 20.0),
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(right: 20.0, left: 20.0),
                            child: Text(topic.name, style: ChTextStyle.topic),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })
            .values
            .toList();

        return Column(
          children: _categories,
        );
      }
    });
  }
}
