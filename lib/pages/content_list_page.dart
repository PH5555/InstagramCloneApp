import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_ex/items/instagram_content_item.dart';
import 'package:permission_handler/permission_handler.dart';

class ContentList extends StatefulWidget {
  const ContentList({Key? key}) : super(key: key);

  @override
  _ContentListState createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  PermissionStatus _permissionStatus = PermissionStatus.denied;
  List<Widget> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              "imgs/logo.png",
              width: 120,
            ),
          ),
          elevation: 0,
          titleSpacing: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: InkWell(
                onTap: () async {
                  checkPermission();
                  getGalleryImage();
                },
                child: Image.asset(
                  'imgs/add.png',
                  width: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Image.asset(
                'imgs/heart.png',
                width: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Image.asset(
                'imgs/send.png',
                width: 20,
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            Row(children: items),
            InstagramContentItem(
                profileImg: "imgs/forif.png",
                userName: "포리프",
                content: "포리프가 짱이야",
                contentImg: "imgs/cat.png",
                count: 100),
            InstagramContentItem(
                profileImg: "imgs/lion.png",
                userName: "김동현",
                content: "고양이 정말 귀여워용",
                contentImg: "imgs/lions.jpg",
                count: 100)
          ],
        ));
  }

  Future getGalleryImage() async {
    final _picker = ImagePicker();
    PickedFile? image = await _picker.getImage(source: ImageSource.gallery);
    if (image == null) {
      print("");
      return;
    }

    setState(() {
      items.add(Image.file(
        File(image.path),
        width: 50,
        height: 50,
      ));
    });
  }

  Future<void> checkPermission() async {
    _permissionStatus = await Permission.photos.status;
    print(_permissionStatus);

    if (_permissionStatus.isDenied ||
        _permissionStatus.isPermanentlyDenied ||
        _permissionStatus.isRestricted) {
      await Permission.photos.request();
    }
  }
}
