//https://flutter.dev/docs/cookbook/persistence/reading-writing-files

import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  Future fileRead() async {
    final folderName = 'dir';
    final directoryPath =Directory("storage/emulated/0/Android/data/com.example.directory/files");
    final filex=directoryPath.path;
    final filey=File(filex+'counter.txt');
    print(filex);
    print(filey);
    // return directory.path;
  }

  Future<String> get _localPath async {
    //final directory = await getApplicationDocumentsDirectory();
    //final directory = await getExternalStorageDirectory(); telefonda ve emulatorda kullanilan directory
    final directory = await getExternalStorageDirectory();
    // var directory=await Directory('dir').create(recursive: true);
    print(directory);
    return directory!.path;
  }

  Future _localPathCreate() async {
    final folderName = 'dir';
    //final directory =Directory("storage/emulated/0/Android/data/com.example.directory/files/$folderName");
    final directory = Directory(
        'storage/1000-3B08/Android/data/com.example.directory/files/$folderName');
    if (await directory.exists()) {
      print('exists');
    } else {
      print('not exists');
      directory.create();
    }
    print(directory);
  }

  Future _localPathRead() async {
    //final folderName = 'dir';
    //final directory = Directory("storage/emulated/0/Android/data/com.example.directory/files/$folderName");
    final directory=Directory('storage/1000-3B08/Android/data/com.example.directory/files');
    //final directory=Directory('data/user/0/com.example.directory/app_flutter');
    if (await directory.exists()) {
      print('exists');
      print(directory);
      //path.delete();
    } else {
      print('not exists');
      // path.create();
    }
    //print(path);
  }

  Future _localPathDeneme() async {
    final directory = Directory(
        "storage/emulated/0/Android/data/com.example.directory/files");
    List contents = directory.listSync();
    // Stream<FileSystemEntity> list({bool recursive = false, bool followLinks = true});
    //final folderName='dir1';
    //final directory=Directory("storage/emulated/0/Android/data/com.example.directory/files");
    //final directory=Directory("storage/emulated/0/Android/data/com.example.directory/files/$folderName");
    //final directory=Directory.current;   //  '/'
    //final directory=Directory.systemTemp;  //Directory: '/data/user/0/com.example.directory/code_cache'
    //final directory1=StorageDirectory.documents.;
    //final directory = await getExternalStorageDirectory();
    /*if(await directory.exists()){
      print('exists');
      print(directory);
      print(directory.path);
      print(directory.absolute);
      print(directory.uri);
      print(directory.parent);
    }else{
      print('not exists');
      directory.create();
    }*/
    //print(directory);
    //print(contents.length);
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {

  List contents = [];

  Future _localPathDirList() async {
    final directory = Directory(
        "storage/emulated/0/Android/data/com.example.directory/files");
    contents = directory.listSync();
    for (var fileOrDir in contents) {
      if (fileOrDir is File) {
        print(fileOrDir.toString());
        setState(() {
          fileOrDirx = fileOrDir.toString();
        });
      }
      else if (fileOrDir is Directory) {
        print(fileOrDir.toString());
        setState(() {
          fileOrDirx = fileOrDir.path;
        });
      }
    }
    //print(directory);
    //print(contents.length);
  }

  String asset1 = 'Assets';
  int counter = 1;
  String fileOrDirx = 'fileOrDir';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xxx',
      home: Scaffold(
        appBar: AppBar(title: Text('File')),
        body: Center(
          child: Column(
            children: [
              Text('xxxx'),
              ElevatedButton(
                  onPressed: () async {
                    await widget.writeCounter(3);
                    print(await widget.readCounter());
                  },
                  child: Text('String List')
              ),
              ElevatedButton(
                  onPressed: () async {
                    print(await widget._localPath);
                    //await widget.writeCounter(3);
                    //print(await widget.readCounter());
                    print('Dir');
                  },
                  child: Text('Path Dir')
              ),
              Text(asset1),
              ElevatedButton(
                  onPressed: () async {
                    await widget._localPathRead();
                    print('Dir Read');
                  },
                  child: Text('Dir Read')
              ),
              ElevatedButton(
                  onPressed: () async {
                    await widget._localPathCreate();
                    print('Dir Create');
                  },
                  child: Text('Dir Create')
              ),
              ElevatedButton(
                  onPressed: () async {
                    await widget._localPathDeneme();
                    print('Dir Deneme');
                  },
                  child: Text('Dir Deneme')
              ),
              ElevatedButton(
                  onPressed: () async {
                    //await widget._localPathDirList();
                    await _localPathDirList();
                    print('Dir Liste');
                  },
                  child: Text('Dir Liste')
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                    itemCount:contents.length,
                    itemBuilder:(BuildContext context, int index){
                      if(contents[index] is File){
                        return ListTile(title:Text(contents[index].toString()));
                      }
                      else if(contents[index] is Directory){
                        //return Text(contents[index].toString());
                        return ListTile(title:Text(contents[index].toString()));
                      }
                      return Text('bos');
                    }
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    //await widget._localPathDirList();
                    await widget.fileRead();
                    print('File Read');
                  },
                  child: Text('File Read')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
