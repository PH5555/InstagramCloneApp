import 'package:flutter/material.dart';
import 'package:instagram_ex/items/instagram_content_item.dart';

class ContentList extends StatelessWidget {
  const ContentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [InstagramContentItem(), InstagramContentItem()],
    );
  }
}
