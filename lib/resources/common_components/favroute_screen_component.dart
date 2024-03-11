import 'package:flutter/material.dart';
import 'package:weddingaro_user_app/resources/color.dart';

class FavoriteIconComponent extends StatefulWidget {
  const FavoriteIconComponent({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteIconComponentState createState() => _FavoriteIconComponentState();
}

class _FavoriteIconComponentState extends State<FavoriteIconComponent> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _isFavorite
          ? const Icon(Icons.favorite, size: 30)
          : const Icon(
              Icons.favorite_border,
              color: AppColors.whiteColor,
              size: 30,
            ),
      color: _isFavorite ? Colors.red : null,
      onPressed: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
      },
    );
  }
}
