import 'package:flutter/material.dart';

class CommunitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Updates'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                child: Image.asset("assets/images/pic.png"),
                height: 200,
                width: 200,
              ),
            ],
          ),
        ));
  }
}
