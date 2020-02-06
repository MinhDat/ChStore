import 'package:ChStore/bloc/Bloc.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/utils/main.dart';
import 'package:ChStore/screen/main.dart';
import 'package:ChStore/widget/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double profileSize = System.screenSize.height / 3;
    double avatarSize = System.screenSize.height / 16;
    double panelSize = 4 * profileSize / 5;
    double analyticSize = profileSize / 4;
    double activeSize = System.screenSize.height;

    return Scaffold(
      backgroundColor: AppColor.grey200,
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
                              color: AppColor.white,
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Column(
                              children: [
                                Text("Charlie", style: AppTextStyle.title),
                                Text("Software Developer",
                                    style: AppTextStyle.description),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.end,
                                //   children: <Widget>[
                                //     Expanded(
                                //       flex: 5,
                                //       child: Padding(
                                //         padding: EdgeInsets.only(
                                //             left: 20, right: 10),
                                //         child: SocialInfo(
                                //           "Facebook",
                                //           bgColor: AppColor.facebook,
                                //           textColor: AppColor.white,
                                //           assetImage: Image.asset(
                                //             'icons/facebook_white.png',
                                //             height: 22,
                                //             width: 22,
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //     Expanded(
                                //       flex: 5,
                                //       child: Padding(
                                //         padding: EdgeInsets.only(
                                //             left: 10, right: 20),
                                //         child: SocialInfo(
                                //           "Zalo",
                                //           bgColor: AppColor.zalo,
                                //           textColor: AppColor.white,
                                //           assetImage: Image.asset(
                                //             'icons/zalo.png',
                                //             height: 27,
                                //             width: 27,
                                //             color: AppColor.white,
                                //           ),
                                //         ),
                                //       ),
                                //     )
                                //   ],
                                // ),
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
                        color: AppColor.white,
                        borderRadius: new BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Icon(Icons.share),
                          ),
                          Text("| 200", style: AppTextStyle.normal),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Icon(Icons.share),
                          ),
                          Text("| 200", style: AppTextStyle.normal),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Icon(Icons.share),
                          ),
                          Text("| 200", style: AppTextStyle.normal),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Container(
                      // height: activeSize,
                      decoration: new BoxDecoration(
                        color: AppColor.white,
                        borderRadius: new BorderRadius.all(Radius.circular(20)),
                      ),
                      child: BlocBuilder<DataBloc, DataState>(
                          builder: (context, state) {
                        if (state is DataError) {
                          return Center(
                            child: Text('failed to fetch data'),
                          );
                        }
                        if (state is DataUninitialized) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is DataLoaded) {
                          return ItemList(
                              products: state.products.getRange(0, 7).toList());
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
            child: CircleButton(
              icon: Icon(
                Icons.close,
                color: AppColor.white,
              ),
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
