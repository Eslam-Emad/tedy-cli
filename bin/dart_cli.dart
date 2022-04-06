import 'dart:io';

void main(List<String> arguments) {
  // print('Hello world: ${dart_cli.calculate()}!');
  print('whatis folder name ');
  final folderName = stdin.readLineSync();
  print(folderName);
  print(Directory.current);
  final path = Directory.current.path;
  final folderPath = "$path\\$folderName";
  Directory(folderPath)
      .create()
      .then((value) => print(
          "your folder created with name: $folderName \n path: $folderPath"))
      .catchError((e) => print(e));
}
