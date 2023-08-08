
import 'dart:io';

import 'package:dart_cli/src/constants/templates.dart';
import 'package:dart_cli/tedyCLI.dart';

class CreatorCommander extends Commander{
  final List<String> folderNames =["application" , "infrastructure" ,"domain","presentation" , "presentation/components" ,  "presentation/pages" ,  "presentation/routes" , ];
  // This is the main method that creates the necessary folders and files for the project.
  @override
  run() {
  print('Creating Folder... ');
  _createFolders();
  // route class
  final tempHomeRoute = "static const String home = '/';";
  final routeClass = classTemplate.replaceAll(className , "Routes").replaceAll(classBody, tempHomeRoute);
  writeToFile(path: "presentation/routes" , name: "routes.dart" , content: routeClass);
  // route generator class
  writeToFile(path: "presentation/routes" , name: "route_generator.dart" , content: routeGeneratorClass);
  // route home widget
  writeToFile(path: "presentation/pages" , name: "home_page.dart" , content: homePageClass);
 
  }

  // This method iterates over the folderNames list and creates a folder for each name.
  _createFolders(){
    for(int i = 0 ;i < folderNames.length ;i++){
      _createFolder(folderNames[i]);
    }
    
  }
  // This method creates a single folder with the given name.
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