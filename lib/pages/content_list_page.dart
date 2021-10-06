import 'package:flutter/material.dart';
import 'package:instagram_ex/items/instagram_content_item.dart';

class ContentList extends StatelessWidget {
  const ContentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InstagramContentItem(
            profileImg: "imgs/lion.png",
            userName: "김동현",
            content: "고양이 정말 귀여워용",
            contentImg: "imgs/cat.png",
            count: 100),
        InstagramContentItem(
            profileImg: "imgs/lion.png",
            userName: "김동현",
            content: "고양이 정말 귀여워용",
            contentImg: "imgs/cat.png",
            count: 100)
      ],
    );
  }
}
