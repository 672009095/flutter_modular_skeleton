import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_clean/api/api_search.dart';
import 'package:modular_clean/domain/usecases/go_search.dart';
import 'package:modular_clean/infra/respositories_impl/user_repository_impl.dart';
import 'package:modular_clean/presenter/pages/details_page.dart';
import 'package:modular_clean/presenter/pages/user_page.dart';
import 'package:modular_clean/presenter/stores/user_store.dart';
import 'package:http/http.dart' as http;

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    //bindapi
    $ApiSearch,
    //binusecase
    $GoSearchImpl,
    //bindrepository
    $UserRepositoryImpl,
    //bindstore
    $UserStore,

    Bind.instance<http.Client>(http.Client()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, __) => const UserPage()),
    ChildRoute('/details',
        child: (_, args) => DetailsPage(result: args.data)),
  ];
}