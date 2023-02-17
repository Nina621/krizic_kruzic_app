import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:krizic_kruzic_app/base/custom_loader.dart';
import 'package:krizic_kruzic_app/color/app_colors.dart';
import 'package:krizic_kruzic_app/controllers/game_controller.dart';
import 'package:krizic_kruzic_app/model/enum/statuses.dart';
import 'package:krizic_kruzic_app/model/enum/tabs.dart';
import 'package:krizic_kruzic_app/model/game/game.dart';
import 'package:krizic_kruzic_app/model/game/player.dart';
import 'package:krizic_kruzic_app/routes/route_helper.dart';
import 'package:krizic_kruzic_app/utils/dimensions.dart';
import 'package:krizic_kruzic_app/widgets/games_list_item.dart';
import 'package:krizic_kruzic_app/widgets/players_list_item.dart';
import 'package:krizic_kruzic_app/widgets/tab_widget.dart';
import 'package:krizic_kruzic_app/widgets/template/app_template.dart';
import 'package:krizic_kruzic_app/widgets/text/big_text.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Tabs _selectedTab = Tabs.EXISTING_GAMES;
  double screenHeight = 0;
  double screenWidth = 0;

  int _currentPage = 0;
  int _itemsPerPage = 10;

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
  List<PlayerModel> players = [
    PlayerModel(
      nickname: 'Nix',
      points: 15,
      playerType: 'Winner',
    ),
    PlayerModel(
      nickname: 'Anchy',
      points: 12,
      playerType: 'Winner',
    ),
    PlayerModel(
      nickname: 'Pero',
      points: 8,
      playerType: 'Winner',
    ),
    PlayerModel(
      nickname: 'Kristina',
      points: 5,
      playerType: 'Winner',
    ),
  ];

  bool startAnimation = false;

  setTab(Tabs selectedTab) {
    setState(() {
      _selectedTab = selectedTab;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final player = getPlayer();
    final itemsToShow =
        games.skip(_currentPage * _itemsPerPage).take(_itemsPerPage).toList();
    final playersToShow =
        players.skip(_currentPage * _itemsPerPage).take(_itemsPerPage).toList();
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<GameController>(
        builder: (controller) {
          return !controller.isLoading
              ? AppTemplate(
                  widget: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: Dimensions.width30,
                                top: Dimensions.height50,
                                bottom: Dimensions.height10,
                              ),
                              child: BigTextWidget(
                                text: "GAMES",
                                color: AppColors.whiteColor,
                                size: Dimensions.font42,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: Dimensions.height40,
                                right: Dimensions.width30,
                              ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.toNamed(
                                        RouteHelper.getUserScreen()),
                                    child: SvgPicture.asset(
                                      "assets/images/user_icon.svg",
                                      color: AppColors.whiteColor,
                                      height: Dimensions.height24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.height20),
                        Row(
                          children: [
                            TabWidget(
                              text: " EXISTING GAMES",
                              onTap: () {
                                setTab(Tabs.EXISTING_GAMES);
                              },
                              tabColor: _selectedTab == Tabs.EXISTING_GAMES
                                  ? AppColors.firstTabColor
                                  : AppColors.tabColor,
                              textColor: _selectedTab == Tabs.EXISTING_GAMES
                                  ? AppColors.tabColor
                                  : AppColors.whiteColor,
                            ),
                            TabWidget(
                              text: "BEST PLAYERS",
                              onTap: () {
                                setTab(Tabs.BEST_PLAYER);
                              },
                              tabColor: _selectedTab == Tabs.BEST_PLAYER
                                  ? AppColors.firstTabColor
                                  : AppColors.tabColor,
                              textColor: _selectedTab == Tabs.BEST_PLAYER
                                  ? AppColors.tabColor
                                  : AppColors.whiteColor,
                            )
                          ],
                        ),
                        _selectedTab == Tabs.EXISTING_GAMES
                            ? SizedBox(
                                height: Dimensions.height550,
                                child: ListView.builder(
                                  itemCount: itemsToShow.length,
                                  itemBuilder: (context, index) {
                                    final game = itemsToShow[index];
                                    final participant =
                                        game.isParticipant(player);
                                    return AnimatedContainer(
                                      height: Dimensions.height140,
                                      width: screenWidth,
                                      curve: Curves.easeInOut,
                                      duration: Duration(
                                          milliseconds: 300 + (index * 100)),
                                      transform: Matrix4.translationValues(
                                          startAnimation ? 0 : screenWidth,
                                          0,
                                          0),
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: GameListItem(
                                            firstPlayer: game.firstPlayer,
                                            secondPlayer: game.secondPlayer,
                                            status: getStatusText(game.status),
                                          )),
                                    );
                                  },
                                ),
                              )
                            : SizedBox(
                                height: Dimensions.height550,
                                child: ListView.builder(
                                  itemCount: players.length,
                                  itemBuilder: (context, index) {
                                    final player = playersToShow[index];
                                    return AnimatedContainer(
                                      height: Dimensions.height140,
                                      width: screenWidth,
                                      curve: Curves.easeInOut,
                                      duration: Duration(
                                          milliseconds: 300 + (index * 100)),
                                      transform: Matrix4.translationValues(
                                          startAnimation ? 0 : screenWidth,
                                          0,
                                          0),
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: PlayerListItem(
                                            nickname: player.nickname,
                                            points: player.points.toString(),
                                            wins: player.playerType,
                                          )),
                                    );
                                  },
                                ),
                              )
                      ],
                    ),
                  ],
                  onPressed: () => Get.toNamed(
                    RouteHelper.getDashboardGameScreen(),
                  ),
                )
              : const CustomLoader();
        },
      ),
    );
  }

  String getStatusText(Statuses statuses) {
    switch (statuses) {
      case Statuses.OPEN:
        return "Open";
      case Statuses.IN_PROGRESS:
        return "In progress";
      default:
        return "Done";
    }
  }
}

class Player {
  final int id;
  final String firstPlayer;
  final String secondPlayer;

  Player(
      {required this.id,
      required this.firstPlayer,
      required this.secondPlayer});
}

Player getPlayer() {
  return Player(
    id: 1,
    firstPlayer: 'Pero',
    secondPlayer: 'Kristina',
  );
}
