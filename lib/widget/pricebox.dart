import 'package:flutter/material.dart';

class PriceBox extends StatefulWidget {
  const PriceBox(
      {super.key,
      required this.discount,
      required this.price,
      required this.rating});

  final double discount;
  final double price;
  final double rating;

  @override
  State<PriceBox> createState() => _PriceBox();
}

class _PriceBox extends State<PriceBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                '\$${widget.price - (widget.price * widget.discount / 100)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          '${widget.discount}%',
                          style: const TextStyle(
                            fontSize: 8,
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '\$${widget.price}',
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.orangeAccent,
                size: 15,
              ),
              Text('${widget.rating}'),
            ],
          ),
        ],
      ),
    );
  }
}
