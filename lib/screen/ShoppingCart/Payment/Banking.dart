import 'package:ChStore/utility/main.dart';
import 'package:ChStore/widget/main.dart';

import 'package:flutter/material.dart';

class Banking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(children: [
                  Square('lib/picture/banking/acb.png'),
                  Text('ACB', style: ChTextStyle.bankname)
                ]),
              ),
              Expanded(
                flex: 3,
                child: Column(children: [
                  Square('lib/picture/banking/agribank.png'),
                  Text('Agribank', style: ChTextStyle.bankname)
                ]),
              ),
              Expanded(
                flex: 3,
                child: Column(children: [
                  Square('lib/picture/banking/sacombank.png'),
                  Text('Sacombank', style: ChTextStyle.bankname)
                ]),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(children: [
                  Square('lib/picture/banking/techcombank.png'),
                  Text('Techcombank', style: ChTextStyle.bankname)
                ]),
              ),
              Expanded(
                flex: 3,
                child: Column(children: [
                  Square('lib/picture/banking/tpbank.jpg'),
                  Text('Tpbank', style: ChTextStyle.bankname)
                ]),
              ),
              Expanded(
                flex: 3,
                child: Column(children: [
                  Square('lib/picture/banking/vietcombank.png'),
                  Text('Vietcombank', style: ChTextStyle.bankname)
                ]),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(children: [
                  Square('lib/picture/banking/vietinbank.png'),
                  Text('Vietinbank', style: ChTextStyle.bankname)
                ]),
              ),
              Expanded(
                flex: 3,
                child: Column(children: [
                  Square('lib/picture/banking/vpbank.jpg'),
                  Text('Vpbank', style: ChTextStyle.bankname)
                ]),
              ),
              Expanded(flex: 3, child: SizedBox.shrink())
            ],
          ),
        ),
      ],
    );
  }
}
