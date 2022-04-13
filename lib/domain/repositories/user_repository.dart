import 'package:dartz/dartz.dart';
import 'package:modular_clean/domain/entities/result.dart';
import 'package:modular_clean/utils/core/errors.dart';
/*
* u can grouping repository method call api here
* ex userGet, userEdit, userAdd
* */
abstract class UserRepository {
  Future<Either<Failure, List<Result>>> getUsers(String searchText);
}