import 'package:flutter/material.dart';

class RowWithListTileWidget extends StatelessWidget {
  const RowWithListTileWidget({
    super.key,
    required this.title,
    this.onTap,
    required this.subTitle,
    this.maxLines = 2,
  });
  final int maxLines;
  final void Function()? onTap;
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            visualDensity: const VisualDensity(vertical: -4),
            dense: true,
            title: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        Flexible(
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            visualDensity: const VisualDensity(vertical: -4),
            dense: true,
            onTap: onTap,
            subtitle: Text(
              subTitle,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}
