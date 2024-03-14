import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 60, bottom: 50),
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 123,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          'lib/pics/firstfood.jpeg',
                        ),
                        radius: 120,
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                  child: Text(
                    'Fast delivery at your doorstep',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nobile(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 50),
                  child: Text(
                    'Home delivery and online reservation system for restaurants & cafe',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nobile(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomePage())),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 90, right: 90, top: 12, bottom: 12),
                    child: Text(
                      'Let\'s Explore',
                      style: TextStyle(
                          color: Colors.green.shade800,
                          fontSize: 23,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
