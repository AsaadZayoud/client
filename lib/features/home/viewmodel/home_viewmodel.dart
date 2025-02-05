import 'dart:io';
import 'dart:ui';

import 'package:client/core/providers/current_user_notifier.dart';
import 'package:client/features/home/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fpdart/fpdart.dart';
import '../../../core/utils.dart';
import '../models/song_model.dart';
part 'home_viewmodel.g.dart';


@riverpod
Future<List<SongModel>> getAllSongs(GetAllSongsRef ref) async{
final token = ref.watch(currentUserNotifierProvider)!.token;
final res = await ref.watch(homeRepositoryProvider).getAllSongs(token: token);

return switch(res){
  Left(value: final l) => throw l.message,
  Right(value: final r) => r

};
}


@riverpod
class HomeViewModel extends _$HomeViewModel {
late HomeRepository _homeRepository;





@override
AsyncValue? build(){
    _homeRepository = ref.watch(homeRepositoryProvider);
  return null;
}

Future<void> uploadSong({required File selectedAuto
  ,required File selectedThumbnail,
  required String songName,
  required String artist,
  required Color selectedColor
})async {
  state = const AsyncValue.loading();
  final res =await _homeRepository.uploadSong(selectedAuto: selectedAuto
      , selectedThumbnail: selectedThumbnail
      , songName: songName, artist: artist
      , selectedColor: rgbToHex(selectedColor)
      , token:ref.read(currentUserNotifierProvider)!.token);
  final val = switch(res){
    Left(value:final l) => state =  AsyncValue.error(l.message, StackTrace.current),
    Right(value: final r) => state = AsyncValue.data(r),
  };
  print(val);
}


}