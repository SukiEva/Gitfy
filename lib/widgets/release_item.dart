import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gitfy/common/launcher.dart';
import 'package:gitfy/models/index.dart';
import 'package:intl/intl.dart';

import '../generated/l10n.dart';

class ReleaseItem extends StatelessWidget {
  final Release release;

  const ReleaseItem({Key? key, required this.release}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [buildHeader(context), buildFooter(context)],
    );
  }

  Widget buildHeader(BuildContext context) {
    var dateTime =
        DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(release.publishAt, true);
    var date = DateFormat('yyyy-MM-dd').format(dateTime);
    return ExpansionTile(
      title: Text(
        release.name,
        style: const TextStyle(fontSize: 25),
      ),
      subtitle: Row(
        children: [
          const FaIcon(FontAwesomeIcons.tag, size: 15),
          Text(" ${release.tag}"),
          const Spacer(),
          if (release.preRelease) const FaIcon(FontAwesomeIcons.circleExclamation, size: 15),
          if (release.preRelease) const Text(" Pre Release"),
          if (release.preRelease) const Spacer(),
          const FaIcon(FontAwesomeIcons.calendar, size: 15),
          Text(" $date"),
          //const FaIcon(FontAwesomeIcons, size: 15),
        ],
      ),
      children: [buildBody(context)],
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: MarkdownBody(
        data: release.body,
        selectable: true,
      ),
    );
  }

  Widget buildFooter(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
            onPressed: () {
              _showAssets(context);
            },
            child: Text(S.current.detailPageReleaseAssets)),
        ElevatedButton(
            onPressed: () {
              launch(release.url);
            },
            child: const Icon(Icons.open_in_browser_outlined)),
        ElevatedButton(onPressed: () {}, child: const Icon(Icons.new_label_outlined))
      ],
    );
  }

  Future<void> _showAssets(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
          title: Text(S.current.detailPageReleaseAssets),
          children: release.assets
              .map((e) => SimpleDialogOption(
                    child: Text(e.name),
                    onPressed: () {
                      launch(e.download);
                    },
                  ))
              .toList(),
        );
      },
    );
  }
}
