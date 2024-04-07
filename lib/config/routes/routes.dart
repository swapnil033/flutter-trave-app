import 'package:flutter/material.dart';
import 'package:travel_app/features/travel_list/presentation/pages/add_travel.dart';
import 'package:travel_app/features/travel_list/presentation/pages/home.dart';
import 'package:travel_app/features/travel_list/presentation/pages/travel_details.dart';

import '../../features/travel_list/domain/entites/travel.dart';

class Screens {
  static const home = '/';
  static const addTravel = '/AddTravel';
  static const travelDetails = '/TravelDetails';
}

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Screens.home:
        return _materialRoute(const HomePage());

      case Screens.addTravel:
        if (settings.arguments != null) {
          return _materialRoute(
            AddTravelPage(travelEntity: settings.arguments as TravelEntity),
          );
        }
        return _materialRoute(const AddTravelPage());

      case Screens.travelDetails:
        return _materialRoute(const TravelDetailsPage());

      default:
        return _materialRoute(const HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
