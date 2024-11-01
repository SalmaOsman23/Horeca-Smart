import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key, required this.stateTitle});
  final String stateTitle; 

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}