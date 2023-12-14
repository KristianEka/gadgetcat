import 'package:flutter/material.dart';
import 'package:gadgetcat/model/gadget.dart';
import 'package:gadgetcat/screen/detail_screen.dart';
import 'package:gadgetcat/widget/favorite.dart';
import 'package:gadgetcat/widget/pricebox.dart';

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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
