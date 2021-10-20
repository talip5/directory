import 'dart:io';

Future main() async{
  File f=new File('C:\\test\\myfile.txt');
  //f.writeAsStringSync('Hello Dart');
  print(await f.readAsStringSync());
  print('xxxx');
}