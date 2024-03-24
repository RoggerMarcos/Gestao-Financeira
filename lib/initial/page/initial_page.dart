import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gestaofinanceira/router/app_router.dart';
import 'package:gestaofinanceira/shared/colors/app_colors.dart';
import 'package:gestaofinanceira/shared/components/app_logo_title.dart';
import 'package:gestaofinanceira/shared/storage/app_key.dart';
import 'package:gestaofinanceira/shared/storage/app_secure_storage.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  void redirect(BuildContext context) {
    Timer(const Duration(seconds: 2), () async {
      String? user = await AppSecureStorage.readItem(AppKey.user);

      Navigator.of(context).pushReplacementNamed(user != null ? AppRouter.home : AppRouter.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    redirect(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              AppLogoTitle(title: 'My Money'),
            ],
          ),
        ),
      ),
    );
  }
}
