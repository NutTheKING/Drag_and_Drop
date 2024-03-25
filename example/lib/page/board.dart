import 'package:example/page/board_model.dart';
import 'package:flutter/material.dart';

class BoardCard extends StatelessWidget {
  final BoardItemModel item;
  final Function() onTap;

  const BoardCard({super.key, required this.item, required this.onTap});

  // void _handleItemTap() => onTap(item);
  // debugPrint('==============> Ontap Card');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // {
      //debugPrint('==============> Ontap Card');
      //_handleItemTap;
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(const SnackBar(content: Text('Item tap')));
      //},
      child: Card(
        child: ClipPath(
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(item.title, maxLines: 1),
                Opacity(opacity: 0.6, child: Text(item.subtitle, maxLines: 1)),
                Opacity(
                    opacity: 0.6, child: Text(item.description, maxLines: 1)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
