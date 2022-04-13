/*
here u can
setting config between development or live
endpoints
*/

class BaseUrl {
  var base;
  String getBaseUrl(){
    base = 'https://api.github.com';
    return base;
  }
}