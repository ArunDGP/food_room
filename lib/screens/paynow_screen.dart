import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/cart_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class PayNowScreen extends StatelessWidget {
  const PayNowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              color: Colors.green.shade800,
              iconSize: 32,
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => CartScreen())),
              icon: Icon(Icons.arrow_back_ios_new))),
        body: Center(child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            '> Your order and payment are received, we will deliver your food within one hour. Have a nice day !',
            style: GoogleFonts.nobile(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.green.shade800),
          ),
        ),),
    );
  }
}
