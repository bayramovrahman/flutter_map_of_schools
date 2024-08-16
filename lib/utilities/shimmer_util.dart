import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUtils {

  static ListView shimmerListTile() {
    return ListView.builder(
      itemCount: 12,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListTile(
            title: Container(
              height: 40,
              color: Colors.grey[300],
            ),
            trailing: Container(
              height: 40,
              width: 16,
              color: Colors.grey[300],
            ),
          ),
        );
      },
    );
  }
}
