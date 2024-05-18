import 'package:flutter/material.dart';

class UpdatesScreen extends StatelessWidget {
  final List<String> imageAssets = [
    "assets/images/as.png",
    "assets/images/Pyt.png",
    "assets/images/vsc.png",
    "assets/images/flt.png",
    "assets/images/C++.png",
    "assets/images/fb.png",
    "assets/images/dt.png",
    "assets/images/c.png",
    "assets/images/gh.png",
    "assets/images/vsc.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Updates'),
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: imageAssets.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(imageAssets[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
