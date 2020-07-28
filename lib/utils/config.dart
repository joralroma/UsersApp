const bool isProduction = bool.fromEnvironment('dart.vm.product');

class Config {
  bool prod = isProduction;
  String urlDev   = 'https://reqres.in/api/';
  String urlProd  = 'https://reqres.in/api/';

}