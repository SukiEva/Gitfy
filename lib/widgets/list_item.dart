import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitfy/common/launcher.dart';

class ListItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String? body;
  final String? launch;

  final void Function(bool)? onTrailingChanged;
  final void Function()? onTap;

  const ListItem(
      {Key? key,
      required this.icon,
      required this.title,
      this.body,
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
    var color = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(widget.icon),
      title: Text(widget.title),
      subtitle: widget.body == null ? null : Text(widget.body!),
      trailing: widget.onTrailingChanged == null
          ? null
          : CupertinoSwitch(
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
            ),
      onTap: widget.launch == null
          ? widget.onTap
          : () {
              launch(widget.launch!);
            },
    );
  }
}
