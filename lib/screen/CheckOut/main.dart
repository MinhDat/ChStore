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
    return ListView(
      children: <Widget>[
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.album),
                title: Text("Recipient's address"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, bottom: 20, right: 30),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(14),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      // borderRadius: BorderRadius.circular(RADIUS),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      // borderRadius: BorderRadius.circular(RADIUS),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
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
                title: Text('Choose payment menthod'),
              ),
              RadioListTile<SingingCharacter>(
                title: const Text('Cash money'),
                value: SingingCharacter.CASH_MONEY,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                title: const Text('VISA/Master card'),
                value: SingingCharacter.VISA,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                title: const Text('Internet banking'),
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
