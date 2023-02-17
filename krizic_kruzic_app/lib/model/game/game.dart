import 'package:krizic_kruzic_app/model/auth/user.dart';
import 'package:krizic_kruzic_app/model/enum/statuses.dart';
import 'package:krizic_kruzic_app/screens/dashboard_screen.dart';

class Game {
  final String id;
  final List<num>? board;
  final User? winner;
  final String firstPlayer;
  final String secondPlayer;
  final DateTime? created;
  final Statuses status;
  final List<Player>? participants;

  Game(
      {required this.id,
      this.board,
      this.winner,
      required this.firstPlayer,
      required this.secondPlayer,
      this.created,
      required this.status,
      this.participants});

  bool? isParticipant(Player player) {
    return participants?.contains(player);
  }

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        board: (json['board'] as List<dynamic>?)?.map((e) => e as num).toList(),
        winner: User.fromJson(json["winner"]),
        firstPlayer: json["firstPlayer"],
        secondPlayer: json["secondPlayer"],
        created: DateTime.fromMillisecondsSinceEpoch(json["dateFrom"]),
        status: json['status'],
      );
}

const _$GameStatusEnumMap = {
  Statuses.OPEN: 'OPEN',
  Statuses.IN_PROGRESS: 'IN_PROGRESS',
  Statuses.DONE: 'DONE',
};
