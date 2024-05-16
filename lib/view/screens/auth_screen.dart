import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app/config.dart';
import '../../core/core.dart';
import '../blocs/auth/auth_bloc.dart';
import '../constants/app_colors.dart';
import 'login_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.goNamed(Routes.contactRoute);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Positioned(
                height: MediaQuery.sizeOf(context).height * 0.3,
                width: MediaQuery.sizeOf(context).width / 2,
                left: MediaQuery.sizeOf(context).width * 0.25,
                top: MediaQuery.sizeOf(context).height * 0.3,
                child: Image.asset(
                  ImgsManager.placeHolder,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 50,
                left: 30,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      width: 40,
                      height: 40,
                      color: Colors.white,
                      child: Image.asset(
                        AssetsManager.totLogo,
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: MediaQuery.sizeOf(context).width * 0.3,
                left: MediaQuery.sizeOf(context).width * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isDismissible: true,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(22))),
                        builder: (_) {
                          return LoginBottomSheet(
                            onPressed: (loginInputs) {
                              context
                                  .read<AuthBloc>()
                                  .add(LoginEvent(loginInputs));
                            },
                          );
                        });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fixedSize: Size(
                      MediaQuery.sizeOf(context).width * 0.9,
                      50,
                    ),
                    // Set the background color here
                  ),
                  child: Text(
                    context.tr.login,
                    style: const TextStyle(
                        color: AppColors.totColor, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
