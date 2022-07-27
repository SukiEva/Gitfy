import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:gitfy/common/launcher.dart';
import 'package:gitfy/pages/detail/readme_page.dart';
import 'package:gitfy/pages/detail/releases_page.dart';

import '../../generated/l10n.dart';
import '../../models/data.dart';

class DetailPage extends StatefulWidget {
  final Data data;

  const DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Data _info;
  late List<String> _tabs;

  void initTabs() {
    _info = widget.data;
    var locale = S.current;
    _tabs = [
      locale.detailPageTabBarReadmeTab,
      locale.detailPageTabBarReleasesTab,
    ];
  }

  @override
  Widget build(BuildContext context) {
    initTabs();
    var homeUrl = "https://github.com/${_info.repo.owner}/${_info.repo.repo}";
    var color = Theme.of(context).colorScheme;
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("${_info.repo.owner} / ${_info.repo.repo}"),
          bottom: TabBar(
            tabs: _tabs.map((String name) => Tab(text: name)).toList(),
            indicatorColor: color.primary,
            labelColor: color.onSurface,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.open_in_new),
              onPressed: () {
                launch(homeUrl);
              },
            )
          ],
        ),
        body: TabBarView(
          children: _tabs.map((String name) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Container(
                color: Theme.of(context).colorScheme.background,
                child: Builder(
                  builder: (BuildContext context) {
                    var index = _tabs.indexOf(name);
                    return index == 0
                        ? KeepAliveWrapper(
                            child: ReadmePage(data: _info.readme))
                        : KeepAliveWrapper(
                            child: ReleasesPage(
                                repo: _info.repo, releases: _info.releases));
                  },
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
