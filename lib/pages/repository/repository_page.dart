import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gitfy/common/global.dart';
import 'package:gitfy/models/index.dart';
import 'package:gitfy/pages/detail/detail_page.dart';

import '../../widgets/card_item.dart';

class RepositoryPage extends StatefulWidget {
  const RepositoryPage({Key? key}) : super(key: key);

  @override
  State<RepositoryPage> createState() => _RepositoryPageSate();
}

class _RepositoryPageSate extends State<RepositoryPage> {
  final _dao = Global.dao;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _dao.getLocal(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //请求完成
          if (snapshot.connectionState == ConnectionState.done) {
            //发生错误
            if (snapshot.hasError) {
              return buildError(context,
                  snapshot.error.toString() + snapshot.stackTrace.toString());
            }
            //请求成功
            return buildSuccess(context, snapshot.data);
          }
          //请求未完成
          return buildFail();
        });
  }

  Widget buildSuccess(BuildContext context, List<Data> data) {
    return RefreshIndicator(
        backgroundColor: Colors.transparent,
        onRefresh: () async {
          await _dao.getRemote();
          setState(() {});
        },
        child: data.isEmpty
            ? buildEmpty()
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  var info = data[index];
                  return CardItem(
                    icon: info.repo.platform == "github"
                        ? null
                        : FontAwesomeIcons.gitlab,
                    title: "${info.repo.owner} / ${info.repo.repo}",
                    subtitle: info.desp,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailPage(data: info);
                      }));
                    },
                  );
                }));
  }

  Widget buildEmpty() {
    return Stack(
      alignment: Alignment.center,
      children: [ListView(), const Text("Empty...")],
    );
  }

  Widget buildFail() {
    return Container(
      alignment: Alignment.center,
      child: const Text("Loading..."),
    );
  }

  Widget buildError(BuildContext context, String msg) {
    return Text(msg);
  }
}
