import 'package:dart_cli/tedyCLI.dart';

const String class_template = ''' 
class [CLASS_NAME]{
  [BODY]
}
''';


String routeGeneratorClass = '''

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import 'routes.dart';


${class_template.replaceAll(className, "RouteGenerator").replaceAll(classBody, """
 static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.home:
        return CupertinoPageRoute(builder: (_) => const HomePage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body:const Center(
          child: Text('Error'),
        ),
      );
    });
  }
  """)}

''';

String homePageClass = '''

import 'package:flutter/material.dart';


${class_template.replaceAll(className, "HomePage extends StatelessWidget").replaceAll(classBody,"""
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
""")}


''';