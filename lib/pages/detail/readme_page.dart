import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gitfy/common/launcher.dart';

class ReadmePage extends StatelessWidget {
  final String data;

  const ReadmePage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var encoded = data.replaceAll("\n", "");
    var decoded = utf8.decode(base64.decode(encoded));
    // 去除 markdown 图片，暂不支持 svg 加载
    decoded = decoded.replaceAll(RegExp(r"\!\[.*\]\(.+\)"), "");
    return Markdown(
      data: decoded,
      selectable: true,
      onTapLink: (String text, String? href, String title) {
        if (href != null) launch(href);
      },
    );
  }
}
