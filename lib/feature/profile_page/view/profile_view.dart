import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/constants/app_string.dart';
import 'package:restaurant_app/core/constants/image_const.dart';
import 'package:restaurant_app/core/extensions/extension.dart';
import 'package:restaurant_app/feature/profile_page/viewModel/profil_view_model.dart';
import 'package:restaurant_app/products/component/image_card.dart';
import 'package:restaurant_app/products/widgets/bottom_navbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileViewModel>().firebaseName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavbar(pageid: 0),
      body: SingleChildScrollView(
          child: Column(
        children: [
          _stackWidget(context),
          _adminText(context),
          _adminFavorite(context),
          _reviews(context),
        ],
      )),
    );
  }

  Padding _adminText(BuildContext context) {
    var name = Provider.of<ProfileViewModel>(context).loggedInUser.fullName;
    return Padding(
      padding: context.pagePadding,
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer(
                builder: ((context, value, child) {
                  return Text(
                    '$name',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.blueMetallic,
                        fontWeight: FontWeight.bold),
                  );
                }),
              ),
              Text(
                StringConstant.united,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.silverlined, fontWeight: FontWeight.bold),
              ),
              Container(
                height: context.dynamicHeight(0.03),
                width: context.dynamicWidth(0.3),
                decoration: context.smallDecoraiton,
                child: Center(
                    child: Text(
                  StringConstant.edit,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.blueMetallic,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _reviews(BuildContext context) {
    return Padding(
      padding: context.pagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConstant.review,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.blueMetallic, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: context.dynamicHeight(0.02),
          ),
          SizedBox(
            width: context.dynamicWidth(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PngImage(name: ImageItems.logImage),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConstant.hello,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.blueMetallic,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: context.dynamicWidth(0.8),
                      child: Text(
                        StringConstant.text,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppColors.silverlined,
                                ),
                      ),
                    ),
                    SizedBox(
                      height: context.dynamicHeight(0.01),
                    ),
                    Row(children: [
                      for (int i = 0; i < 5; i++)
                        Icon(Icons.star,
                            size: 20,
                            color: i == 4
                                ? AppColors.darkGrey
                                : AppColors.california),
                      SizedBox(
                        width: context.dynamicWidth(0.03),
                      ),
                      Text(
                        StringConstant.number,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.darkGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding _adminFavorite(BuildContext context) {
    var imgList = context.read<ProfileViewModel>().imgModel;

    return Padding(
      padding: context.pagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConstant.admin,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.blueMetallic, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: context.dynamicHeight(0.4),
            child: Consumer(builder: ((context, value, child) {
              return GridView.builder(
                itemCount: imgList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ImageCard(
                      model: imgList[index],
                    ),
                  );
                },
              );
            })),
          ),
        ],
      ),
    );
  }

  Stack _stackWidget(BuildContext context) {
    return Stack(
      children: [
        const PngImage(name: ImageItems.stackImage),
        Padding(
          padding: context.pageTopPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.white,
                    size: 20,
                  )),
              Text(
                StringConstant.back,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: context.pagePaddingTopLef,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 0),
                      color: Colors.black38,
                      blurRadius: 10)
                ]),
            child: const CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 60,
                child: PngImage(
                  name: ImageItems.profileImage,
                )),
          ),
        ),
      ],
    );
  }
}
