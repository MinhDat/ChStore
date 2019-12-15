import 'package:ChStore/utils/AppTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:ChStore/utils/AppColor.dart';

enum SingingCharacter { CASH_MONEY, VISA, INTERNET_BANKING }

class CheckOut extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CheckOutState();
}

class CheckOutState extends State<CheckOut> {
  SingingCharacter _character = SingingCharacter.CASH_MONEY;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.album),
                title: Text("Recipient's address", style: appTextStyle.normal),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, bottom: 20, right: 30),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(14),
                    filled: true,
                    fillColor: appColor.grey200,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: appColor.grey),
                      // borderRadius: BorderRadius.circular(RADIUS),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: appColor.grey),
                      // borderRadius: BorderRadius.circular(RADIUS),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: appColor.grey),
                    ),
                    hintText: 'Enter your address',
                  ),
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.album),
                title:
                    Text('Choose payment menthod', style: appTextStyle.normal),
              ),
              RadioListTile<SingingCharacter>(
                title: Text('Cash money', style: appTextStyle.normal),
                value: SingingCharacter.CASH_MONEY,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                title: Text('VISA/Master card', style: appTextStyle.normal),
                value: SingingCharacter.VISA,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                title: Text('Internet banking', style: appTextStyle.normal),
                value: SingingCharacter.INTERNET_BANKING,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
