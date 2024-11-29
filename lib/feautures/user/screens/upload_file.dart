import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/controller/file_picker_controller.dart';
import '../widget/file_list.dart';

class UploadFileScreen extends StatelessWidget {
  final FilePickerController controller = Get.put(FilePickerController());
  UploadFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Files')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: controller.pickResume,
              child: const Text('Upload Resume'),
            ),
            ElevatedButton(
              onPressed: controller.pickCoverLetter,
              child: const Text('Upload Cover Letter'),
            ),
            const SizedBox(height: 16.0),
            const Text('Resumes:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() {
              return controller.resumeFiles.isEmpty
                  ? const Text('No resume uploaded.')
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.resumeFiles.length,
                      itemBuilder: (context, index) {
                        final file = controller.resumeFiles[index];
                        return FileListTile(
                          index: index,
                          file: file,
                          onDelete: () => controller.deleteFile(
                              controller.resumeFiles, file),
                        );
                      },
                    );
            }),
            const SizedBox(height: 16.0),
            const Text('Cover Letters:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() {
              return controller.coverLetterFiles.isEmpty
                  ? const Text('No cover letter uploaded.')
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.coverLetterFiles.length,
                      itemBuilder: (context, index) {
                        final file = controller.coverLetterFiles[index];
                        return FileListTile(
                          index: index,
                          file: file,
                          onDelete: () => controller.deleteFile(
                              controller.coverLetterFiles, file),
                        );
                      },
                    );
            }),
          ],
        ),
      ),
    );
  }
}

// Widget to display each file with a delete button

