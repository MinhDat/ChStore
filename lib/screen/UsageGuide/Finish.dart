import 'package:flutter/material.dart';
import 'package:ChStore/utility/main.dart';

class Finish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Center(
        child: FlatButton(
          color: AppColor.primaryDart,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
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
