import 'package:flutter/material.dart';
import 'package:gadgetcat/model/gadget.dart';
import 'package:gadgetcat/screen/detail_screen.dart';

import '../widget/pricebox.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GadgetCat',
          style: TextStyle(
            fontFamily: 'Osward',
            fontSize: 30.0,
          ),
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return const GadgetListGrid(gridCount: 2);
        } else if (constraints.maxWidth <= 800) {
          return const GadgetListGrid(gridCount: 3);
        } else if (constraints.maxWidth <= 1200) {
          return const GadgetListGrid(gridCount: 4);
        } else {
          return const GadgetListGrid(gridCount: 6);
        }
      }),
    );
  }
}

class GadgetListGrid extends StatelessWidget {
  final int gridCount;

  const GadgetListGrid({super.key, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: gadgetList.map((gadget) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(gadget: gadget);
              }));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: gadget.id,
                      child: Image.network(
                        gadget.thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      gadget.title,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  PriceBox(
                    discount: gadget.discountPercentage,
                    price: gadget.price,
                    rating: gadget.rating,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
