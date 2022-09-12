import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/feature/login_register_page/viewModel/login_view_model.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.changeObscureCallBack,
    this.isObsecure,
    required this.validator,
    required Null Function(dynamic value) onSaved,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  final bool? isObsecure;
  final VoidCallback changeObscureCallBack;
  final String? Function(String?)? validator;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: ((context, value, child) {
        return TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.silverlined,
                  fontWeight: FontWeight.w600,
                ),
            suffixIcon: widget.hintText == "Şifre"
                ? context.watch<LoginViewModel>().isObsecures ?? false
                    ? IconButton(
                        onPressed: () =>
                            context.read<LoginViewModel>().changeObsecure(),
                        icon: const Icon(Icons.visibility_off_rounded),
                      )
                    : IconButton(
                        onPressed: () =>
                            context.read<LoginViewModel>().changeObsecure(),
                        icon: const Icon(Icons.visibility),
                      )
                : const SizedBox(),
          ),
          obscureText: context.watch<LoginViewModel>().isObsecures ?? false,
        );
      }),
    );
  }
}
