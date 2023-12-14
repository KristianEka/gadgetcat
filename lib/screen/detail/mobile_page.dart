import 'package:flutter/material.dart';
import 'package:gadgetcat/model/gadget.dart';
import 'package:gadgetcat/screen/detail_screen.dart';
import 'package:gadgetcat/widget/favorite.dart';
import 'package:gadgetcat/widget/pricebox.dart';

class DetailMobilePage extends StatelessWidget {
  final Gadget gadget;

  const DetailMobilePage({super.key, required this.gadget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Center(
                  child: Hero(
                    tag: gadget.id,
                    child: Image.network(gadget.thumbnail),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const FavoriteButton(),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text(
                gadget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'Oswald',
                ),
              ),
            ),
            PriceBox(
              discount: gadget.discountPercentage,
              price: gadget.price,
              rating: gadget.rating,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.category),
                      const SizedBox(height: 8),
                      const Text(
                        'Category',
                        style: informationTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(gadget.category),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.branding_watermark),
                      const SizedBox(height: 8),
                      const Text(
                        'Brand',
                        style: informationTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(gadget.brand),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.warehouse),
                      const SizedBox(height: 8),
                      const Text(
                        'Stock',
                        style: informationTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Text('${gadget.stock} pcs'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                gadget.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: gadget.images.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
