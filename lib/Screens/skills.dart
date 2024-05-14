import 'package:flutter/material.dart';

class UpdatesScreen extends StatelessWidget {
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
                height: 200,
                width: 200,
                child: Image.asset("assets/images/pic.png"),
              ),
              const Text(
                "Piyush Bhardwaj",
              ),
              const Text(""),
              const Text(""),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "An candidate for flutter app devloper .Persuing the B.tech form Chaudhray charan singh university in the field of computer Science and expalnding the skills in flutter ,dart and firebase for the app development .also having the skils in python , C language, C++ language .Experiance of one months intership for ai and ml in YBI foundation"),
              )
            ],
          ),
        ));
  }
}
