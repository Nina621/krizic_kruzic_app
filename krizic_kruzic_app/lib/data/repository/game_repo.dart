import 'package:get/get_connect/http/src/response/response.dart';
import 'package:krizic_kruzic_app/data/api/api_client.dart';
import 'package:krizic_kruzic_app/data/repository/uri_helper.dart';
import 'package:krizic_kruzic_app/model/game/search_game_response.dart';
import 'package:krizic_kruzic_app/utils/app_constants.dart';

class GameRepo {
  final ApiClient apiClient;

  GameRepo({
    required this.apiClient,
  });

  Future<Response> searchAllGames(SearchGamesResponse request) async {
    return await apiClient.postData(
      AppConstants.POST_GAME_URI,
      request.toJson(),
    );
  }

  Future<Response> fetchAllGames() async {
    return await apiClient.getData(
      AppConstants.GET_GAME_URI,
    );
  }

  Future<Response> fetchGameById(String gameId) async {
    return await apiClient.getData(
      UriHelperRepo.getUrlWithParams(
          AppConstants.GET_USER_GAME_URI, <String, dynamic>{"id": gameId}),
    );
  }
}
