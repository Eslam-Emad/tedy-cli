import 'package:dart_cli/src/commands/command.dart';

import '../constants/tedy_cli.dart';

class MainConmander extends Commander{
  @override
  run() {
    print(tedyCLI);
  }

}