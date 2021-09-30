import 'package:flutter/material.dart';

class InstagramContentItem extends StatefulWidget {
  const InstagramContentItem({Key? key}) : super(key: key);

  @override
  _InstagramContentItemState createState() => _InstagramContentItemState();
}

class _InstagramContentItemState extends State<InstagramContentItem> {
  bool isCheck = false;
  Widget userInfo() {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'imgs/profile.png',
              height: 30,
            ),
            SizedBox(width: 5),
            Text("ddd")
          ],
        ),
      ),
    );
  }

  Widget imageArea() {
    return Image.asset(
      'imgs/facebook_icon.png',
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget like() {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                isCheck = !isCheck;
              });
            },
            icon: isCheck
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : Icon(Icons.favorite_border)),
        Text("jaeho 여러명이 좋아함"),
      ],
    );
  }

  Widget content() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        userInfo(),
        imageArea(),
        like(),
        content(),
      ],
    );
  }
}
