import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_second_screen.dart';
import 'package:flutter_application_1/widget/mybutton.dart';
import 'package:flutter_application_1/widget/mylogo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController(text: "Hey");
    // String email = "";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              LogoWidget(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email"),
                  // onChanged: (value) {
                  //   print(value);
                  // },
                  // onFieldSubmitted: (value) {
                  //   print(value);
                  // },
                  validator: (value) {
                    if (value!.contains("@")) {
                      return null;
                    } else {
                      return "Not valid email";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text("Password"),
                  ),
                  validator: (value) {
                    if (value!.length < 7) {
                      return "password should contain 8 characters or more";
                    }
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    saveEmail(emailController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondPage(
                                email: emailController.text,
                              )),
                    );
                  } else {
                    emailController.clear();
                  }
                },
                child: MyButton(
                  text: "login",
                  textColor: Colors.yellow,
                  bgColor: Colors.blue,
                ),
              ),

              MyButton(
                text: "signup",
                textColor: Colors.green,
                bgColor: Colors.brown,
              )
              //  Expanded(
              //   flex: 2,
              //   child: Container(
              //     color: Colors.yellow,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  saveEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }
}
