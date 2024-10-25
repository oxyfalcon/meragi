import 'package:flutter/material.dart';
import 'package:test_app/model/login_service.dart';
import 'package:test_app/main.dart';

class PageScreen extends StatelessWidget {
  const PageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                LoginService.logout();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
          )
        ],
      ),
      body: const Center(child: Text("Inside")),
    );
  }
}
