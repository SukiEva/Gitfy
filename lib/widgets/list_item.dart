import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitfy/common/launcher.dart';

class ListItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? launch;

  final void Function(bool)? onTrailingChanged;
  final void Function()? onTap;

  const ListItem(
      {Key? key,
      required this.icon,
      required this.title,
      this.subtitle,
      this.onTrailingChanged,
      this.onTap,
      this.launch})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListItem();
}

class _ListItem extends State<ListItem> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        widget.icon,
      ),
      title: Text(widget.title),
      subtitle: widget.subtitle == null ? null : Text(widget.subtitle!),
      trailing: buildTrailing(context),
      onTap: buildOnTap(context),
    );
  }

  Widget? buildTrailing(BuildContext context) {
    if (widget.onTrailingChanged == null) return null;
    var color = Theme.of(context).colorScheme;
    return CupertinoSwitch(
      onChanged: (value) {
        setState(() {
          _switchValue = value;
          widget.onTrailingChanged!(value);
        });
      },
      value: _switchValue,
      activeColor: color.primary,
      thumbColor: color.onSecondary,
      trackColor: color.surfaceVariant,
    );
  }

  void Function()? buildOnTap(BuildContext context) {
    if (widget.launch == null) return widget.onTap;
    return () {
      launch(widget.launch!);
    };
  }
}
