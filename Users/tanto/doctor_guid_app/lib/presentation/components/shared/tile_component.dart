import 'package:flutter/material.dart';

class TileComponent extends StatelessWidget {
  const TileComponent({
    super.key,
    required this.title,
    this.onTap,
    this.leadingIcon = Icons.diamond,
  });

  final String title;
  final Function()? onTap;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      leading: Icon(leadingIcon),
      onTap: onTap,
      title: Text(
        title,
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
