import 'package:client/features/home/models/song_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:just_audio/just_audio.dart';
part   'current_song_notifier.g.dart';

@riverpod
class CurrentSongNotifier extends _$CurrentSongNotifier{
 AudioPlayer? audioPlayer;
  @override
SongModel? build() {
  return null;
}

void updateSong(SongModel song) async {

  audioPlayer = AudioPlayer();
//  await  audioPlayer!.setUrl(song.songUrl!);

  final audioSource = AudioSource.uri(
      Uri.parse(song.songUrl!));

  await audioPlayer!.setAudioSource(audioSource);

   audioPlayer!.play();

  state = song;
  }
}