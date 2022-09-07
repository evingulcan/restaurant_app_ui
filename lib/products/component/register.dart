import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/constants/app_string.dart';

import 'package:restaurant_app/core/extensions/extension.dart';

import 'package:restaurant_app/products/mixin/validation.dart';

class RegisterComponent extends StatefulWidget {
  const RegisterComponent({Key? key}) : super(key: key);

  @override
  State<RegisterComponent> createState() => _RegisterComponentState();
}

class _RegisterComponentState extends State<RegisterComponent> with Validation {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: context.pagePaddingLetfTopRigth,
            child: Text(
              StringConstant.registerText,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: AppColors.blueMetallic, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: context.dynamicHeight(0.03),
        ),
        Container(
          height: context.dynamicHeight(0.45),
          width: context.dynamicWidth(0.85),
          decoration: context.boxDecoraiton,
          child: Padding(
            padding: context.largePadding,
            child: Column(children: [
              SizedBox(
                height: context.dynamicHeight(0.02),
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: context.pagePadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      fullNameField,
                      emailField,
                      passwordField,
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.03),
              ),
              Material(
                child: Container(
                  color: AppColors.palatinateBlue,
                  height: context.dynamicHeight(0.06),
                  width: context.dynamicWidth(0.60),
                  child: MaterialButton(
                      onPressed: () {
                        signUp(emailEditingController.text,
                            passwordEditingController.text);
                      },
                      child: Text(
                        StringConstant.continu,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
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
