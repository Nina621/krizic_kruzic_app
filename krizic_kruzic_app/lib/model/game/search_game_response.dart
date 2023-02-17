import 'game.dart';

class SearchGamesResponse {
  final int total;
  final List<Game> data;

  SearchGamesResponse({
    required this.total,
    required this.data,
  });

  factory SearchGamesResponse.fromJson(Map<String, dynamic> json) =>
      SearchGamesResponse(
        total: json["total"],
        data: List<Game>.from(json["data"].map((x) => Game.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "data": data,
      };
}
