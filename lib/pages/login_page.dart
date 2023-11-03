import 'package:flutter/material.dart';

import '../utils/animations/login_page_animations.dart';

class AnimatedLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedLoginPageState();
  }
}

class _AnimatedLoginPageState extends State<AnimatedLoginPage>
    with SingleTickerProviderStateMixin {
    var _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this,
        duration: Duration(seconds: 2),
        reverseDuration: Duration(milliseconds: 400));
  }

  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(Object context) {
    return LoginPage(_controller);
  }
}

class LoginPage extends StatelessWidget {
  final Color _primaryColor = const Color.fromRGBO(125, 191, 211, 1.0);
  final Color _secondaryColor = const Color.fromRGBO(169, 224, 241, 1.0);

  var _deviceHeight;
  var _deviceWidth;

  var _controller;
  EnterAnimation _animation;

  LoginPage(_controller) {
    this._controller = _controller;
    _animation = EnterAnimation(_controller);
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: _primaryColor,
        body: Align(
            alignment: Alignment.center,
            child: Container(
              height: _deviceHeight * 0.60,
              width: _deviceWidth,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _avatarWidget(),
                    SizedBox(height: _deviceHeight * 0.02),
                    _emailTextField(),
                    _passwordTextField(),
                    SizedBox(height: _deviceHeight * 0.10),
                    _loginButton(),
                  ]),
            )));
  }

  Widget _avatarWidget() {
    double _circleD = _deviceHeight * 0.25;

    return AnimatedBuilder(animation: _animation.controller, builder: (BuildContext _context, Widget: _widget) {
      return Container(
        height: _circleD,
        width: _circleD,
        decoration: BoxDecoration(
            color: _secondaryColor,
            borderRadius: BorderRadius.circular(500),
            image: const DecorationImage(
              image: AssetImage('images/main_avatar.png'),
            )));
    })
  }

  Widget _emailTextField() {
    return Container(
      width: _deviceWidth * 0.70,
      child: const TextField(
        cursorColor: Colors.white,
        autocorrect: false,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: "johndoe@gmail.com",
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            )),
      ),
    );
  }

  Widget _passwordTextField() {
    return Container(
        width: _deviceWidth * .70,
        child: const TextField(
          obscureText: true,
          cursorColor: Colors.white,
          autocorrect: false,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: 'Type password here',
              hintStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
        ));
  }

  Widget _loginButton() {
    return MaterialButton(
        minWidth: _deviceWidth * 0.38,
        height: _deviceHeight * 0.055,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(color: Colors.white)),
        onPressed: () {},
        child: Text(
          "Log In",
          style: TextStyle(
              fontSize: 16, color: _primaryColor, fontWeight: FontWeight.bold),
        ));
  }
}
