import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectUI extends StatefulWidget {
  @override
  _ProjectUIState createState() => _ProjectUIState();
}

class _ProjectUIState extends State<ProjectUI> {
  final List<ChatItem> chatItems = [
    ChatItem(name: 'GSIP', message: 'Project1', date: 'March 2024'),
    ChatItem(name: 'MY AI', message: 'Personal Project', date: 'March 2024'),
    ChatItem(
        name: 'Anime Quote App', file: 'Personal Project', date: 'March 2024'),
    ChatItem(
        name: 'CodSoft Quote Modle',
        message: 'Codsoft',
        count: 2,
        date: 'may 2024'),
    ChatItem(
        name: 'Cancer Priductor', message: 'YBI Foundation', date: 'May 2024'),
    ChatItem(
        name: 'Purchase Priduction and MicroNumersity',
        message: 'YBI Foundation',
        date: 'March 2024'),
    ChatItem(
        name: 'Codsoft To-do List', message: 'Codsoft', date: 'March 2024'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search...',
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProjectDetailScreen(projectItem: chatItems[index]),
                      ),
                    );
                  },
                  child: ChatItemWidget(ProjectItem: chatItems[index]),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Updates'),
          BottomNavigationBarItem(
              icon: Icon(Icons.group), label: 'Communities'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
        ],
      ),
    );
  }
}

class ChatItem {
  final String name;
  final String? message;
  final String? file;
  final int? count;
  final String? date;

  ChatItem({
    required this.name,
    this.message,
    this.file,
    this.count,
    this.date,
  });
}

class ChatItemWidget extends StatelessWidget {
  final ChatItem ProjectItem;

  const ChatItemWidget({Key? key, required this.ProjectItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(ProjectItem.name[0]),
      ),
      title: Text(ProjectItem.name),
      subtitle: ProjectItem.message != null
          ? Text(ProjectItem.message!)
          : ProjectItem.file != null
              ? Text(ProjectItem.file!)
              : null,
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (ProjectItem.count != null)
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.green,
              child: Text(
                ProjectItem.count.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          if (ProjectItem.date != null)
            Text(
              ProjectItem.date!,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
        ],
      ),
    );
  }
}

class ProjectDetailScreen extends StatefulWidget {
  final ChatItem projectItem;

  const ProjectDetailScreen({super.key, required this.projectItem});

  @override
  _ProjectDetailScreenState createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  Future<Map<String, dynamic>> loadProjectData() async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/projects.json');
    List<dynamic> projects = jsonDecode(jsonString);
    return projects.firstWhere(
        (project) => project['projectItem'] == widget.projectItem.name);
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.projectItem.name),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: loadProjectData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final projectData = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/${projectData['image']}'),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      projectData['content'],
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () => _launchUrl(projectData['link']),
                      child: const Text('Visit Link'),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
