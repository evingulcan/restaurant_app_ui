import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/constants/app_string.dart';

import 'package:restaurant_app/core/extensions/extension.dart';

import 'package:restaurant_app/products/mixin/validation.dart';

class LoginComponent extends StatefulWidget {
  const LoginComponent({Key? key}) : super(key: key);

  @override
  State<LoginComponent> createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> with Validation {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: context.pagePaddingLetfTopRigth,
            child: Text(
              StringConstant.loginText,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: AppColors.blueMetallic, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: context.dynamicHeight(0.06),
        ),
        Container(
          height: context.dynamicHeight(0.45),
          width: context.dynamicWidth(0.85),
          decoration: context.boxDecoraiton,
          child: Padding(
            padding: context.largePadding,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                StringConstant.emailText,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: AppColors.silverlined,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.02),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    emailField,
                    passwordField,
                  ],
                ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.07),
              ),
              Material(
                child: Container(
                  color: AppColors.palatinateBlue,
                  height: context.dynamicHeight(0.06),
                  width: context.dynamicWidth(0.60),
                  child: MaterialButton(
                      onPressed: () {
                        signIn(emailEditingController.text,
                            passwordEditingController.text);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            StringConstant.continu,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: context.dynamicWidth(0.03),
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: AppColors.white,
                          )
                        ],
                      )),
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
