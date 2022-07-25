import 'package:creations/home.dart';
import 'package:creations/main.dart';
import 'package:creations/screens/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernamecontroller = TextEditingController();

  final _passwordcontroller = TextEditingController();
  // bool _dataMatched = true;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromARGB(255, 246, 238, 243),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Foodizone',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.orange),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    height: 80,
                    child: Image.asset('assets/images/delivery.png'),
                  ),
                ),
                FormWidget(
                  controller: _usernamecontroller,
                  hintText: 'Username',
                ),
                const SizedBox(
                  height: 20,
                ),
                FormWidget(
                  controller: _passwordcontroller,
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0),
                      child: SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            checkLogin(context);
                            _formkey.currentState!.validate();
                          },
                          icon: const Icon(Icons.check),
                          label: const Text('login'),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void checkLogin(BuildContext ctx) async {
    final username = _usernamecontroller.text;
    final password = _passwordcontroller.text;

    if (username == 'password' || password == 'password') {
      final share = await SharedPreferences.getInstance();
      await share.setBool(saveKeyName, true);

      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: (ctx1) => const Homescreen()));
    } else {
      final errorMessage = 'username and password does not match';
      //     showDialog(
      //         context: ctx,
      //         builder: (ctx1) {
      //           return AlertDialog(
      //             title: Text('error'),
      //             content: Text(error_message),
      //             actions: [
      //               TextButton(
      //                 onPressed: () {
      //                   Navigator.of(ctx1).pop();
      //                 },
      //                 child: Text('close'),
      //               )
      //             ],
      //           );
      //         });
      //   }
      // }

      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ));
    }
  }
}
