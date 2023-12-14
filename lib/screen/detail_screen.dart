import 'package:flutter/material.dart';
import 'package:gadgetcat/model/gadget.dart';
import 'package:gadgetcat/screen/detail/mobile_page.dart';
import 'package:gadgetcat/screen/detail/web_page.dart';

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
