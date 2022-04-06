import 'dart:io';

import 'package:dart_cli/tedyCLI.dart';

getPlatformPath(String path , String folderName){
  if (Platform.isWindows) {
   return "$path\\$folderName";
} else if (Platform.isLinux || Platform.isMacOS ) {
  return "$path/$folderName";
}
}


Commander parseArguments(List<String> arguments){
  if(arguments.contains("create")){
     return CreatorCommander();
  }
  return MainConmander();

}
