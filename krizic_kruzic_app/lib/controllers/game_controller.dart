import 'package:get/get.dart';
import 'package:krizic_kruzic_app/data/repository/game_repo.dart';
import 'package:krizic_kruzic_app/model/enum/statuses.dart';
import 'package:krizic_kruzic_app/model/game/game.dart';
import 'package:krizic_kruzic_app/model/game/search_game_response.dart';
import 'package:krizic_kruzic_app/model/response_model.dart';

class GameController extends GetxController implements GetxService {
  final GameRepo gameRepo;

  GameController({
    required this.gameRepo,
  });

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Game>? _existingGamesListSimple;

  List<Game> get existingGamesListSimple {
    return [...?_existingGamesListSimple];
  }

  SearchGamesResponse? _searchGamesResponse;

  SearchGamesResponse? get searchGamesResponse => _searchGamesResponse;

  List<Game>? _gamesListSimple;

  List<Game> get gamesListSimple {
    return [...?_gamesListSimple];
  }

  late Game _game;

  Game get game => _game;

  List<Game> games = [
    Game(
        id: '1',
        firstPlayer: 'Pero',
        secondPlayer: 'Ante',
        status: Statuses.DONE),
    Game(
        id: '2',
        firstPlayer: 'Pero',
        secondPlayer: 'Kristina',
        status: Statuses.IN_PROGRESS),
    Game(id: '3', firstPlayer: 'Nix', secondPlayer: '/', status: Statuses.OPEN),
    Game(
        id: '4',
        firstPlayer: 'Lovro',
        secondPlayer: 'Ancy',
        status: Statuses.DONE),
    Game(
        id: '5',
        firstPlayer: 'Ivan',
        secondPlayer: 'Petra',
        status: Statuses.IN_PROGRESS),
  ];

  Future<ResponseModel> fetchGameById(String gameId) async {
    _isLoading = true;
    update();
    Response response = await gameRepo.fetchGameById(gameId);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      _game = Game.fromJson(response.body);
      responseModel =
          ResponseModel(isSuccess: true, message: response.statusText!);
    } else {
      responseModel =
          ResponseModel(isSuccess: false, message: response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> getUserInfo() async {
    Response response = await gameRepo.fetchAllGames();
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      _game = Game.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(isSuccess: true, message: "Successfully");
    } else {
      responseModel =
          ResponseModel(isSuccess: false, message: response.statusText!);
    }
    update();
    return responseModel;
  }
}
