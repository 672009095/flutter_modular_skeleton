/*
* you can group all datasource in one data source
* if u want, or u can create one by one
* this sample is for one by one for easy development
* */
import 'package:modular_clean/infra/models/result_model.dart';

abstract class UserDataSource {
  Future<List<ResultModel>?> getUser(String q);
}