import 'package:clean_architecture/app/modules/search/presenter/search/search_bloc.dart';
import 'package:clean_architecture/app/modules/search/presenter/search/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchBloc = Modular.get<SearchBloc>();

  @override
  void dispose() {
    super.dispose();
    searchBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
            child: TextField(
              onChanged: searchBloc.add,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Search..."),
            ),
          ),
          Expanded(
              child: StreamBuilder(
                  stream: searchBloc,
                  builder: (context, snapshot) {
                    final state = searchBloc.state;

                    if (state is SearchStart) {
                      return Center(
                        child: Text("Digite alguma coisa!"),
                      );
                    }

                    if (state is SearchError) {
                      return Center(
                        child: Text("Errrrrrrrooooou!"),
                      );
                    }

                    if (state is SearchLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    final list = (state as SearchSuccess).list;

                    return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_, id) {
                        final item = list[id];

                        return ListTile(
                          leading: item.img == null
                              ? Container()
                              : CircleAvatar(
                                  backgroundImage: NetworkImage(item.img),
                                ),
                          title: Text(item.title ?? ""),
                          subtitle: Text(item.content ?? ""),
                        );
                      },
                    );
                  }))
        ],
      ),
    );
  }
}
