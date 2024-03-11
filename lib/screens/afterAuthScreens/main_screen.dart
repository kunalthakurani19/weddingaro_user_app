import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:weddingaro_user_app/screens/commonscreens/checklist_screen.dart';
import 'package:weddingaro_user_app/screens/commonscreens/guest_screen.dart';
import 'package:weddingaro_user_app/screens/commonscreens/vendortab/vendor_screens.dart';
import 'package:weddingaro_user_app/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final controller = PersistentTabController(initialIndex: 0);

  List<Widget> screens() {
    return const [HomeScreen(), VendorScreen(), CheckListScreen(), GuestScreen()];
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.wc_rounded),
        title: 'MyWedding',
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search_outlined),
        title: 'Vendor',
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.checklist_outlined),
        title: 'Checklist',
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.groups_3_outlined),
        title: 'Guest',
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: screens(),
      items: navBarItems(),
      controller: controller,
      navBarStyle: NavBarStyle.style6,
    );
  }
}


































// enum BottomNavItem {
//   one,
//   two,
//   three,
//   four,
// }

// class TabNavigator extends StatelessWidget {
//   static const String tabNavigatorRoot = '/';

//   final GlobalKey<NavigatorState> navigatorKey;
//   final BottomNavItem item;

//   const TabNavigator({Key? key, required this.navigatorKey, required this.item})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final routeBuilders = _routeBuilder();
//     return Navigator(
//       key: navigatorKey,
//       initialRoute: tabNavigatorRoot,
//       onGenerateInitialRoutes: (_, initialRoute) {
//         return [
//           MaterialPageRoute(
//               settings: const RouteSettings(name: tabNavigatorRoot),
//               builder: (context) => routeBuilders[initialRoute]!(context))
//         ];
//       },
//       onGenerateRoute: Routes.generateRoute,
//     );
//   }

//   Map<String, WidgetBuilder> _routeBuilder() {
//     return {tabNavigatorRoot: (context) => _getScren(context, item)};
//   }

//   _getScren(BuildContext context, BottomNavItem item) {
//     switch (item) {
//       case BottomNavItem.one:
//         return const HomeScreen();
//       case BottomNavItem.two:
//         return const ListOfStorefront();
//       case BottomNavItem.three:
//         return const EnquiresScreen();
//       case BottomNavItem.four:
//         return const ReviewScreen();
//       default:
//         return const Scaffold(
//           body: Center(
//             child: Text("No route found"),
//           ),
//         );
//     }
//   }
// }

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   BottomNavItem selectedItem = BottomNavItem.one;

//   final Map<BottomNavItem, GlobalKey<NavigatorState>> navigatorKeys = {
//     BottomNavItem.one: GlobalKey<NavigatorState>(),
//     BottomNavItem.two: GlobalKey<NavigatorState>(),
//     BottomNavItem.three: GlobalKey<NavigatorState>(),
//     BottomNavItem.four: GlobalKey<NavigatorState>(),
//   };

//   final Map<BottomNavItem, IconData> items = const {
//     BottomNavItem.one: Icons.home,
//     BottomNavItem.two: Icons.storefront_outlined,
//     BottomNavItem.three: Icons.message_outlined,
//     BottomNavItem.four: Icons.star_border_outlined,
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: WillPopScope(
//         onWillPop: () async {
//           // This is when you want to remove all the pages from the
//           // stack for the specific BottomNav item.
//           navigatorKeys[selectedItem]
//               ?.currentState
//               ?.popUntil((route) => route.isFirst);

//           return false;
//         },
//         child: Stack(
//           children: items
//               .map(
//                 (item, _) => MapEntry(
//                   item,
//                   _buildOffstageNavigator(item, item == selectedItem),
//                 ),
//               )
//               .values
//               .toList(),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         selectedItemColor: Theme.of(context).primaryColor,
//         unselectedItemColor: AppColors.grey,
//         currentIndex: BottomNavItem.values.indexOf(selectedItem),
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         onTap: (index) {
//           final currentSelectedItem = BottomNavItem.values[index];
//           if (selectedItem == currentSelectedItem) {
//             navigatorKeys[selectedItem]
//                 ?.currentState
//                 ?.popUntil((route) => route.isFirst);
//           }
//           setState(() {
//             selectedItem = currentSelectedItem;
//           });
//         },
//         items: items
//             .map((item, icon) => MapEntry(
//                 item.toString(),
//                 BottomNavigationBarItem(
//                     label: _getLabel(item),
//                     icon: Icon(
//                       icon,
//                       size: 30.0,
//                     ))))
//             .values
//             .toList(),
//       ),
//     );
//   }

//   String _getLabel(BottomNavItem item) {
//     switch (item) {
//       case BottomNavItem.one:
//         return "Home";
//       case BottomNavItem.two:
//         return "Storefront";
//       case BottomNavItem.three:
//         return "Enquiries";
//       case BottomNavItem.four:
//         return "Review";
//       default:
//         return "";
//     }
//   }

//   Widget _buildOffstageNavigator(BottomNavItem currentItem, bool isSelected) {
//     return Offstage(
//       offstage: !isSelected,
//       child: TabNavigator(
//         navigatorKey: navigatorKeys[currentItem]!,
//         item: currentItem,
//       ),
//     );
//   }
// }





































































// class NavigatorPage {
//   final Routing routes;
//   final IconData navIcon;
//   final String navLabel;
//   final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
//   NavigatorPage(
//       {required this.routes, required this.navIcon, required this.navLabel});
// }

// abstract class Routing {
//   Route<dynamic> getRoute(RouteSettings settings);
// }

// class HomeRoute implements Routing {
//   @override
//   Route getRoute(RouteSettings settings) {
//     final args = settings.arguments;
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(builder: (_) => HomeScreen());
//       case 'home2':
//         return MaterialPageRoute(builder: (_) => EnquiresScreen());
//       default:
//         return MaterialPageRoute(
//             builder: (_) => Container(
//                   child: Center(
//                     child: Text('${settings.name} does not exist'),
//                   ),
//                 ));
//     }
//   }
// }

// class SettingRoute implements Routing {
//   @override
//   Route getRoute(RouteSettings settings) {
//     final args = settings.arguments;
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(builder: (_) => HomeScreen());
//       case 'home2':
//         return MaterialPageRoute(builder: (_) => EnquiresScreen());
//       default:
//         return MaterialPageRoute(
//             builder: (_) => Container(
//                   child: Center(
//                     child: Text('${settings.name} does not exist'),
//                   ),
//                 ));
//     }
//   }
// }

// class BottomBarController extends ChangeNotifier {
//   late final List<NavigatorPage> _navPages;

//   List<NavigatorPage> get navPages => _navPages;

//   int _currentTab = 0;

//   int get currentTab => _currentTab;

//   NavigatorPage get currentNavigatorPage => navPages[_currentTab];

//   void init() {
//     _navPages = [
//       NavigatorPage(
//           routes: HomeRoute(),
//           navLabel: 'Explore',
//           navIcon: Icons.compass_calibration),
//       NavigatorPage(
//           routes: SettingRoute(), navLabel: 'Setting', navIcon: Icons.settings),
//     ];
//   }

//   void changeTab(int index) {
//     _currentTab = index;
//     notifyListeners();
//   }
// }

// class MainScreen extends StatelessWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var bottomController = BottomBarController()..init();

//     return WillPopScope(
//       onWillPop: () async {
//         NavigatorState? currentNavState =
//             bottomController.currentNavigatorPage.navKey.currentState;
//         if (currentNavState?.canPop() ?? true) {
//           currentNavState?.pop();
//           return false;
//         } else {
//           return true;
//         }
//       },
//       child: Scaffold(
//         body: AnimatedBuilder(
//             animation: bottomController,
//             builder: (context, child) {
//               return IndexedStack(
//                 index: bottomController.currentTab,
//                 children: bottomController.navPages
//                     .map((page) => Navigator(
//                           key: page.navKey,
//                           onGenerateRoute: page.routes.getRoute,
//                         ))
//                     .toList(),
//               );
//             }),
//         bottomNavigationBar: BottomBarWidget(
//           bottomController: bottomController,
//         ),
//       ),
//     );
//   }
// }

// class BottomBarWidget extends StatelessWidget {
//   final BottomBarController bottomController;

//   BottomBarWidget({Key? key, required this.bottomController}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//         animation: bottomController,
//         builder: (context, child) {
//           return BottomNavigationBar(
//               onTap: (index) {
//                 bottomController.changeTab(index);
//               },
//               currentIndex: bottomController.currentTab,
//               items: bottomController.navPages
//                   .map((page) => BottomNavigationBarItem(
//                       icon: Icon(page.navIcon), label: page.navLabel))
//                   .toList());
//         });
//   }
// }



// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _currentIndex = 0;
//   late PageController _pageController;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: _currentIndex);
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         children: const [
//           HomeScreen(),
//           StoreFrontScreen(),
//           EnquiresScreen(),
//           ReviewScreen(),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: AppColors.darkRed,
//         unselectedItemColor: AppColors.darkRed.withOpacity(0.5),
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           _pageController.animateToPage(
//             index,
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInOut,
//           );
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.storefront_outlined),
//             label: 'Storefront',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.message_outlined),
//             label: 'Enquires',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.star_border_outlined),
//             label: 'Reviews',
//           ),
//         ],
//         // unselectedLabelStyle: TextStyle(color: AppColors.darkRed),
//       ),
//     );
//   }
// }

