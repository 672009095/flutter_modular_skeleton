
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_clean/domain/entities/result.dart';
import 'package:modular_clean/domain/repositories/user_repository.dart';
import 'package:modular_clean/utils/core/errors.dart';
part 'go_search.g.dart';
mixin GoSearch {
  Future<Either<Failure, List<Result>>> goSearch(String textSearch);
}
@Injectable(singleton:false)
class GoSearchImpl implements GoSearch {
  final UserRepository repository;
  GoSearchImpl(this.repository);
  @override
  Future<Either<Failure, List<Result>>> goSearch(String? textSearch) async{
    /*
    * u can set filter param here if mandatory field for return validation
    * before call api
    * */
    if (textSearch?.isEmpty ?? true) {
      return Left(InvalidSearchText());
    }
    return await repository.getUsers(textSearch!);
  }
  
}