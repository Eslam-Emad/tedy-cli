import 'package:dart_cli/tedyCLI.dart';

void main(List<String> arguments) {
  final Commander commander = parseArguments(arguments);
 commander.run();
}