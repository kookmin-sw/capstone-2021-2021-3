import 'package:flutter/material.dart';
import 'package:inobus/models/route_argument.dart';
import 'package:inobus/widgets/app_scaffold.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RouteArgument argument = ModalRoute.of(context).settings.arguments;
    return AppScaffold(
      title: argument.title,
      body: Column(
        children: [
          UnderLineButton(
            mainText: "버전 1.5.4",
            endText: "최신버전",
            padding: 5.0,
          ),
          UnderLineButton(
            mainText: "로그아웃",
            padding: 5.0,
          ),
        ],
      ),
    );
  }
}

class UnderLineButton extends StatelessWidget {
  final String mainText;
  final String endText;
  final double padding;

  UnderLineButton({Key key, this.mainText, this.endText, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0),
          ),
        ),
        child: MaterialButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                mainText,
                style: TextStyle(fontSize: 17),
              ),
              Text(
                endText == null ? "" : endText,
                style: TextStyle(fontSize: 17, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
