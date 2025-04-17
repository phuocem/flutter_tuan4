import 'package:flutter/material.dart';
import 'package:flutter_tuan4/pages/information.dart';
import 'package:flutter_tuan4/pages/layout_page.dart';
import 'package:flutter_tuan4/modles/store_modle.dart';
import 'package:flutter_tuan4/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.teal,
        ),
        home:  LayoutPage(),
        onGenerateRoute: (settings) {
          if (settings.name == '/info') {
            final course = settings.arguments as Course;
            return MaterialPageRoute(
              builder: (context) => Information(course: course),
            );
          }
          return null;
        },
      ),
    );
  }
}
