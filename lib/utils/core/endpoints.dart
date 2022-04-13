/*
* u can grouping ur endpoint here and call it later on
* api data sources
* */
class Endpoints{
  var endpoint;
  String getUser(String q){
    endpoint = '/search/users?q='+q;
    return endpoint;
  }
}