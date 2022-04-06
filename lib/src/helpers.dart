import 'dart:io';

import 'package:dart_cli/tedyCLI.dart';

getPlatformPath(String path , String folderName){
  if (Platform.isWindows) {
   return "..\\lib\\$folderName";
} else if (Platform.isLinux || Platform.isMacOS ) {
  return "../lib/$folderName";
}
}


Commander parseArguments(List<String> arguments){
  if(arguments.contains("create")){
     return CreatorCommander();
  }
  return MainConmander();

}
