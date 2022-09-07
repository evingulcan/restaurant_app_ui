import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/constants/app_string.dart';
import 'package:restaurant_app/core/constants/image_const.dart';
import 'package:restaurant_app/core/extensions/extension.dart';
import 'package:restaurant_app/products/component/login.dart';
import 'package:restaurant_app/products/component/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            PngImage(name: ImageItems().loginlogoImage),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: context.dynamicHeight(0.05)),
                  DefaultTabController(
                    length: 4,
                    initialIndex: 0,
                    child: Column(children: <Widget>[
                      TabBar(
                        indicatorColor: AppColors.silverlined.withOpacity(0.02),
                        labelColor: AppColors.consumedByFire,
                        unselectedLabelColor: AppColors.blueMetallic,
                        tabs: const [
                          Tab(text: StringConstant.login),
                          Tab(text: StringConstant.register),
                          Tab(text: ''),
                          Tab(text: ''),
                        ],
                      ),
                      Container(
                        height: context.dynamicHeight(0.70),
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: AppColors.porpoise, width: 0.5))),
                        child: TabBarView(children: <Widget>[
                          const LoginComponent(),
                          const RegisterComponent(),
                          Container(),
                          Container(),
                        ]),
                      ),
                    ]),
                  ),
                  _gmailFacebookWidget(context),
                ]),
          ],
        ),
      ),
    );
  }

  Container _gmailFacebookWidget(BuildContext context) {
    return Container(
      padding: context.middlePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(StringConstant.loginWith),
          SizedBox(
            height: context.dynamicHeight(0.02),
          ),
          Row(
            children: [
              SvgImage(name: ImageItems().gamil),
              SizedBox(
                width: context.dynamicWidth(0.03),
              ),
              SvgImage(name: ImageItems().facebook),
            ],
          ),
        ],
      ),
    );
  }
}
