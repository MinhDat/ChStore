import 'package:ChStore/bloc/main.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double profileSize = System.media.size.height / 3;
    double avatarSize = System.media.size.height / 16;

    return Scaffold(
      backgroundColor: AppColor.border,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Wallpaper(
                height: profileSize - 5, width: System.media.size.width),
          ),
          Positioned(
            top: profileSize / 3,
            right: 0,
            child: Container(
              height: System.media.size.height - (profileSize / 2),
              width: System.media.size.width,
              child: ListView(
                padding: EdgeInsets.only(top: 0),
                children: <Widget>[
                  Stack(children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: avatarSize),
                          child: CardWrapper(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: avatarSize),
                                  child: Text("Charlie", style: Style.title),
                                ),
                                Text("Software Developer",
                                    style: Style.jobInfo),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: SocialInfo(
                                          "Facebook",
                                          bgColor: AppColor.facebook,
                                          textColor: AppColor.main,
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
                                        padding: EdgeInsets.only(left: 5),
                                        child: SocialInfo(
                                          "Zalo",
                                          bgColor: AppColor.zalo,
                                          textColor: AppColor.main,
                                          assetImage: Image.asset(
                                            'icon/zalo.png',
                                            height: 20,
                                            width: 20,
                                            color: AppColor.main,
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
                          top: 7,
                          right: (System.media.size.width / 2) - avatarSize,
                          child: CircleAvatar(
                            radius: avatarSize,
                            backgroundImage:
                                NetworkImage('https://picsum.photos/200'),
                          ),
                        ),
                      ],
                    ),
                  ]),
                  CardWrapper(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Icon(Icons.shopping_basket)),
                        Text("| 56", style: Style.normal),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Image.asset('icon/like.png',
                              height: 25, width: 25),
                        ),
                        Text("| 200", style: Style.normal),
                        Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Icon(Icons.share)),
                        Text("| 496", style: Style.normal),
                      ],
                    ),
                  ),
                  CardWrapper(
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
                            padding:
                                EdgeInsets.only(top: 10, left: 10, bottom: 10),
                            width: System.media.size.width,
                            child: Stack(
                              children: [
                                Text("All products", style: Style.title),
                                Positioned(
                                  right: 20,
                                  bottom: 0,
                                  child: GestureDetector(
                                    onTap: () => Navigator.pushNamed(
                                        context, '/product-list'),
                                    child: Text("See All", style: Style.link),
                                  ),
                                )
                              ],
                            ),
                          ),
                          ItemList(
                              products: state.products.getRange(0, 7).toList())
                        ]);
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: System.media.size.width / 9,
            right: 10,
            child: Circle(
              icon: Icon(Icons.close, color: AppColor.primary),
              bgColor: AppColor.main.withOpacity(0.6),
              onTap: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
