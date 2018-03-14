import 'dart:async';
import 'package:flutter/material.dart';

import 'package:arch/src/global_state.dart';
import 'package:arch/src/auth_module/auth_state.dart';
import 'package:arch/src/auth_module/user_model.dart';

import 'package:arch/src/app_module/app_state.dart';
import 'package:arch/src/app_module/home/home_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int _globalCounter = 0;
  int _counter = 0;

  AuthState _authState = AuthState.instance;
  StreamSubscription<User> _authSub;

  GlobalState _globalState = GlobalState.instance;
  StreamSubscription _stateSub;

  @override
  void initState() {
    super.initState();
    _authSub = _authState.onAuthStateChanged.listen((user) {
      print('user => $user');
    });
    _stateSub = _globalState.onStateChanged.listen((data) {
      // counter
      print('global.state.counter => ${data['counter']}');
      setState(() {
        _globalCounter = data['counter'];
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _authSub.cancel();
    _stateSub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new AppState(
        counter: _counter,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text("counter ($_globalCounter)"),
          ),
          body: new HomePage(),
          floatingActionButton: new FloatingActionButton(
            onPressed: () {
              int next = _counter + 1;
              setState(() {
                _counter = next;
              });
              _globalState.set("counter", next);
            },
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          ),
        ));
  }
}
