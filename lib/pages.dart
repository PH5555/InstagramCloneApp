import 'package:flutter/material.dart';
import 'package:instagram_ex/pages/home_page.dart';
import 'package:instagram_ex/pages/message_page.dart';

class Pages extends StatelessWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [Home(), Message()],
    );
  }
}
