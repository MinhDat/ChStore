import 'Banking.dart';
import 'package:ChStore/utility/main.dart';

import 'package:flutter/material.dart';

enum SingingCharacter { CASH_MONEY, VISA, INTERNET_BANKING }

class CheckOut extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CheckOutState();
}

class CheckOutState extends State<CheckOut> {
  SingingCharacter _character = SingingCharacter.CASH_MONEY;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("Recipient's address", style: Style.payment)),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(14),
                    filled: true,
                    fillColor: AppColor.main,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.border)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.border)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.border)),
                    hintText: 'Enter your address',
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                  child: Text('Choose payment menthod', style: Style.payment)),
              RadioListTile<SingingCharacter>(
                title: Text('Cash money', style: Style.method),
                value: SingingCharacter.CASH_MONEY,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                title: Text('VISA/Master card', style: Style.method),
                value: SingingCharacter.VISA,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              _character == SingingCharacter.VISA
                  ? Banking()
                  : SizedBox.shrink(),
              RadioListTile<SingingCharacter>(
                title: Text('Internet banking', style: Style.method),
                value: SingingCharacter.INTERNET_BANKING,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              _character == SingingCharacter.INTERNET_BANKING
                  ? Banking()
                  : SizedBox.shrink()
            ],
          ),
        )
      ],
    );
  }
}
