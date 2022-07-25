import 'package:creations/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 238, 243),
      appBar: AppBar(
        title: const Text('Food list'),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (ctx, index) {
              return ListTile(
                title: const Text('Biriyani'),
                subtitle: const Text('Get the best biriyani in town'),
                leading: (index % 2 == 0)
                    ? const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/biriyani.jpg'))
                    : const Image(
                        image: AssetImage('assets/images/biriyani.jpg'),
                      ),
                trailing: const Text('150rs'),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            },
            itemCount: 30),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final share = await SharedPreferences.getInstance();
    await share.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => const Login()), (route) => false);
  }
}
