/// thumbnail_url : "http://res.cloudinary.com/dzytqdeh2/image/upload/v1729325418/songs/b8bf8f85-268d-4df5-8851-97d18b09bc87/qknhmdtgsbms6s3stw8k.jpg"
/// song_url : "http://res.cloudinary.com/dzytqdeh2/video/upload/v1729325417/songs/b8bf8f85-268d-4df5-8851-97d18b09bc87/ykb9mms6az605zkoiz4s.mp3"
/// artist : "Taylor"
/// hex_code : "FFFFFF"
/// id : "b8bf8f85-268d-4df5-8851-97d18b09bc87"
/// song_name : "Color_Out"

class SongModel {
  SongModel({
    String? thumbnailUrl,
    String? songUrl,
    String? artist,
    String? hexCode,
    String? id,
    String? songName,}){
    _thumbnailUrl = thumbnailUrl;
    _songUrl = songUrl;
    _artist = artist;
    _hexCode = hexCode;
    _id = id;
    _songName = songName;
  }

  SongModel.fromJson(dynamic json) {
    _thumbnailUrl = json['thumbnail_url'];
    _songUrl = json['song_url'];
    _artist = json['artist'];
    _hexCode = json['hex_code'];
    _id = json['id'];
    _songName = json['song_name'];
  }
  String? _thumbnailUrl;
  String? _songUrl;
  String? _artist;
  String? _hexCode;
  String? _id;
  String? _songName;
  SongModel copyWith({  String? thumbnailUrl,
    String? songUrl,
    String? artist,
    String? hexCode,
    String? id,
    String? songName,
  }) => SongModel(  thumbnailUrl: thumbnailUrl ?? _thumbnailUrl,
    songUrl: songUrl ?? _songUrl,
    artist: artist ?? _artist,
    hexCode: hexCode ?? _hexCode,
    id: id ?? _id,
    songName: songName ?? _songName,
  );
  String? get thumbnailUrl => _thumbnailUrl;
  String? get songUrl => _songUrl;
  String? get artist => _artist;
  String? get hexCode => _hexCode;
  String? get id => _id;
  String? get songName => _songName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['thumbnail_url'] = _thumbnailUrl;
    map['song_url'] = _songUrl;
    map['artist'] = _artist;
    map['hex_code'] = _hexCode;
    map['id'] = _id;
    map['song_name'] = _songName;
    return map;
  }

}