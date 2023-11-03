import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final Color _primaryColor = const Color.fromRGBO(125, 191, 211, 1.0);
  final Color _secondaryColor = const Color.fromRGBO(169, 224, 241, 1.0);

  var _deviceHeight;
  var _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: _primaryColor,
        body: Align(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _avatarWidget(),
                ])));
  }

  Widget _avatarWidget() {
    double _circleD = _deviceHeight * 0.25;

    return Container(
        height: _circleD,
        width: _circleD,
        decoration: BoxDecoration(
            color: _secondaryColor,
            borderRadius: BorderRadius.circular(500),
            image: DecorationImage(
              image: AssetImage('images/main_avatar.png'),
            )));
  }
}
