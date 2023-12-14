import 'package:flutter/material.dart';
import 'package:gadgetcat/widget/favorite.dart';
import 'package:gadgetcat/widget/pricebox.dart';

import '../model/gadget.dart';

const TextStyle informationTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
  fontSize: 14,
);

class DetailScreen extends StatelessWidget {
  final Gadget gadget;

  const DetailScreen({super.key, required this.gadget});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 600) {
        return DetailWebPage(gadget: gadget);
      } else {
        return DetailMobilePage(gadget: gadget);
      }
    });
  }
}

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

class DetailWebPage extends StatefulWidget {
  final Gadget gadget;

  const DetailWebPage({super.key, required this.gadget});

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 64,
          ),
          child: Center(
            child: SizedBox(
              width: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
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
                              const SizedBox(width: 24),
                              const FavoriteButton(),
                            ],
                          ),
                        ),
                      ),
                      const Text(
                        'Detail Gadget',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Oswald',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                widget.gadget.thumbnail,
                                height: 300,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Scrollbar(
                              controller: _scrollController,
                              child: Container(
                                height: 150,
                                padding: const EdgeInsets.only(bottom: 16),
                                child: ListView(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  children: widget.gadget.images.map((url) {
                                    return Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: Image.network(url),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  widget.gadget.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Oswald',
                                  ),
                                ),
                                const SizedBox(height: 12),
                                PriceBox(
                                  discount: widget.gadget.discountPercentage,
                                  price: widget.gadget.price,
                                  rating: widget.gadget.rating,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        Text(widget.gadget.category),
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
                                        Text(widget.gadget.brand),
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
                                        Text('${widget.gadget.stock} pcs'),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 14),
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    widget.gadget.description,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
