import 'package:flutter/material.dart';
import 'dart:io';

class FileListTile extends StatelessWidget {
  final File file;
  final VoidCallback onDelete;
  final int index;

  const FileListTile(
      {super.key,
      required this.file,
      required this.onDelete,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${index + 1}',
        style: const TextStyle(fontSize: 16),
      ),
      title: Text(file.path.split('/').last),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: onDelete,
      ),
    );
  }
}
