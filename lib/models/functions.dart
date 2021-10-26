import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class Functions {

  String name = 'Ali';
  final folderName = 'dir';

  List contents = [];
  Directory? deleteDirectory;
  String dirSingle = '';
  String fileSingle = '';

  oku() {
    print('Oku');
  }

  Directory localPathDirectory(){
   Directory directory = Directory("storage/emulated/0/Android/data/com.example.directory/files");
    return directory;
  }

  String localPathDeneme3(){
    final folderName = 'dir';
    final directory = Directory(
        "storage/emulated/0/Android/data/com.example.directory/files/$folderName");
    dirSingle=directory.path;
    /*if (await directory.exists()) {
      print('exists');
      directory.delete();
    } else {
      print('not exists');
      directory.create();
    }*/
    print(directory);
    return dirSingle;
  }

  Future<List> localPathDirList() async {
    final directory = Directory("storage/emulated/0/Android/data/com.example.directory/files");
    contents = directory.listSync();
    for (var fileOrDir in contents) {
      if (fileOrDir is File) {
        print(fileOrDir.toString());
      }
      else if (fileOrDir is Directory) {
        print(fileOrDir.toString());
      }
    }
    return contents;
  }


/*Future localPathDirList() async {
    final directory = Directory("storage/emulated/0/Android/data/com.example.directory/files");
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
  }*/

 /* Future fileRead() async {
    final folderName = 'dir';
    final directoryPath =Directory("storage/emulated/0/Android/data/com.example.directory/files");
    final filex=directoryPath.path;
    final filey=File(filex+'counter.txt');
    print(filex);
    print(filey);
    // return directory.path;
  }*/

  /*Future localPathCreate(String folderName) async {

    final directory =Directory("storage/emulated/0/Android/data/com.example.directory/files/$folderName");
    //final directory = Directory('storage/1000-3B08/Android/data/com.example.directory/files/$folderName');
    if (await directory.exists()) {
      print('exists');
    } else {
      print('not exists');
      directory.create();
    }
    print(directory);
  }*/

  /*Future<String> get _localPath async {
    //final directory = await getApplicationDocumentsDirectory();
    //final directory = await getExternalStorageDirectory(); telefonda ve emulatorda kullanilan directory
    final directory = await getExternalStorageDirectory();
    // var directory=await Directory('dir').create(recursive: true);
    print(directory);
    return directory!.path;
  }*/



  /*Future _localPathCreate1() async {
    final folderName = 'dir';
    final directory =Directory("storage/emulated/0/Android/data/com.example.directory/files/$folderName");
    //final directory = Directory('storage/1000-3B08/Android/data/com.example.directory/files/$folderName');
    if (await directory.exists()) {
      print('exists');
    } else {
      print('not exists');
      directory.create();
    }
    print(directory);
  }*/

  /*Future _localPathRead() async {
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
  }*/

  /*Future _localPathDeneme2() async {
    final directory = Directory("storage/emulated/0/Android/data/com.example.directory/files");
    //List contents = directory.listSync();
    List contents =await directory.listSync();

    print(contents.length);
    print(contents.first.toString());
    print(contents.isEmpty);
    print(contents.iterator.runtimeType);
    print(contents.toList().length);
    // print(contents.);
    //Directory dir2=Directory('storage/emulated/0/Android/data/com.example.directory/files/dir2');
    //contents.add(dir2);
  }*/

  /*Future _localPathDeneme() async {
    // final evenNumbers = myList1.where((element) => element.isEven);
    //print(evenNumbers);
    String dirName5;
    final folderName = 'dir';
    final directory = Directory(
        "storage/emulated/0/Android/data/com.example.directory/files/$folderName");
    dirName5 = directory.path;
    var dirSingle5 = dirName5.split('/').elementAt(3);
    print(dirName5);
    print(dirSingle5);
    print(dirName5
        .split('/')
        .length);
  }*/

  /*Future _localPathDeneme1() async {
    final directory = Directory("storage/emulated/0/Android/data/com.example.directory/files");
    final myList = [2, 4, 6];
    for (var number in myList) {
      print(number);
    }
    *//*final myMap = {'a': 1, 'b':2, 'c':3};
    for (var element in myMap) {
      print(element);
    }*//*

    final myMap = {'a': 1, 'b':2, 'c':3};
    for (var key in myMap.keys) {
      print('key: $key, value: ${myMap[key]}');
      // print('value --- ${myMap[key]}');
    }

    const myList1 = [1, 2, 3, 4, 5, 6, 7, 8];
    final evenNumbers = myList1.where((element) => element.isEven);
    print(evenNumbers);
    print(evenNumbers.toList());

    Iterable<int> iterable = [1, 2, 3];
    int value = iterable.elementAt(1);
    print(value);
  }*/

  /*Future _localPathDirList1() async {
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
  }*/
}