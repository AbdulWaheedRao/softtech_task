import 'package:flutter/material.dart';
import 'package:flutter_softtech_task/main.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail(
      {super.key,
      required this.title,
      required this.image,
      required this.category,
      required this.description,
      required this.price});
  dynamic title;
  dynamic price;
  dynamic description;
  dynamic category;
  dynamic image;
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
    clientHeight = screenHeight - kToolbarHeight;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade100,
        title: const Text('DetailProduct'),
        centerTitle: true,
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: screenWidth * 0.6,
                height: clientHeight * 0.3,
                child: Image.network(
                  widget.image,
                  fit: BoxFit.fill,
                )),
          ),
          SizedBox(
              width: screenWidth * 0.6,
              height: clientHeight * 0.1,
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
          SizedBox(
              width: screenWidth * 0.4,
              height: clientHeight * 0.1,
              child: FittedBox(
                  child: Text(
                widget.category,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ))),
          SizedBox(
              width: screenWidth * 0.2,
              height: clientHeight * 0.05,
              child: FittedBox(
                  child: Text(
                widget.price.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ))),
          SizedBox(
              width: screenWidth * 0.7,
              height: clientHeight * 0.2,
              child: Text(
                widget.description,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ))
        ]),
      ),
    );
  }
}
