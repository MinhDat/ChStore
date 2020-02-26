import 'package:ChStore/utility/main.dart';
import 'package:flutter/material.dart';

const BACK_ACTION = false;
const NEXT_ACTION = true;

class ShoppingAction extends StatelessWidget {
  final Function onChange;
  ShoppingAction(this.onChange);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.main,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 10, right: 5, bottom: 10),
              child: FlatButton(
                color: AppColor.negative,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(Icons.arrow_back, color: AppColor.main),
                    Padding(
                        padding: EdgeInsets.all(15),
                        child: Text("Back", style: Style.button)),
                  ],
                ),
                onPressed: () => onChange(BACK_ACTION),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(left: 5, top: 10, right: 20, bottom: 10),
              child: FlatButton(
                color: AppColor.complete,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(15),
                        child: Text("Next", style: Style.button)),
                    Icon(Icons.arrow_forward, color: AppColor.main),
                  ],
                ),
                onPressed: () => onChange(NEXT_ACTION),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
