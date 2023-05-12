import 'package:flutter/material.dart';
import 'package:splitwise/routes/navigator_service.dart';

import '../../../common_methods/commonmethod_category_list.dart';
import '../../../constant/category_list.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_strings.dart';
import '../../../utils/theme_data.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: CommonColors.blackColor,
        ),
        backgroundColor: CommonColors.whiteColor,
        title: TextFormField(
          decoration: InputDecoration(
            hintText: CommonStrings.selectCategoryTextField,
            hintStyle: themeData.textTheme.bodySmall!.copyWith(
              color: CommonColors.blackColor,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                CommonStrings.entertainment,
                style: themeData.textTheme.bodySmall!.copyWith(
                  color: CommonColors.blackColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () => NavigationService.instance
                        .goBack(EntertainmentList.entertainmentList[index]),
                    child: ListOfCategory(
                      color: CommonColors.entertainmentListColor,
                      iconName: EntertainmentList
                          .entertainmentList[index].iconName
                          .toString(),
                      iconData:
                          EntertainmentList.entertainmentList[index].iconData,
                    ),
                  );
                },
                itemCount: EntertainmentList.entertainmentList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              Text(
                CommonStrings.foodAndDrink,
                style: themeData.textTheme.bodySmall!.copyWith(
                  color: CommonColors.blackColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () => NavigationService.instance
                        .goBack(FoodAndDrinkList.foodAndDrinkList[index]),
                    child: ListOfCategory(
                      color: CommonColors.foodAndDrinkListColor,
                      iconName: FoodAndDrinkList
                          .foodAndDrinkList[index].iconName
                          .toString(),
                      iconData:
                          FoodAndDrinkList.foodAndDrinkList[index].iconData,
                    ),
                  );
                },
                itemCount: FoodAndDrinkList.foodAndDrinkList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              Text(
                CommonStrings.home,
                style: themeData.textTheme.bodySmall!.copyWith(
                  color: CommonColors.blackColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () => NavigationService.instance
                        .goBack(HomeList.homeList[index]),
                    child: ListOfCategory(
                      color: CommonColors.homeListColor,
                      iconName: HomeList.homeList[index].iconName.toString(),
                      iconData: HomeList.homeList[index].iconData,
                    ),
                  );
                },
                itemCount: HomeList.homeList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              Text(
                CommonStrings.life,
                style: themeData.textTheme.bodySmall!.copyWith(
                  color: CommonColors.blackColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () => NavigationService.instance
                        .goBack(LifeList.lifeList[index]),
                    child: ListOfCategory(
                      color: CommonColors.lifeListColor,
                      iconName: LifeList.lifeList[index].iconName.toString(),
                      iconData: LifeList.lifeList[index].iconData,
                    ),
                  );
                },
                itemCount: LifeList.lifeList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              Text(
                CommonStrings.uncategorized,
                style: themeData.textTheme.bodySmall!.copyWith(
                  color: CommonColors.blackColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () => NavigationService.instance
                        .goBack(UncategorizedList.uncategorizedList[index]),
                    child: ListOfCategory(
                      color: CommonColors.lightGreyColor,
                      iconName: UncategorizedList
                          .uncategorizedList[index].iconName
                          .toString(),
                      iconData:
                          UncategorizedList.uncategorizedList[index].iconData,
                    ),
                  );
                },
                itemCount: UncategorizedList.uncategorizedList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              Text(
                CommonStrings.utilities,
                style: themeData.textTheme.bodySmall!.copyWith(
                  color: CommonColors.blackColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () => NavigationService.instance
                        .goBack(UtilitiesList.utilitiesList[index]),
                    child: ListOfCategory(
                      color: CommonColors.utilitiesListColor,
                      iconName: UtilitiesList.utilitiesList[index].iconName
                          .toString(),
                      iconData: UtilitiesList.utilitiesList[index].iconData,
                    ),
                  );
                },
                itemCount: UtilitiesList.utilitiesList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
