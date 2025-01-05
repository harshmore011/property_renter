import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_renter/features/home_screen/presentation/widgets/recently_added_apartments_widget.dart';

import '../../../../core/utils/snackbar_message.dart';
import '../blocs/home_screen_bloc.dart';
import '../blocs/home_screen_event.dart';
import '../blocs/home_screen_state.dart';
import '../widgets/owned_apartments_widget.dart';
import '../widgets/upcoming_apartments_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

  @override
  void initState() {
    // Dispatching the Event
    BlocProvider.of<HomeScreenBloc>(context).add(GetResidentialDataEvent());
    BlocProvider.of<HomeScreenBloc>(context).add(GetCommercialDataEvent());

    super.initState();
  }

  final _gradientDecoration = const BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: <Color>[
          Color.fromARGB(1, 15, 12, 41),
          Color.fromARGB(1, 48, 43, 99),
          Color.fromARGB(1, 36, 34, 62)
        ]),
  );

  _getAppBar(BuildContext context) {
    return AppBar(
      // backgroundColor: LinearGradient(colors: colors),
      flexibleSpace: Container(
        decoration: _gradientDecoration,
        child: Stack(
          children: [
            Positioned(
                bottom: 24,
                child: Row(children: [
                  SearchBar(
                    leading: Icon(CupertinoIcons.search),
                    hintText: "Search",
                  ),
                  IconButton(
                    padding: const EdgeInsets.all(4),
                    icon: const ImageIcon(
                        AssetImage("assets/icons/Vector-3.png")),
                    onPressed: () {
                      SnackBarMessage.showSnackBar(
                          message: "Filter", context: context);
                    },
                  ),
                ]))
          ],
        ),
      ),
      toolbarHeight: 100,
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
        icon: const ImageIcon(AssetImage("assets/icons/Menu.png")),
      ),
      centerTitle: true,
      title: const Image(image: AssetImage("assets/icons/logo.png")),
      actions: [
        IconButton(
          icon: const ImageIcon(AssetImage("assets/icons/Vector.png")),
          onPressed: () {
            SnackBarMessage.showSnackBar(message: "QR Scan", context: context);
          },
        ),
        IconButton(
          icon: const ImageIcon(AssetImage("assets/icons/Vector-1.png")),
          onPressed: () {
            SnackBarMessage.showSnackBar(message: "QR Scan", context: context);
          },
        ),
        IconButton(
          icon: const ImageIcon(AssetImage("assets/icons/Vector-2.png")),
          onPressed: () {
            SnackBarMessage.showSnackBar(message: "QR Scan", context: context);
          },
        ),
        IconButton(
          icon: const ImageIcon(AssetImage("assets/icons/Vector-0.png")),
          onPressed: () {
            SnackBarMessage.showSnackBar(message: "QR Scan", context: context);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _getAppBar(context),
      body: _getCurrentScreen(context),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: _currentIndex == 0 ? _gradientDecoration : null,
              child: Row(
                children: [
                  IconButton(
                    icon: const ImageIcon(AssetImage("assets/icons/Vector-6.png")),
                    onPressed: _onBottomItemPressed(0),
                  ),
                  Text("Home", style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Container(
              decoration: _currentIndex == 1 ? _gradientDecoration : null,
              child: Row(
                children: [
                  IconButton(
                    icon: const ImageIcon(AssetImage("assets/icons/Vector-7.png")),
                    onPressed: _onBottomItemPressed(1),
                  ),
                  Text("Properties", style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Container(
              decoration: _currentIndex == 2 ? _gradientDecoration : null,
              child: Row(
                children: [
                  IconButton(
                    icon: const ImageIcon(AssetImage("assets/icons/Settings.png")),
                    onPressed: _onBottomItemPressed(2),
                  ),
                  Text("Settings", style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Container(
              decoration: _currentIndex == 3 ? _gradientDecoration : null,
              child: Row(
                children: [
                  IconButton(
                    icon: const ImageIcon(AssetImage("assets/icons/Profile.png")),
                    onPressed: _onBottomItemPressed(3),
                  ),
                  Text("Profile", style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
          decoration: _gradientDecoration,
          child: Icon(CupertinoIcons.add),
        ),
      ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ));
  }

  _onBottomItemPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _getCurrentScreen(BuildContext context) {
    if (_currentIndex == 0) {
      return _homeScreen(context);

    } else if (_currentIndex == 1) {
      return Center(
        child: Text(
          'Properties', style: TextStyle(fontSize: 20),
        ),
      );
    } else if (_currentIndex == 2) {
      return Center(
        child: Text(
          'Settings', style: TextStyle(fontSize: 20),
        ),
      );
    } else if (_currentIndex == 3) {
      return Center(
        child: Text(
          'Profile', style: TextStyle(fontSize: 20),
        ),
      );
    }
  }

  _homeScreen(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: const [
              Tab(
                text: "Residential",
              ),
              Tab(
                text: "Commercial",
              ),
            ],
          ),
          TabBarView(
            children:
            [
              BlocBuilder<HomeScreenBloc, HomeScreenState>(
                builder: (context, state) {
                  if (state is InitialState || state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GetResidentialDataState) {

                    final residentialData = state.residentialData;

                    return SingleChildScrollView(padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          RecentlyAddedApartmentSection(recentlyAddedApartments:
                          residentialData.recentlyAddedApartments),
                          const SizedBox(height: 32,),
                          OwnedApartmentsSection(ownedApartments:
                          residentialData.ownedApartments),
                          const SizedBox(height: 32,),
                          UpcomingApartmentSection(upcomingApartments:
                          residentialData.upcomingApartments),
                          ]
                      ),
                    );
                    // return Center(child: Text("Residential"),);
                  }
                  return Container();
                }),
            BlocBuilder<HomeScreenBloc, HomeScreenState>(
                builder: (context, state) {
                  if (state is InitialState || state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GetCommercialDataState) {
                    return Center(child: Text(state.commercialData.message),);
                  }
                  return Container();
                }),
            ]
          ),
        ],
      ),
    );
  }

}
