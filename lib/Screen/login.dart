import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_application/modules/configure.dart';
import 'package:flutter_application/modules/login_user.dart';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';
import 'home.dart';

class Login extends StatefulWidget {
  static const routeName = "/login";

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  Users user = Users();

  Future<void> login(Users user) async {
    var params = {"email": user.email, "password": user.password};
    var url = Uri.http(Configure.server, "users", params);
    var resp = await http.get(url);
    print(resp.body);
    List<Users> login_result = usersFromJson(resp.body);
    print(login_result.length);

    if (login_result.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("email or password invalid")));
    } else {
      Configure.login = login_result[0];
      Configure.uid =  login_result[0].id!;
      Navigator.pushNamed(context, Home.routeName);
    }
    return;
  }

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
            height: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), // ขอบบนซ้าย
                topRight: Radius.circular(50), // ขอบบนขวา
              ),
              color: Colors.white,
            ),

            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.0), // ระยะห่างด้านบน
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

  Widget emailInputField() {
    return SizedBox(
      width: 350,
      child: TextFormField(
        style: TextStyle(color: Colors.black), // สีข้อความ
        decoration: InputDecoration(
          labelText: "Email",
          labelStyle: TextStyle(color: Colors.black),
          // icon: Icon(Icons.email), // สีข้อความ Label
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black), // สีเส้นกรอบของฟิลด์ให้เป็นขาว
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black), // สีเส้นกรอบของฟิลด์ให้เป็นขาว
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),

        initialValue: "a@gmail.com",
        validator: (value) {
          if (value!.isEmpty) {
            return "This field is required";
          }
          if (!EmailValidator.validate(value)) {
            return "It is not email format";
          }
          return null;
        },
        onSaved: (newValue) => user.email = newValue,
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
          // icon: Icon(Icons.password),
          labelText: "password",
          labelStyle: TextStyle(color: Colors.black), // สีข้อความ Label
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black), // สีเส้นกรอบของฟิลด์ให้เป็นขาว
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black), // สีเส้นกรอบของฟิลด์ให้เป็นขาว
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),

        initialValue: "12345",
        validator: (value) {
          if (value!.isEmpty) {
            return "This field is required";
          }
          return null;
        },
        onSaved: (newValue) => user.password = newValue,
      ),
    );
  }

  Widget submitButton() {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            _formkey.currentState!.save();
            print(user.toJson().toString());
            login(user);
          }
          ;
        },
        child: Text("Login"),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 41, 41, 41), // สีปุ่ม
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
