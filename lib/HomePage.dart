import 'package:flutter/material.dart';
import 'package:flutterf/ApiProvider.dart';
import 'package:flutterf/Product_model.dart';

import 'package:flutterf/categorey.dart';
import 'package:flutterf/custom_main_product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Category1> names = const [
    Category1(
      name: "fouad",
      message: "this is my name",
      price: 90,
      image: 'hfiohfdaih',
    ),
    Category1(
      name: "samy",
      message: "this is my name",
      price: 70,
      image: 'bjvbjbv',
    ),
    Category1(
      name: "ramadan",
      message: "this is my name",
      price: 50,
      image: 'gfdiu',
    ),
    Category1(
      name: "ebrahiem",
      message: "this is my name",
      price: 30,
      image: 'fgu',
    ),
    Category1(
        name: "elozery", message: "this is my name", price: 20, image: 'yuufj'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HOME",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 48,
        ),
        child: FutureBuilder(
          future: ApiProvider().getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ProductsModel data = snapshot.data!;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 48,
                  childAspectRatio: 0.6,
                ),
                itemCount: data.products!.length,
                itemBuilder: (context, index) => Transform.translate(
                  offset: Offset(0, index.isOdd ? 36 : 0),
                  child: CustomMainProductCard(
                    product: data.products![index],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Container(
                height: 400,
                color: Colors.red,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
