import 'package:flutter/material.dart';
import 'package:arch/src/app_module/app_state.dart';
import 'package:arch/src/auth_module/auth_state.dart';
import 'package:arch/src/auth_module/user_model.dart';

class HomePage extends StatelessWidget {

  Widget getAuthStatus(context, condition) {

    if (condition) {
      User user = new User(name: "redditor");
      AuthState.instance.setUser(user);
    } else {
      AuthState.instance.setUser(null);
    }

    var style = Theme.of(context).textTheme.title;
    User user = AuthState.currentUser;
    return user == null
        ? new Text("User is not logged", style: style)
        : new Text("User is logged [$user]", style: style);
  }

  @override
  Widget build(BuildContext context) {

    AppState appState = AppState.of(context);

    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("user is not logged if counter can be / on 5",
            style: Theme.of(context).textTheme.caption),
          getAuthStatus(context, appState.counter % 5 == 0),
          new Padding(padding: new EdgeInsets.all(12.0)),
          new Text(
            'You have pushed the button this many times:',
          ),
          new Text(
            '${appState.counter}',
            style: Theme.of(context).textTheme.display1,
          ),
        ],
      ),
    );
  }
}
