import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallsScreen extends StatelessWidget {
  final String contactNumber = '8376049497';
  final String email = 'piyush';
  final String linkedInUrl =
      'https://www.linkedin.com/in/piyush-bhardwaj-flutter';
  final String githubUrl = 'https://github.com/Piyu-Pika';
  final String whatsappNumber = '8376049497';

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text(contactNumber),
              onTap: () => _launchUrl('tel://$contactNumber'),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(email),
              onTap: () => _launchUrl('mailto:$email'),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('LinkedIn'),
              onTap: () => _launchUrl(linkedInUrl),
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('GitHub'),
              onTap: () => _launchUrl(githubUrl),
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('WhatsApp'),
              onTap: () => _launchUrl('https://wa.me/$whatsappNumber'),
            ),
          ],
        ),
      ),
    );
  }
}
