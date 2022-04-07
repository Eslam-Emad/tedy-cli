
import 'dart:io';

import 'package:dart_cli/tedyCLI.dart';

class CreatorCommander extends Commander{
  // TODO : create meta model for folders and files 
  final List<String> folderNames =["application" , "infrastructure" ,"domain","presentation" , "presentation/components" ,  "presentation/pages" ,  "presentation/routes" , ];
  @override
  run() {
  print('Creating Folder... ');
  _createFolders();
  writeToFile(path: "presentation/routes" , name: "routes.dart" , content: "class Routes{}");
 
  }

  _createFolders(){
    for(int i = 0 ;i < folderNames.length ;i++){
      _createFolder(folderNames[i]);
    }
    
  }
  _createFolder(folderName){
     final path = Directory.current.path;
     print("this is current path : $path");
     final folderPath = getPlatformPath(path , folderName!);
     Directory(folderPath)
      .create()
      .then((value) => print(
          "your folder created with name: $folderName path: $folderPath"))
      .catchError((e) => print(e));
  }
}