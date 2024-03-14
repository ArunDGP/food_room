import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/first_page.dart';
import 'package:provider/provider.dart';
import 'package:food_ordering_app/models/cart_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.green.shade600),
          home: FirstPage(),
        ));
  }
}
