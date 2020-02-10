import 'package:ChStore/bloc/Bloc.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/utils/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double profileSize = System.screenSize.height / 3;
    double avatarSize = System.screenSize.height / 16;
    double panelSize = System.screenSize.height / 3;
    double analyticSize = profileSize / 4;

    return Scaffold(
      backgroundColor: ChColor.border,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Wallpaper(
              height: profileSize - 5,
              width: System.screenSize.width,
            ),
          ),
          Positioned(
            top: profileSize / 3,
            right: 0,
            child: Container(
              height: System.screenSize.height - (profileSize / 2),
              width: System.screenSize.width,
              child: ListView(
                padding: EdgeInsets.only(top: 0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Stack(
                      children: [
                        Container(
                          height: panelSize,
                        ),
                        Positioned(
                          top: avatarSize,
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.only(top: avatarSize),
                            decoration: new BoxDecoration(
                              color: ChColor.main,
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Column(
                              children: [
                                Text("Charlie", style: ChTextStyle.title),
                                Text("Software Developer",
                                    style: ChTextStyle.description),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 10),
                                        child: SocialInfo(
                                          "Facebook",
                                          bgColor: ChColor.facebook,
                                          textColor: ChColor.main,
                                          assetImage: Image.asset(
                                            'icon/facebook_white.png',
                                            height: 15,
                                            width: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 20),
                                        child: SocialInfo(
                                          "Zalo",
                                          bgColor: ChColor.zalo,
                                          textColor: ChColor.main,
                                          assetImage: Image.asset(
                                            'icon/zalo.png',
                                            height: 20,
                                            width: 20,
                                            color: ChColor.main,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right:
                              ((System.screenSize.width - 40) / 2) - avatarSize,
                          child: CircleAvatar(
                            radius: avatarSize,
                            backgroundImage:
                                NetworkImage('https://picsum.photos/200'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Container(
                      height: analyticSize,
                      decoration: new BoxDecoration(
                        color: ChColor.main,
                        borderRadius: new BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Icon(Icons.shopping_basket),
                          ),
                          Text("| 56", style: ChTextStyle.normal),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Image.asset('icon/like.png',
                                height: 25, width: 25),
                          ),
                          Text("| 200", style: ChTextStyle.normal),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Icon(Icons.share),
                          ),
                          Text("| 496", style: ChTextStyle.normal),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Container(
                      // height: activeSize,
                      decoration: new BoxDecoration(
                        color: ChColor.main,
                        borderRadius: new BorderRadius.all(Radius.circular(5)),
                      ),
                      child: BlocBuilder<DataBloc, DataState>(
                          builder: (context, state) {
                        if (state is DataError) {
                          return Center(child: Text('failed to fetch data'));
                        }
                        if (state is DataUninitialized) {
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        if (state is DataLoaded) {
                          return Column(children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: 20, left: 20, bottom: 10),
                              width: System.screenSize.width,
                              child: Stack(
                                children: [
                                  Text("All products",
                                      style: ChTextStyle.title),
                                  Positioned(
                                    right: 20,
                                    bottom: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/product-list');
                                      },
                                      child: Text("See All",
                                          style: ChTextStyle.link),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            ItemList(
                                products:
                                    state.products.getRange(0, 7).toList())
                          ]);
                        }
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: System.screenSize.width / 9,
            right: System.screenSize.width / 12,
            child: Circle(
              icon: Icon(
                Icons.close,
                color: ChColor.primary,
              ),
              bgColor: Colors.white.withOpacity(0.6),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
