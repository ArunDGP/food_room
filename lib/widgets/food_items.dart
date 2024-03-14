import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';

class FoodItems extends StatefulWidget {
  final String name;
  final String imagepath;
  final String price;
  void Function()? onPressed;
  FoodItems(
      {required this.name,
      required this.price,
      required this.imagepath,
      this.onPressed});

  @override
  State<FoodItems> createState() => _FoodItemsState();
}

class _FoodItemsState extends State<FoodItems> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          color: Colors.green.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                        height: 110,
                        width: 110,
                        child: Image.asset(
                          widget.imagepath,
                          height: 90,
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.name,
                    style: GoogleFonts.nobile(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green.shade800,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        '₹' + widget.price,
                        style: GoogleFonts.nobile(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => setState(() {
                              favorite = !favorite;
                            }),
                        icon: favorite
                            ? Icon(
                                Icons.favorite_rounded,color: Colors.red,
                              )
                            : Icon(Icons.favorite_border_rounded)),
                    IconButton(
                        onPressed: widget.onPressed,
                        icon: Icon(Icons.add_shopping_cart_outlined)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
