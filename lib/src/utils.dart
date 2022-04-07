import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:dart_cli/tedyCLI.dart';

getPlatformPath(String path , String folderName){
  if (Platform.isWindows) {
   return "$path\\$libFolder\\$folderName";
} else if (Platform.isLinux || Platform.isMacOS ) {
  return "$path/$libFolder/$folderName";
}
}


Commander parseArguments(List<String> arguments){
  if(arguments.contains("create")){
     return CreatorCommander();
  }
  return MainConmander();

}

	/// Writes given [content] to the file with given [name] at given [path].
void writeToFile({String? name, String? path, required String content}) {
  if (!Directory(p.join(libFolder, path)).existsSync()) {
    Directory(p.join(libFolder, path)).createSync(recursive: true);
    // throw Exception("Please Create In Lib Folder");
  }
  var classFile = File(p.join(libFolder, path, name));
  classFile.writeAsStringSync(content);
  log('File ${p.basename(classFile.path)} is written successfully');
}
