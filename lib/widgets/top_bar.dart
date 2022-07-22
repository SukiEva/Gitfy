import 'package:flutter/material.dart';

class TopBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;

  final IconData? leading;
  final void Function()? onLeadingPressed;

  final List<Widget>? actions;

  const TopBar(
      {Key? key, this.title, this.leading, this.onLeadingPressed, this.actions})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading == null
          ? null
          : IconButton(
              icon: Icon(leading),
              onPressed: onLeadingPressed ??
                  () {
                    Navigator.pop(context);
                  },
            ),
      title: title == null ? null : Text(title!),
      actions: actions,
      elevation: 0,
    );
  }
}
