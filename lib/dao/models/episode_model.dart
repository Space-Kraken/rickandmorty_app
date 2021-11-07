// Generated by https://quicktype.io

class EpisodeModel {
  EpisodeModel({
    this.info,
    this.results,
  });

  Info? info;
  List<Result>? results;

  factory EpisodeModel.fromMap(Map<String, dynamic> map){
    return EpisodeModel(
      info: Info.fromMap(map["info"]),
      results: List<Result>.from(map["results"].map((x) => Result.fromMap(x))),
    );
  }
}

class Info {
  Info({
    this.next,
    this.prev,
    this.pages
  });

  String? next;
  String? prev;
  int? pages;

  factory Info.fromMap(Map<String, dynamic> map){
    return Info(
      next: map["next"],
      prev: map["prev"],
      pages: map["pages"],
    );
  }
}

class Result {
  Result({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
  });

  int? id;
  String? name;
  String? airDate;
  String? episode;
  List<String>? characters;
  String? url;

  factory Result.fromMap(Map<String, dynamic> map){
    return Result(
      id: map["id"],
      name: map["name"],
      airDate: map["air_date"],
      episode: map["episode"],
      characters: List<String>.from(map["characters"]),
      url: map["url"],
    );
  }
}
