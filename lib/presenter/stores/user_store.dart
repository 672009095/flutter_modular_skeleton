
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:mobx_triple/mobx_triple.dart';
import 'package:modular_clean/domain/entities/result.dart';
import 'package:modular_clean/domain/usecases/go_search.dart';
import 'package:modular_clean/utils/core/dartz_adapter.dart';
import 'package:modular_clean/utils/core/errors.dart';
part 'user_store.g.dart';
@Injectable()
class UserStore extends NotifierStore<Failure,List<Result>>{
  final GoSearch goSearch;
  UserStore(this.goSearch):super([]);
  
  void getUser(String textSearch){
    executeEither(() => DartzEitherAdapter.adapter(
      goSearch.goSearch(textSearch)),delay: Duration(milliseconds: 500)
    );
  }
  @override
  Triple<Failure, List<Result>> middleware(Triple<Failure, List<Result>> newTriple) {
    if (newTriple.event == TripleEvent.state) {
      if (newTriple.state.isEmpty) {
        return newTriple.copyWith(event: TripleEvent.error, error: EmptyList());
      }
    }
    return newTriple;
  }
}