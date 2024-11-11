import 'dart:convert';
import 'dart:io';

import 'package:client/core/constants/server_constant.dart';
import 'package:client/core/failure/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/song_model.dart';
part 'home_repository.g.dart';

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref){
  return HomeRepository();
}

class HomeRepository{
  Future<Either<AppFailure, String>>  uploadSong({
    required File selectedAuto
    ,required File selectedThumbnail,
    required String songName,
    required String artist,
    required String selectedColor,
    required String token
}) async{
    try{
      final request = http.MultipartRequest('POST',
          Uri.parse("${ServerConstant.serverURL}/song/upload"));

      request..files.addAll([
        await   http.MultipartFile.fromPath("song",selectedAuto.path),
        await  http.MultipartFile.fromPath("thumbnail",selectedThumbnail.path)
      ])..fields.addAll({"artist":artist,"song_name":songName,"hex_code":selectedColor
      })..headers.addAll({
        "x-auth-token":token
      },);

      final res = await request.send();

      if(res.statusCode!=201) {
        return Left(AppFailure(await res.stream.bytesToString()));

      }

      return Right(await res.stream.bytesToString());

    }
    catch(e){
      return Left(AppFailure(e.toString()));
    }

  }

  Future<Either<AppFailure, List<SongModel>>> getAllSongs(
  {required String token}
      ) async {
try{
final res = await http.get(
    Uri.parse('${ServerConstant.serverURL}/song/list'),
headers: {
      'Content-Type' : 'application/json',
      'x-auth-token' : token
}
);
var resBodyMap = jsonDecode(res.body);

if(res.statusCode!=200){
  resBodyMap = resBodyMap as Map<String,dynamic>;
  return Left(AppFailure(resBodyMap['detail']));
}

  resBodyMap = resBodyMap as List;

List<SongModel> songs = [] ;
for(final map in resBodyMap){
  songs.add(SongModel.fromJson(map));

}

return Right(songs);
}catch(e){
  return Left(AppFailure(e.toString()));
}
  }

}