import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/cart_screen.dart';
import 'first_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_ordering_app/widgets/food_items.dart';
import 'package:provider/provider.dart';
import 'package:food_ordering_app/models/cart_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Padding(padding: EdgeInsets.only(right: 25, top: 10),
              child: GestureDetector(
                   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                     return CartScreen();
                   })),
                  child: Container(
                    height: 60,width: 60,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[300]),
                      child: Center(child: Icon(Icons.shopping_bag_outlined, size: 44, color: Colors.black,)))))
            ],
            leading: IconButton(
                color: Colors.black,
                iconSize: 32,
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => FirstPage())),
                icon: Icon(Icons.arrow_back_ios_new))),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Text(
                'Hello my friend...',
                style: GoogleFonts.nobile(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.green.shade800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 25),
              child: Text(
                'Let\'s order your favourite food !',
                style: GoogleFonts.nobile(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 25, right: 30),
              child: Divider(
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Text(
                'Fresh items',
                style: GoogleFonts.nobile(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            Expanded(
                child: Consumer<CartModel>(builder: (context, value, child) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                        childAspectRatio: 1/1.3),
                  itemCount: value.foods.length,
                  itemBuilder:  (context, index) {
                    return FoodItems(name: value.foods[index][0],
                                    price: value.foods[index][1],
                                    imagepath: value.foods[index][2],
                                    onPressed:() => Provider.of<CartModel>(context,listen: false).addItems(index),
                                     );
                  },
                  );
                }) )
          ],
        ),
      ),
    );
  }
}
