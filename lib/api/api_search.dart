
import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_clean/infra/datasources/user_datasource.dart';
import 'package:modular_clean/infra/models/result_model.dart';
import 'package:modular_clean/utils/core/base_url.dart';
import 'package:modular_clean/utils/core/endpoints.dart';
import 'package:modular_clean/utils/core/request.dart';
part 'api_search.g.dart';
@Injectable(singleton: false)
class ApiSearch implements UserDataSource{
  @override
  Future<List<ResultModel>?> getUser(String q) async{
    var header = <String,String>{};
    var result = await Request().get(
        headers: header,
        url: BaseUrl().getBaseUrl()+Endpoints().getUser(q));
    if(result.statusCode == 200){
      final json = jsonDecode(result.body);
      var jsonList = json['items'] as List;
      var list = jsonList
          .map((item) => ResultModel(
          name: '',
          nickname: item['login'],
          image: item['avatar_url'],
          url: item['url']))
          .toList();
      return list;
    }else{
      throw Exception();
    }
  }

}