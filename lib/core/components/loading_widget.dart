import 'package:flutter/material.dart';
import 'package:horeca_smart/core/utils/app_assets.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.width, this.height});
  final double? width, height;
  

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: height ?? 190,
        width: width ?? 290,
        child: Image.asset(AppAssets.loadingGif))
        ,
      ),
    );
  }
}