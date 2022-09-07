import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/constants/app_string.dart';
import 'package:restaurant_app/core/constants/image_const.dart';
import 'package:restaurant_app/core/extensions/extension.dart';
import 'package:restaurant_app/feature/home_page/viewModel/home_view_model.dart';
import 'package:restaurant_app/feature/profile_page/viewModel/profil_view_model.dart';
import 'package:restaurant_app/products/component/category_widget.dart';
import 'package:restaurant_app/products/component/favorit_widget.dart';
import 'package:restaurant_app/products/component/menu_list.dart';
import 'package:restaurant_app/products/component/openRest_widget.dart';
import 'package:restaurant_app/products/widgets/bottom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late double screenHeight, screenWidth;
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<double> scaleMenuAnimation;
  late Animation<Offset> menuOffsetAnimation;

  final Duration duration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: duration);
    scaleAnimation = Tween(begin: 1.0, end: 0.6).animate(controller);
    scaleMenuAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);
    menuOffsetAnimation =
        Tween(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: context.watch<HomeViewModel>().menuOpenMi == false
          ? const BottomNavbar(pageid: 2)
          : SafeArea(
              child: Stack(
                children: <Widget>[
                  menuOlustur(context),
                  dashBoardOlustur(context),
                ],
              ),
            ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            menuOlustur(context),
            dashBoardOlustur(context),
          ],
        ),
      ),
    );
  }

  Widget dashBoardOlustur(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      left: context.watch<HomeViewModel>().menuOpenMi ? 0.3 * screenWidth : 0,
      right: context.watch<HomeViewModel>().menuOpenMi ? -0.3 * screenWidth : 0,
      bottom: 0,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Material(
          borderRadius: context.watch<HomeViewModel>().menuOpenMi
              ? context.radiusAll
              : null,
          elevation: 0,
          child: Padding(
            padding: context.pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _appBar(context),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                _textFormField(context),
                Expanded(
                  flex: 3,
                  child: _categoryListView(),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                Text(
                  StringConstant.favrestaurat,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: AppColors.blueMetallic,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                Expanded(
                  flex: 6,
                  child: _favoriteListView(),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                _openRestaurant(context),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                Expanded(
                  child: _openListView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _appBar(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: context.pagePaddingRigth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer(
            builder: ((context, value, child) {
              return InkWell(
                  onTap: () {
                    if (context.read<HomeViewModel>().menuOpenMi) {
                      controller.reverse();
                    } else {
                      controller.forward();
                    }
                    context.read<HomeViewModel>().menuOpenClose();
                  },
                  child: SvgImage(name: ImageItems().menu));
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on_outlined,
                  color: AppColors.metropolitan.withOpacity(0.2)),
              Text(
                StringConstant.addresText,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.anon,
                    ),
              ),
            ],
          ),
          CircleAvatar(child: PngImage(name: ImageItems().admin)),
        ],
      ),
    );
  }

  Consumer<Object?> _openListView() {
    var openList = context.read<HomeViewModel>().openModel;
    return Consumer(
      builder: ((context, value, child) {
        return ListView.builder(
            itemCount: openList.length,
            itemBuilder: (context, index) {
              return OpenRestWidget(model: openList[index]);
            });
      }),
    );
  }

  Consumer<Object?> _favoriteListView() {
    var favList = context.read<HomeViewModel>().favModel;
    return Consumer(builder: ((context, value, child) {
      return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: favList.length,
          itemBuilder: (context, index) {
            return FavoriteWidget(model: favList[index]);
          });
    }));
  }

  Consumer<Object?> _categoryListView() {
    var catList = context.read<HomeViewModel>().catModel;
    return Consumer(
      builder: ((context, value, child) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: catList.length,
            itemBuilder: (context, index) {
              return CategoryWidget(model: catList[index]);
            });
      }),
    );
  }

  Row _openRestaurant(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          StringConstant.open,
          style: Theme.of(context).textTheme.headline5?.copyWith(
              color: AppColors.blueMetallic, fontWeight: FontWeight.bold),
        ),
        Row(children: [
          Text(
            StringConstant.delvery,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: AppColors.california, fontWeight: FontWeight.bold),
          ),
          const Icon(Icons.keyboard_arrow_down_rounded,
              color: AppColors.gravelfint)
        ]),
      ],
    );
  }

  Column _textFormField(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: context.likePadding,
          child: Text(
            StringConstant.likeEat,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                color: AppColors.blueMetallic, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: context.pagePaddingAll,
          decoration: context.boxDecoraiton,
          child: Padding(
            padding: context.pagePaddingRigth,
            child: TextFormField(
                cursorColor: AppColors.california,
                decoration: const InputDecoration(
                  hintText: StringConstant.enter,
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColors.california,
                  ),
                )),
          ),
        ),
      ],
    );
  }

  Widget menuOlustur(BuildContext context) {
    var drawList = context.read<HomeViewModel>().drawModel;
    return SlideTransition(
      position: menuOffsetAnimation,
      child: ScaleTransition(
        scale: scaleMenuAnimation,
        child: Container(
          color: AppColors.california,
          child: Column(
            children: [
              Padding(
                padding: context.dashPadding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: AppColors.white,
                      child: PngImage(name: ImageItems().admin),
                    ),
                    SizedBox(
                      width: context.dynamicWidth(0.03),
                    ),
                    Consumer(builder: ((context, value, child) {
                      return Text(
                        '${context.read<ProfileViewModel>().loggedInUser.fullName}',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                      );
                    }))
                  ],
                ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.1),
              ),
              Expanded(
                child: Consumer(
                  builder: ((context, value, child) {
                    return ListView.builder(
                        itemCount: drawList.length,
                        itemBuilder: (context, index) {
                          return MenuList(model: drawList[index]);
                        });
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
