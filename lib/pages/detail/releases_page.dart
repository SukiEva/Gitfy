import 'package:flutter/material.dart';
import 'package:gitfy/widgets/release_item.dart';

import '../../models/release.dart';

class ReleasesPage extends StatelessWidget {
  final List<Release> releases;

  const ReleasesPage({Key? key, required this.releases}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: releases.map((e) => ReleaseItem(release: e)).toList(),
    );
  }
}
