//https://flutter.dev/docs/cookbook/persistence/reading-writing-files

import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:directory/models/functions.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  Functions functions = Functions();
  Functions functions1 = Functions();
  List contents1 = [];

  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {

  String textClass = 'textClass';

  //String initialValue = 'Kevin A.';
  /* TextEditingController controller = new TextEditingController(
      text: initialValue
  );*/

  /*controller.selection = new TextSelection(
  baseOffset: 0,
  extentOffset: initialValue.length,
  );*/

  TextEditingController myController = TextEditingController(text: initialValu);
  String directoryName = 'directoryName';
  Color textFieldColor = Colors.blueGrey;

  static var initialValu = 'deneme';

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  String asset1 = 'Assets';
  int counter = 1;
  String fileOrDirx = 'fileOrDir';

  void yaz() {
    print('textEditCompletioned');
  }

  colorTextEdit() {
    setState(() {
      textFieldColor = Colors.lightBlue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xxx',
      home: Scaffold(
        appBar: AppBar(title: Text('File')),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: widget.contents1.length,
                    itemBuilder: (BuildContext context,int index){
                    if(widget.contents1[index] is Directory){
                      return ListTile(
                        leading: Icon(Icons.folder),
                        title: Text(widget.contents1[index].toString()),
                      );
                    }
                    if(widget.contents1[index] is File){
                      return ListTile(
                        leading: Icon(Icons.file_present),
                        title: Text(widget.contents1[index].toString()),
                      );
                    }
                    return Text('bos');
                // return Text(widget.contents1[index].toString());
                    }
                    ),
              ),
              Text(textClass),
              ElevatedButton(
                  onPressed: () async {
                    //textClass = widget.functions.localPathDeneme3();
                    widget.contents1= await widget.functions.localPathDirList();
                    //textClass=widget.contents1.length.toString();
                    setState(() {
                      textClass;
                    });
                    print('Dir Deneme');
                  },
                  child: Text('Dir Deneme')),
              /*ElevatedButton(
                  onPressed: () async {
                    //await widget._localPathDirList();
                   await _localPathDirList();
                    //await widget.functions.localPathDirList();
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
                        File? fileContents=contents[index];
                        String fileName1=fileContents!.path;
                        fileSingle=fileName1.split('/').last;
                        return Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                          child: Card(
                            color: Colors.grey,
                            child: ListTile(
                              leading: Icon(Icons.file_present),
                              onTap: (){
                                //print(contents[index].toString());
                                print(fileSingle);
                              },
                               // title:Text(contents[index].toString())),
                                title:Text(fileSingle)),
                          ),
                        );
                      }
                      else if(contents[index] is Directory){
                        Directory? dirContents=contents[index];
                      String dirName1=dirContents!.path;
                        dirSingle=dirName1.split('/').last;
                        //return Text(contents[index].toString());
                        return Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                          child: Card(
                            color: Colors.blueGrey,
                            child: ListTile (
                                leading: Icon(Icons.store_mall_directory_outlined),
                                onTap: () async{
                                    print(dirSingle);
                                    deleteDirectory=contents[index];
                                    deleteDirectory!.delete().then((value) =>{
                                      setState(() {
                                        _localPathDirList();
                                      })
                                    });
                                },
                                //title:Text(contents[index].toString())),
                              title:Text(dirSingle),
                          ),
                        ),
                        );
                      }
                      return Text('bos');
                    }
                ),
              ),
              Row(
                children: [
                 SizedBox(width: 20.0),
                  //Text(),
                  Expanded(
                    child: TextField(
                      onChanged:(value){
                        print(value);
                        setState(() {
                          textFieldColor=Colors.lightGreen;
                        });
                      },
                      onEditingComplete: yaz,
                      controller: myController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textFieldColor,
                        border: OutlineInputBorder(),
                        labelText: directoryName,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                      onPressed: () async {
                        if(myController.text.isNotEmpty) {
                          String xfolderName = await widget.folderName;
                          xfolderName = myController.text;
                          //await widget._localPathDirList(xfolderName);
                          await widget._localPathCreate(xfolderName).then((
                              value) =>
                          {
                            setState(() {
                              _localPathDirList();
                              myController.text = '';
                              textFieldColor=Colors.lightBlue;
                            })
                          });
                          print('Create Directory ');
                          print(myController.text);
                        }else {
                          setState(() {
                            directoryName='directoryName enter';
                            textFieldColor=Colors.redAccent;
                          });
                        }
                      },
                      child: Text('Create Directory')
                  ),
                ],
              ),
             // SizedBox(height:50.0),*/
            ],
          ),
        ),
      ),
    );
  }
}
