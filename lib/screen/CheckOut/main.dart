import 'package:ChStore/widget/Button/Square.dart';
import 'package:flutter/material.dart';

import 'package:ChStore/utils/main.dart';

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
                title: Text("Recipient's address", style: ChTextStyle.label),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, bottom: 20, right: 30),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(14),
                    filled: true,
                    fillColor: ChColor.main,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: ChColor.border),
                      // borderRadius: BorderRadius.circular(RADIUS),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ChColor.border),
                      // borderRadius: BorderRadius.circular(RADIUS),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ChColor.border),
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
                title: Text('Choose payment menthod', style: ChTextStyle.label),
              ),
              RadioListTile<SingingCharacter>(
                title: Text('Cash money', style: ChTextStyle.label),
                value: SingingCharacter.CASH_MONEY,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                title: Text('VISA/Master card', style: ChTextStyle.label),
                value: SingingCharacter.VISA,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                title: Text('Internet banking', style: ChTextStyle.label),
                value: SingingCharacter.INTERNET_BANKING,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              _character == SingingCharacter.INTERNET_BANKING
                  ? BankingView()
                  : SizedBox.shrink()
            ],
          ),
        )
      ],
    );
  }
}

class BankingView extends StatelessWidget {
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
                  Text('ACB', style: ChTextStyle.bank)
                ]),
              ),
              Expanded(
                flex: 3,
                child: Column(children: [
                  Square('lib/picture/banking/agribank.png'),
                  Text('Agribank', style: ChTextStyle.bank)
                ]),
              ),
              Expanded(
                flex: 3,
                child: Column(children: [
                  Square('lib/picture/banking/sacombank.png'),
                  Text('Sacombank', style: ChTextStyle.bank)
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
                  Text('Techcombank', style: ChTextStyle.bank)
                ]),
              ),
              Expanded(
                flex: 3,
                child: Column(children: [
                  Square('lib/picture/banking/tpbank.jpg'),
                  Text('Tpbank', style: ChTextStyle.bank)
                ]),
              ),
              Expanded(
                flex: 3,
                child: Column(children: [
                  Square('lib/picture/banking/vietcombank.png'),
                  Text('Vietcombank', style: ChTextStyle.bank)
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
                  Text('Vietinbank', style: ChTextStyle.bank)
                ]),
              ),
              Expanded(
                flex: 3,
                child: Column(children: [
                  Square('lib/picture/banking/vpbank.jpg'),
                  Text('Vpbank', style: ChTextStyle.bank)
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
