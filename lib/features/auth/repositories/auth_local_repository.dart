import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_local_repository.g.dart';

@Riverpod(keepAlive: true)
AuthLocalRepository authLocalRepository(AuthLocalRepositoryRef ref){
return AuthLocalRepository();
}

class AuthLocalRepository{
late SharedPreferences _sharedPreferences;

Future<void> init() async {
  _sharedPreferences = await SharedPreferences.getInstance();
  print("xcasdsadd ${_sharedPreferences.toString()}");

}

void setToken(String? token) async {
if(token!=null){
  print("xcasdsadd ${_sharedPreferences.toString()}");

  await _sharedPreferences.setString("x-auth-token", token);

}
}


String? getToken(){
  return _sharedPreferences.getString("x-auth-token");

  
}
}