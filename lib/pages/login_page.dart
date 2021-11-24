import 'package:flutter/material.dart';
import 'package:instagram_ex/data/login_data.dart';
import 'package:instagram_ex/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  Widget logo() {
    return Center(
      child: Image.asset(
        'imgs/logo.png',
        width: 200,
      ),
    );
  }

  Widget inputArea() {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      SizedBox(
        height: 20,
      ),
      Padding(
        child: TextField(
          controller: idController,
          decoration: InputDecoration(
            hintText: '전화번호, 사용자 또는 이메일',
            hintStyle: TextStyle(fontSize: 16, color: Color(0xffbdbdbd)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
            ),
            filled: true,
            contentPadding: EdgeInsets.all(16),
          ),
        ),
        padding: EdgeInsets.only(left: 30, right: 30),
      ),
      SizedBox(height: 15),
      Padding(
        child: TextField(
          controller: pwController,
          decoration: InputDecoration(
            hintText: '비밀번호',
            hintStyle: TextStyle(fontSize: 16, color: Color(0xffbdbdbd)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
            ),
            filled: true,
            contentPadding: EdgeInsets.all(16),
          ),
        ),
        padding: EdgeInsets.only(left: 30, right: 30),
      ),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: EdgeInsets.only(right: 30),
        child: Text(
          "비밀번호를 잊으셨나요?",
          style:
              TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w600),
        ),
      ),
      SizedBox(
        height: 40,
      ),
    ]);
  }

  Widget loginArea() {
    return Column(
      children: [
        InkWell(
          onTap: login,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[300],
            ),
            margin: EdgeInsets.only(right: 30, left: 30),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Center(
                child: Text("로그인",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ))),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Stack(
          children: [
            Divider(
                thickness: 1,
                color: Colors.grey[200],
                endIndent: 30,
                indent: 30),
            Positioned(
              child: Container(
                color: Colors.white,
                child: Center(
                    child: Text(
                  "또는",
                  style: TextStyle(color: Colors.grey[400]),
                )),
                width: 60,
              ),
              left: MediaQuery.of(context).size.width / 2 - 30,
            )
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'imgs/facebook_icon.png',
              width: 30,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "facebook으로 로그인",
              style: TextStyle(
                  color: Colors.blue[400], fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );
  }

  Widget signinArea() {
    return Column(
      children: [
        Divider(
            thickness: 1, color: Colors.grey[200], endIndent: 30, indent: 30),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '계정이 없으신가요?',
              style: TextStyle(color: Colors.grey[400]),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '가입하기',
              style: TextStyle(color: Colors.blue[400]),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo(),
              inputArea(),
              loginArea(),
            ],
          ),
          Positioned(
            child: Padding(
                padding: EdgeInsets.only(bottom: 40), child: signinArea()),
            bottom: 0,
            right: 0,
            left: 0,
          )
        ]));
  }

  void login() async {
    if (idController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("아이디를 입력해주세요")));
      return;
    }
    if (pwController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("비밀번호를 입력해주세요")));
      return;
    }
    if (!LoginData.data.containsKey(idController.text)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("존재하는 아이디가 없습니다.")));
      return;
    }
    if (LoginData.data[idController.text] != pwController.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("일치하는 비밀번호가 없습니다.")));
      return;
    }

    // shared preferences 얻기
    final prefs = await SharedPreferences.getInstance();
    // 값 저장하기
    prefs.setBool('login', true);

    Navigator.push(context, MaterialPageRoute(builder: (context) => Pages()));
  }
}
