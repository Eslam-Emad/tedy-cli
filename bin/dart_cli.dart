import 'package:dart_cli/tedyCLI.dart';

void main(List<String> arguments) {
  // print('Hello world: ${dart_cli.calculate()}!');

  final Commander commander = parseArguments(arguments);
 commander.run();
}










