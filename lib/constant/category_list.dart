import 'package:flutter/material.dart';
import 'package:splitwise/utils/common_strings.dart';

import '../model/model_category_list.dart';
import '../utils/colors.dart';

class EntertainmentList {
  static List<CategoryListModel> entertainmentList = [
    const CategoryListModel(
      color: CommonColors.entertainmentListColor,
      iconName: CommonStrings.entertainmentGames,
      iconData: Icons.videogame_asset_rounded,
    ),
    const CategoryListModel(
      color: CommonColors.entertainmentListColor,
      iconName: CommonStrings.entertainmentMovies,
      iconData: Icons.movie_outlined,
    ),
    const CategoryListModel(
      color: CommonColors.entertainmentListColor,
      iconName: CommonStrings.entertainmentMusic,
      iconData: Icons.music_note_outlined,
    ),
    const CategoryListModel(
      color: CommonColors.entertainmentListColor,
      iconName: CommonStrings.commonOtherCategory,
      iconData: Icons.event_note_rounded,
    ),
    const CategoryListModel(
      color: CommonColors.entertainmentListColor,
      iconName: CommonStrings.entertainmentSports,
      iconData: Icons.sports_basketball_sharp,
    ),
  ];
}

class FoodAndDrinkList {
  static List<CategoryListModel> foodAndDrinkList = [
    const CategoryListModel(
      color: CommonColors.foodAndDrinkListColor,
      iconName: CommonStrings.foodAnDrinkGroceries,
      iconData: Icons.local_grocery_store_rounded,
    ),
    const CategoryListModel(
      color: CommonColors.foodAndDrinkListColor,
      iconName: CommonStrings.foodAnDrinkDiningOut,
      iconData: Icons.dining_outlined,
    ),
    const CategoryListModel(
      color: CommonColors.foodAndDrinkListColor,
      iconName: CommonStrings.commonOtherCategory,
      iconData: Icons.brunch_dining,
    ),
    const CategoryListModel(
      color: CommonColors.foodAndDrinkListColor,
      iconName: CommonStrings.foodAnDrinkLiquor,
      iconData: Icons.liquor,
    ),
  ];
}

class HomeList {
  static List<CategoryListModel> homeList = [
    const CategoryListModel(
      color: CommonColors.homeListColor,
      iconName: CommonStrings.homeRent,
      iconData: Icons.house_outlined,
    ),
    const CategoryListModel(
      color: CommonColors.homeListColor,
      iconName: CommonStrings.homeMortgage,
      iconData: Icons.house,
    ),
    const CategoryListModel(
      color: CommonColors.homeListColor,
      iconName: CommonStrings.homeHouseHold,
      iconData: Icons.gas_meter,
    ),
    const CategoryListModel(
      color: CommonColors.homeListColor,
      iconName: CommonStrings.homeFurniture,
      iconData: Icons.chair,
    ),
    const CategoryListModel(
      color: CommonColors.homeListColor,
      iconName: CommonStrings.homeMaintenance,
      iconData: Icons.handyman,
    ),
    const CategoryListModel(
      color: CommonColors.homeListColor,
      iconName: CommonStrings.commonOtherCategory,
      iconData: Icons.note_alt_rounded,
    ),
    const CategoryListModel(
      color: CommonColors.homeListColor,
      iconName: CommonStrings.homePets,
      iconData: Icons.pets,
    ),
    const CategoryListModel(
      color: CommonColors.homeListColor,
      iconName: CommonStrings.homeServices,
      iconData: Icons.fastfood_sharp,
    ),
    const CategoryListModel(
      color: CommonColors.homeListColor,
      iconName: CommonStrings.homeElectronics,
      iconData: Icons.electric_bolt,
    ),
  ];
}

class LifeList {
  static List<CategoryListModel> lifeList = [
    const CategoryListModel(
      color: CommonColors.lifeListColor,
      iconName: CommonStrings.lifeInsurance,
      iconData: Icons.sticky_note_2_rounded,
    ),
    const CategoryListModel(
      color: CommonColors.lifeListColor,
      iconName: CommonStrings.lifeCloth,
      iconData: Icons.dry_cleaning,
    ),
    const CategoryListModel(
      color: CommonColors.lifeListColor,
      iconName: CommonStrings.lifeCar,
      iconData: Icons.car_crash_sharp,
    ),
    const CategoryListModel(
      color: CommonColors.lifeListColor,
      iconName: CommonStrings.lifeBusTrain,
      iconData: Icons.train,
    ),
    const CategoryListModel(
      color: CommonColors.lifeListColor,
      iconName: CommonStrings.lifeGasFuel,
      iconData: Icons.local_gas_station,
    ),
    const CategoryListModel(
      color: CommonColors.lifeListColor,
      iconName: CommonStrings.commonOtherCategory,
      iconData: Icons.note_alt_rounded,
    ),
    const CategoryListModel(
      color: CommonColors.lifeListColor,
      iconName: CommonStrings.lifePlan,
      iconData: Icons.airplanemode_on,
    ),
    const CategoryListModel(
      color: CommonColors.lifeListColor,
      iconName: CommonStrings.lifeTaxi,
      iconData: Icons.local_taxi_rounded,
    ),
    const CategoryListModel(
      color: CommonColors.lifeListColor,
      iconName: CommonStrings.lifeBicycle,
      iconData: Icons.motorcycle,
    ),
    const CategoryListModel(
      color: CommonColors.lifeListColor,
      iconName: CommonStrings.lifeHotel,
      iconData: Icons.apartment,
    ),
  ];
}

class UncategorizedList {
  static List<CategoryListModel> uncategorizedList = [
    const CategoryListModel(
      color: CommonColors.lightGreyColor,
      iconName: CommonStrings.uncategorizedGeneral,
      iconData: Icons.note_alt_sharp,
    ),
  ];
}

class UtilitiesList {
  static List<CategoryListModel> utilitiesList = [
    const CategoryListModel(
      color: CommonColors.utilitiesListColor,
      iconName: CommonStrings.utilitiesElectricity,
      iconData: Icons.lightbulb,
    ),
    const CategoryListModel(
      color: CommonColors.utilitiesListColor,
      iconName: CommonStrings.utilitiesHeatGas,
      iconData: Icons.water_drop_sharp,
    ),
    const CategoryListModel(
      color: CommonColors.utilitiesListColor,
      iconName: CommonStrings.utilitiesWater,
      iconData: Icons.water_drop_outlined,
    ),
    const CategoryListModel(
      color: CommonColors.utilitiesListColor,
      iconName: CommonStrings.utilitiesTvPhone,
      iconData: Icons.wifi,
    ),
    const CategoryListModel(
      color: CommonColors.utilitiesListColor,
      iconName: CommonStrings.commonOtherCategory,
      iconData: Icons.note_add_rounded,
    ),
    const CategoryListModel(
      color: CommonColors.utilitiesListColor,
      iconName: CommonStrings.utilitiesTrash,
      iconData: Icons.restore_from_trash,
    ),
    const CategoryListModel(
      color: CommonColors.utilitiesListColor,
      iconName: CommonStrings.utilitiesClean,
      iconData: Icons.waving_hand,
    ),
  ];
}
