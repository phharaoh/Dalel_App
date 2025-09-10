import 'package:flutter/material.dart';
import 'package:dalel/core/functions/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedNetworkImg extends StatelessWidget {
  const CachedNetworkImg({super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: '',
      placeholder: (context, url) => const ShimmerWidget(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
