import 'package:flutter/material.dart';
import 'package:gitfy/widgets/release_item.dart';

import '../../models/release.dart';
import '../../models/repo.dart';

class ReleasesPage extends StatelessWidget {
  final Repo repo;
  final List<Release> releases;

  const ReleasesPage({Key? key, required this.releases, required this.repo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:
          releases.map((e) => ReleaseItem(repo: repo, release: e)).toList(),
    );
  }
}
