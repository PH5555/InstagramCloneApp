import 'package:flutter/material.dart';

class InstagramContentItem extends StatefulWidget {
  final String profileImg, userName, contentImg, content;
  final int count;

  const InstagramContentItem(
      {Key? key,
      required this.profileImg,
      required this.userName,
      required this.content,
      required this.contentImg,
      required this.count})
      : super(key: key);

  @override
  _InstagramContentItemState createState() => _InstagramContentItemState();
}

class _InstagramContentItemState extends State<InstagramContentItem> {
  bool isCheck = false;
  Widget userInfo() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 8,
                ),
                ClipRRect(
                  child: Image.asset(
                    widget.profileImg,
                    height: 35,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                SizedBox(width: 7),
                Text(
                  widget.userName,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                )
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 20,
            child: Image.asset(
              "imgs/menu.png",
              width: 15,
            ),
          )
        ],
      ),
    );
  }

  Widget imageArea() {
    return Image.asset(
      widget.contentImg,
      fit: BoxFit.fill,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget iconArea() {
    return Stack(
      children: [
        Row(
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
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "imgs/send.png",
                  width: 20,
                )),
          ],
        ),
        Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                "imgs/bookmark.png",
                width: 20,
              ),
            ))
      ],
    );
  }

  Widget like() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 8),
      child: Container(
        child: Container(
            child: RichText(
          text: new TextSpan(
              style: new TextStyle(fontSize: 15, color: Colors.black),
              children: [
                new TextSpan(
                    text: "jaeho",
                    style: new TextStyle(fontWeight: FontWeight.bold)),
                new TextSpan(text: "님 외 "),
                new TextSpan(
                    text: widget.count.toString() + "명",
                    style: new TextStyle(fontWeight: FontWeight.bold)),
                new TextSpan(text: "이 좋아합니다")
              ]),
        )),
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 13),
      child: Column(
        children: [
          Container(
            child: Container(
                child: RichText(
              text: new TextSpan(
                  style: new TextStyle(fontSize: 15, color: Colors.black),
                  children: [
                    new TextSpan(
                        text: widget.userName + "  ",
                        style: new TextStyle(fontWeight: FontWeight.bold)),
                    new TextSpan(text: widget.content),
                  ]),
            )),
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              child: Text("2일전",
                  style: TextStyle(color: Colors.grey[400], fontSize: 13)))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        userInfo(),
        imageArea(),
        iconArea(),
        like(),
        content(),
      ],
    );
  }
}
