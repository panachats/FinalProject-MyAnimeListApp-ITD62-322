import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Login extends StatefulWidget {
  static const routeName = "/login";

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b2d42), // สีพื้นหลังเหมือนกับ ChatGPT Mobile
      body: Column(
        children: [
          SizedBox(
            width: 100.0,
            height: 200.0,
          ),
          Expanded(
              child: AnimatedTextKit(
                  animatedTexts: [
                TypewriterAnimatedText(
                  'MyAnimeList',
                  textStyle: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
                  pause: const Duration(milliseconds: 100),
                  displayFullTextOnTap: true,
                  repeatForever: true)),
          Container(
            // color: Colors.white, // สีพื้นหลังส่วนล่างสุด
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), // ขอบบนซ้าย
                topRight: Radius.circular(50), // ขอบบนขวา
              ),
              color: Colors.white,
            ),

            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 80.0), // ระยะห่างด้านบน
                  emailInputField(),
                  SizedBox(height: 20.0), // ระยะห่างระหว่างฟอร์ม
                  passwordInputField(),
                  SizedBox(height: 20.0), // ระยะห่างระหว่างฟอร์ม
                  // ระยะห่างระหว่างปุ่ม
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      submitButton(),
                      SizedBox(width: 10.0),
                      registerLink(),
                    ],
                  ),
                ],
              ),
            ), // ความสูงของส่วนล่างสุด
          ),
        ],
      ),
    );
  }
}

Widget emailInputField() {
  return SizedBox(
    width: 350,
    child: TextFormField(
      style: TextStyle(color: Colors.black), // สีข้อความ
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.black), // สีข้อความ Label
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.black), // สีเส้นกรอบของฟิลด์ให้เป็นขาว
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.black), // สีเส้นกรอบของฟิลด์ให้เป็นขาว
        ),
      ),
    ),
  );
}

Widget passwordInputField() {
  return SizedBox(
    width: 350,
    child: TextFormField(
      style: TextStyle(color: Colors.black), // สีข้อความ
      obscureText: true, // ให้เป็นรหัสผ่าน
      decoration: InputDecoration(
        labelText: "password",
        labelStyle: TextStyle(color: Colors.black), // สีข้อความ Label
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.black), // สีเส้นกรอบของฟิลด์ให้เป็นขาว
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.black), // สีเส้นกรอบของฟิลด์ให้เป็นขาว
        ),
      ),
    ),
  );
}

Widget submitButton() {
  return ElevatedButton(
    onPressed: () {},
    child: Text("Login"),
    style: ElevatedButton.styleFrom(
      primary: Colors.green, // สีปุ่ม
    ),
  );
}

Widget registerLink() {
  return InkWell(
    child: Text(
      "Sign Up",
      style: TextStyle(
        color: Colors.blue, // สีข้อความลิงค์
      ),
    ),
    onTap: () {},
  );
}
