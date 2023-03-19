import 'package:flutter/material.dart';

import 'pages/team_folder.dart';

void main() {
  runApp(CloudFileManagerUI());
}

class CloudFileManagerUI extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cloud files",
      home: TeamFolderPage(),
    );
  }
}

