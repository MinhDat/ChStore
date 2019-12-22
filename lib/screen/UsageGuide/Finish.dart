import 'package:ChStore/utils/AppColor.dart';
import 'package:ChStore/utils/System.dart';
import 'package:flutter/material.dart';

class Finish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Center(
        child: FlatButton(
          color: appColor.red300,
          child: Text('Get Started'),
          onPressed: () async {
            await System.setFirstUsage(false);
            Navigator.pushReplacementNamed(context, '/main');
          },
        ),
      ),
    );
  }
}
