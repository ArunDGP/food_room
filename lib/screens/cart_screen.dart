import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/home_page.dart';
import 'package:food_ordering_app/screens/paynow_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:food_ordering_app/models/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                  color: Colors.black,
                  iconSize: 32,
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomePage())),
                  icon: Icon(Icons.arrow_back_ios_new))),
          body: Consumer<CartModel>(builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    'Your food selection',
                    style: GoogleFonts.nobile(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.green.shade800),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: value.cartItems.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 17, right: 17, top: 19),
                            child: ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                tileColor: Colors.green[100],
                                title: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    value.cartItems[i][0],
                                    style: GoogleFonts.nobile(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    '\₹' + value.cartItems[i][1],
                                    style: GoogleFonts.nobile(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                leading: Container(
                                  height: 90,
                                  width: 90,
                                  child: Image.asset(
                                    value.cartItems[i][2],
                                     fit: BoxFit.fill,
                                  ),
                                ),
                                trailing: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: InkWell(
                                    child: Ink(
                                        child: Icon(Icons.cancel_rounded, size: 36)),
                                  onTap: ()=> value.removeItems(i),
                                   highlightColor: Colors.orange,

                                  ),
                                )),
                          );
                        })),
                Container(
                  height: 100,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22)),
                    color: Colors.green[800],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Total Price',
                              style: GoogleFonts.nobile(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              '\₹' + value.totalPrice(),
                              style: GoogleFonts.nobile(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return PayNowScreen();
                            },),),
                          child: Container(
                            child: Text(
                              'Pay now',
                              style: GoogleFonts.nobile(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          })),
    );
  }
}
