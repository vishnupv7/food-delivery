import 'package:creations/home.dart';
import 'package:creations/login.dart';
import 'package:creations/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    checkuserloggedin();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/icon2.jpg'),
      ),
    );
  }

 

  Future<void> gotologin() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) {
          return const Login();
        },
      ),
    );
  }

  Future<void> checkuserloggedin() async {
    final share = await SharedPreferences.getInstance();
    final userLoggedIn = share.getBool(saveKeyName);
    if (userLoggedIn == null || userLoggedIn == false) {
      gotologin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) =>  const Homescreen()));
    }
  }
}
