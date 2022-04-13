
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_clean/domain/entities/result.dart';
import 'package:modular_clean/domain/repositories/user_repository.dart';
import 'package:modular_clean/infra/datasources/user_datasource.dart';
import 'package:modular_clean/utils/core/errors.dart';
part 'user_repository_impl.g.dart';
@Injectable(singleton: false)
class UserRepositoryImpl implements UserRepository{
  final UserDataSource dataSource;
  UserRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, List<Result>>> getUsers(String searchText) async{
    try {
      final list = await dataSource.getUser(searchText);
      if (list == null) {
        return Left<Failure, List<Result>>(DatasourceResultNull());
      }
      if (list.isEmpty) {
        return Left(EmptyList());
      }
      return Right<Failure, List<Result>>(list);
    } catch (e) {
      return Left<Failure, List<Result>>(ErrorSearch());
    }
  }

}