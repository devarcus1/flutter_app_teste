
import 'package:dio/dio.dart';

class Connection{

  static BaseOptions _options;
  static String cnpj;
  static Dio _dio;


  static Dio returnDio({Map<String, dynamic> map}){
    if(map == null)
      map = {};
    if(_dio == null || map.isNotEmpty)
      _dio = new Dio( Connection.returnBaseOptions(map: map) );
    return _dio;
  }

  static Dio returnDioWithoutCnpj(String cnpj){
    if(_dio == null)
      _dio = new Dio( Connection.returnBaseOptionsWithoutCnpj(cnpj) );
    return _dio;
  }

  static returnBaseOptions({Map<String, dynamic> map}){
    Map<String, dynamic> headers;

    if(headers == null)
      headers = new Map();

    headers.addAll( {"tenant": "arcuscar_03683003000165F"} );
    headers.addAll( {"user": "TESTE_CADASTRO"} );
    headers.addAll(map);

    _options  = new BaseOptions(
      //baseUrl: "http://192.168.100.4:8083/api/v4/",
        //baseUrl: "http://192.168.234.107:8083/api/v4/",
        //baseUrl: "http://172.16.8.88:8083/api/v4/",
        baseUrl: "http://arcuscar.dyndns.info:8083/api/v2/",
        connectTimeout: 80000,
        headers: headers
    );
    return _options;
  }


  static returnBaseOptionsWithoutCnpj(String cnpj){
    Map<String, dynamic> headers;

    if(headers == null)
      headers = new Map();

    headers.addAll( {"tenant": "arcusrot_${cnpj}"} );
    _options  = new BaseOptions(
        baseUrl: "http://mundolivre.dyndns.info:8083/api/v3/",
        connectTimeout: 80000,
        headers: headers
    );
    return _options;
  }

}