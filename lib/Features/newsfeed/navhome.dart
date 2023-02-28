import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Shared/widgets/navcards.dart';
import '../../Shared/widgets/textinput.dart';
import 'news_manager.dart';

class NavHome extends StatelessWidget {
  const NavHome({super.key});

  @override
  Widget build(BuildContext context) {
    // final newsList = Provider.of<newsManager>(context).newslist;
    final colorss = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: size.width / 1.1,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Consumer<NewsManager>(
                  builder: (context, value, child) => Inputtext(
                        hinttext: "Search",
                        controller: value.searchcont,
                        onChanged: value.searchNews,
                      )),
              const Divider(),
              Expanded(
                child: Consumer<NewsManager>(
                  builder: (context, value, child) => RefreshIndicator(
                    onRefresh: () => value.getNews(),
                    child: ListView.builder(
                      itemCount: value.newslist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return newscard(
                            context, value.newslist[index], colorss, size);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
