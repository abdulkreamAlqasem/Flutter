import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_page/credit_card.dart';
import 'package:payment_page/payment_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Payment_page(),
      debugShowCheckedModeBanner: false,
    );
  }
}
