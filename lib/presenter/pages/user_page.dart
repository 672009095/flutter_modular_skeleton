import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:modular_clean/domain/entities/result.dart';
import 'package:modular_clean/presenter/stores/user_store.dart';
import 'package:modular_clean/utils/core/errors.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends ModularState<UserPage, UserStore> {
  Widget _buildList(List<Result> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
        var item = list[index];
        return ListTile(
          leading: Hero(
            tag: item.image,
            child: CircleAvatar(
              backgroundImage: NetworkImage(item.image),
            ),
          ),
          title: Text(item.nickname),
          onTap: () {
            Modular.to.pushNamed('/details?id=1', arguments: item);
          },
        );
      },
    );
  }

  Widget _buildError(Failure error) {
    if (error is EmptyList) {
      return const Center(
        child: Text('Nothing has been found'),
      );
    } else if (error is ErrorSearch) {
      return const Center(
        child: Text('Github error'),
      );
    } else {
      return const Center(
        child: Text('Internal error'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('setState');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Search'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
            child: TextField(
              onChanged: controller.getUser,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search...',
              ),
            ),
          ),
          Expanded(
            child: ScopedBuilder<UserStore, Failure, List<Result>>(
                store: controller,
                onLoading: (_) =>
                const Center(child: CircularProgressIndicator()),
                onError: (_, error) {
                  return _buildError(error!);
                },
                onState: (_, state) {
                  if (state.isEmpty) {
                    return const Center(
                      child: Text('Please, type something...'),
                    );
                  } else {
                    return _buildList(state);
                  }
                }),
          )
        ],
      ),
    );
  }
}