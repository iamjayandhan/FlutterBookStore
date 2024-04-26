import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  String _filePath = '';

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path!;
      });
    }
  }

  Future<void> _uploadFile() async {
    if (_filePath.isNotEmpty) {
      // Simulate sending the file to the backend
      try {
        // Construct the request
        var request = http.MultipartRequest(
          'POST',
          Uri.parse('http://127.0.0.1:5000'),
        );

        // Attach the file to the request
        request.files.add(
          await http.MultipartFile.fromPath(
            'file',
            _filePath,
          ),
        );

        // Send the request
        var response = await request.send();

        // Check the response
        if (response.statusCode == 200) {
          print('File uploaded successfully.');
        } else {
          print('File upload failed with status ${response.statusCode}.');
        }
      } catch (e) {
        print('Error uploading file: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Upload Page',
            style: TextStyle(fontSize: 24.0),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: _pickFile,
            child: Text('Pick a File'),
          ),
          _filePath.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Selected File: $_filePath'),
                )
              : Container(),
          ElevatedButton(
            onPressed: _uploadFile,
            child: Text('Upload File to Backend'),
          ),
        ],
      ),
    );
  }
}
