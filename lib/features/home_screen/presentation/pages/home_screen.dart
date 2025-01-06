import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/snackbar_message.dart';
import '../blocs/home_screen_bloc.dart';
import '../blocs/home_screen_event.dart';
import '../blocs/home_screen_state.dart';
import '../widgets/owned_apartments_widget.dart';
import '../widgets/recently_added_apartments_widget.dart';
import '../widgets/upcoming_apartments_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  int _tabIndex = 0;
  int _bottomNavIndex = 0;

  @override
  void initState() {
    debugPrint("HomeScreen: initState():");

    // Dispatching the Event
    // BlocProvider.of<HomeScreenBloc>(context).add(GetCommercialDataEvent());
    BlocProvider.of<HomeScreenBloc>(context).add(GetResidentialDataEvent());
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _tabIndex = _tabController.index;
        debugPrint("currentTabIndex: $_tabIndex");
        if (_tabIndex == 0) {
          BlocProvider.of<HomeScreenBloc>(context)
              .add(GetResidentialDataEvent());
        } else if (_tabIndex == 1) {
          BlocProvider.of<HomeScreenBloc>(context)
              .add(GetCommercialDataEvent());
        }
      });
    });

    super.initState();
  }

  final _gradientDecoration = BoxDecoration(
    shape: BoxShape.rectangle,
    borderRadius: const BorderRadius.all(
      Radius.circular(30),
    ),
    gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: <Color>[
          Color.fromARGB(255, 15, 12, 41),
          Color.fromARGB(255, 48, 43, 99),
          Color.fromARGB(255, 36, 34, 62)
        ]),
  );

  _getAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: AppBar(
        // backgroundColor: LinearGradient(colors: colors),
        flexibleSpace: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            // shape: BoxShape.,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color.fromARGB(255, 15, 12, 41),
                  Color.fromARGB(255, 48, 43, 99),
                  Color.fromARGB(255, 36, 34, 62)
                ]),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                  bottom: -26,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 250,
                          child: SearchBar(
                            leading: Icon(CupertinoIcons.search),
                            hintText: "Search",
                          ),
                        ),
                        Card(
                          elevation: 4,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          )),
                          child: IconButton(
                            padding: const EdgeInsets.all(4),
                            icon: const ImageIcon(
                                AssetImage("assets/icons/Vector-3.png")),
                            onPressed: () {
                              SnackBarMessage.showSnackBar(
                                  message: "Filter", context: context);
                            },
                          ),
                        ),
                      ]))
            ],
          ),
        ),
        // titleSpacing: 2,
        // toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            SnackBarMessage.showSnackBar(message: "Menu", context: context);
          },
          icon: const ImageIcon(
            AssetImage("assets/icons/Menu.png"),
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Image(image: AssetImage("assets/icons/logo.png")),
        actionsIconTheme:
            IconThemeData(size: 20, color: Colors.white, opticalSize: 20),
        actions: [
          InkWell(
              onTap: () {
                SnackBarMessage.showSnackBar(
                    message: "QR Scan", context: context);
              },
              child: const ImageIcon(AssetImage("assets/icons/Vector.png"))),
          const SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {
                SnackBarMessage.showSnackBar(
                    message: "UI Mode", context: context);
              },
              child: const ImageIcon(AssetImage("assets/icons/Vector-1.png"))),
          const SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {
                SnackBarMessage.showSnackBar(
                    message: "Notifications", context: context);
              },
              child: const ImageIcon(AssetImage("assets/icons/Vector-2.png"))),
          const SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {
                SnackBarMessage.showSnackBar(
                    message: "Messages", context: context);
              },
              child: const ImageIcon(AssetImage("assets/icons/Vector-0.png"))),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("HomeScreen: build():");

    return SafeArea(
        child: Scaffold(
      appBar: _getAppBar(context),
      body: _getCurrentScreen(context),
      bottomNavigationBar: _getBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          SnackBarMessage.showSnackBar(message: "FAB", context: context);
        },
        child: Container(
          height: 77,
          width: 77,
          decoration: _gradientDecoration,
          child: Icon(
            CupertinoIcons.add,
            size: 38,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }

  _onBottomItemPressed(int index) {
    setState(() {
      _bottomNavIndex = index;
      debugPrint(
          "HomeScreen: _onBottomItemPressed() currentIndex:$_bottomNavIndex");
    });
  }

  _getCurrentScreen(BuildContext context) {
    if (_bottomNavIndex == 0) {
      return _homeScreen(context);
    } else if (_bottomNavIndex == 1) {
      return Center(
        child: Text(
          'Properties',
          style: TextStyle(fontSize: 20),
        ),
      );
    } else if (_bottomNavIndex == 2) {
      return Center(
        child: Text(
          'Settings',
          style: TextStyle(fontSize: 20),
        ),
      );
    } else if (_bottomNavIndex == 3) {
      return Center(
        child: Text(
          'Profile',
          style: TextStyle(fontSize: 20),
        ),
      );
    }
  }

  _homeScreen(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        TabBar(
          unselectedLabelColor: AppTheme.paragraphColor,
          unselectedLabelStyle: const TextStyle(fontSize: 15),
          controller: _tabController,
          tabs: [
            Tab(text: "Residential"),
            const Tab(
              text: "Commercial",
            ),
          ],
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            BlocBuilder<HomeScreenBloc, HomeScreenState>(
                builder: (context, state) {
              debugPrint("ResidentialBloc: $state");
              if (state is InitialState || state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetResidentialDataState) {
                final residentialData = state.residentialData;

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Flexible(
                      child: SizedBox(
                        height: 350,
                        child: RecentlyAddedApartmentSection(
                            recentlyAddedApartments:
                                residentialData.recentlyAddedApartments),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 980,
                        child: OwnedApartmentsSection(
                            ownedApartments: residentialData.ownedApartments),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 230,
                        child: UpcomingApartmentSection(
                            upcomingApartments:
                                residentialData.upcomingApartments),
                      ),
                    ),
                  ]),
                );

              }
              return Container();
            }),
            BlocBuilder<HomeScreenBloc, HomeScreenState>(
                builder: (context, state) {
              debugPrint("ResidentialBloc: $state");

              if (state is InitialState || state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetCommercialDataState) {
                return Center(
                  child: Text(state.commercialData.message),
                );
              }
              return Container();
            }),
          ]),
        ),
      ],
    );
  }

  _getBottomNavBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            // fit: ,
            flex: 0,
            child: Container(
              padding: _bottomNavIndex == 0
                  ? const EdgeInsets.only(left: 12.0, right: 15)
                  : null,
              margin: _bottomNavIndex == 0
                  ? const EdgeInsets.only(left: 8.0, right: 8)
                  : null,
              decoration: _bottomNavIndex == 0 ? _gradientDecoration : null,
              child: Row(
                children: [
                  IconButton(
                    icon: ImageIcon(
                      const AssetImage("assets/icons/Vector-6.png"),
                      color: _bottomNavIndex == 0
                          ? Colors.white
                          : AppTheme.paragraphColor,
                    ),
                    onPressed: () => _onBottomItemPressed(0),
                  ),
                  if (_bottomNavIndex == 0)
                    Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 0,
            child: Container(
              padding: _bottomNavIndex == 1
                  ? const EdgeInsets.only(left: 12.0, right: 15)
                  : null,
              margin: _bottomNavIndex == 1
                  ? const EdgeInsets.only(left: 8.0, right: 8)
                  : null,
              decoration: _bottomNavIndex == 1 ? _gradientDecoration : null,
              child: Row(
                children: [
                  IconButton(
                    icon: ImageIcon(
                        const AssetImage("assets/icons/Vector-7.png"),
                        color: _bottomNavIndex == 1
                            ? Colors.white
                            : AppTheme.paragraphColor),
                    onPressed: () => _onBottomItemPressed(1),
                  ),
                  if (_bottomNavIndex == 1)
                    Text(
                      "Properties",
                      style: TextStyle(color: Colors.white),
                    ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 0,
            child: Container(
              padding: _bottomNavIndex == 2
                  ? const EdgeInsets.only(left: 12.0, right: 15)
                  : null,
              margin: _bottomNavIndex == 2
                  ? const EdgeInsets.only(left: 8.0, right: 8)
                  : null,
              decoration: _bottomNavIndex == 2 ? _gradientDecoration : null,
              child: Row(
                children: [
                  IconButton(
                    icon: ImageIcon(
                      const AssetImage("assets/icons/Settings.png"),
                      color: _bottomNavIndex == 2
                          ? Colors.white
                          : AppTheme.paragraphColor,
                    ),
                    onPressed: () => _onBottomItemPressed(2),
                  ),
                  if (_bottomNavIndex == 2)
                    Text(
                      "Settings",
                      style: TextStyle(color: Colors.white),
                    ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 0,
            child: Container(
              padding: _bottomNavIndex == 3
                  ? const EdgeInsets.only(left: 12.0, right: 15)
                  : null,
              margin: _bottomNavIndex == 3
                  ? const EdgeInsets.only(left: 8.0, right: 8)
                  : null,
              decoration: _bottomNavIndex == 3 ? _gradientDecoration : null,
              child: Row(
                children: [
                  IconButton(
                    icon: ImageIcon(
                        const AssetImage("assets/icons/Profile.png"),
                        color: _bottomNavIndex == 3
                            ? Colors.white
                            : AppTheme.paragraphColor),
                    onPressed: () => _onBottomItemPressed(3),
                  ),
                  if (_bottomNavIndex == 3)
                    Text(
                      "Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
