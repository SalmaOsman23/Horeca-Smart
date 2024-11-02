import 'package:flutter/material.dart';
import 'package:horeca_smart/core/components/empty_cart_widget.dart';
import 'package:horeca_smart/core/utils/app_assets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmptyCartWidget()
      ],
    );
  }
}