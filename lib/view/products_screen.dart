import 'package:flutter/material.dart';
import 'package:flutter_softtech_task/controller/api_services.dart';
import 'package:flutter_softtech_task/main.dart';
import 'package:flutter_softtech_task/model/products_model.dart';
import 'package:flutter_softtech_task/view/productdetail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
    clientHeight = screenHeight - kToolbarHeight;
    ApiProvider apiProvider = ApiProvider();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey.shade100,
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: FutureBuilder(
          future: apiProvider.fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Product product = snapshot.data![index];
                  return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        child: Center(
                          child: Container(
                            width: screenWidth * 0.9,
                            height: clientHeight * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade50,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: screenWidth * 0.3,
                                          height: clientHeight * 0.2,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15)),
                                            child: Image.network(
                                              product.image.toString(),
                                              fit: BoxFit.fill,
                                            ),
                                          )),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: SizedBox(
                                            width: screenWidth * 0.2,
                                            height: clientHeight * 0.03,
                                            child: Text(
                                              product.title.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: SizedBox(
                                            width: screenWidth * 0.2,
                                            height: clientHeight * 0.03,
                                            child: Text(
                                                product.price.toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: SizedBox(
                                            width: screenWidth * 0.2,
                                            height: clientHeight * 0.03,
                                            child: Text(
                                                product.category.toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ),
                                    ]),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: screenWidth * 0.3,
                                    height: clientHeight * 0.2,
                                    child: Text(product.description.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetail(
                                title: product.title,
                                image: product.image,
                                category: product.category,
                                description: product.description,
                                price: product.price),
                          ));
                        },
                      ));
                },
              );
            } else {
              return const Text('Something went Wrong');
            }
          },
        ),
      )),
    );
  }
}
