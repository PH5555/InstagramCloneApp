import 'package:flutter/material.dart';
import 'package:instagram_ex/pages.dart';
import 'package:instagram_ex/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text("has Error"),
              );
            }
            return snapshot.data!.getBool('login') ?? false ? Pages() : Login();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
