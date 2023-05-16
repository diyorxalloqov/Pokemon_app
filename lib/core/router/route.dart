/////////        Singletone  

// import 'package:flutter/material.dart';
// import 'package:pokemon/ui/MainPage.dart';

// class RouteList {
//   static final RouteList _generate = RouteList.init();
//   static RouteList get router => _generate;

//   RouteList.init();

//   Route? onGenrate(RouteSettings settings) {
//     switch (settings.name) {
//       case "MainPage":
//         return _navigate(const MainPage());
//       case "InfoPage":
//         return _navigate(const InfoPage());
//     }
//   }

//   MaterialPageRoute _navigate(Widget widget) {
//     return MaterialPageRoute(builder: ((context) => widget));
//   }
// }