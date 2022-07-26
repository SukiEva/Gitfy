import 'package:flutter/material.dart';
import 'package:gitfy/common/global.dart';
import 'package:gitfy/widgets/top_bar.dart';

class RepositoryPageBar extends StatefulWidget with PreferredSizeWidget {
  final Function() refresh;

  const RepositoryPageBar({Key? key, required this.refresh}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<StatefulWidget> createState() => _RepositoryPageBarState();
}

class _RepositoryPageBarState extends State<RepositoryPageBar> {
  @override
  Widget build(BuildContext context) {
    return TopBar(
      title: "Gitfy",
      actions: [
        IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () {
              Global.dao.getRemote();
              widget.refresh();
            })
      ],
    );
  }
}
