import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;

  final void Function()? onTrailingPressed;
  final void Function()? onTap;

  const CardItem(
      {Key? key,
      this.icon,
      required this.title,
      this.subtitle,
      this.trailing,
      this.onTrailingPressed,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: buildLeading(context),
        title: Text(title),
        subtitle: subtitle == null ? null : Text(subtitle!),
        trailing: buildTrailing(context),
        onTap: onTap,
      ),
    );
  }

  Widget? buildLeading(BuildContext context) {
    return FaIcon(
      icon ?? FontAwesomeIcons.github,
      size: 40,
    );
  }

  Widget? buildTrailing(BuildContext context) {
    return onTrailingPressed == null
        ? null
        : IconButton(
            icon: const Icon(Icons.add),
            onPressed: onTrailingPressed,
          );
  }
}
