// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sandanter_dev_week_23_flutter/models/user_model/user_model.dart';
import 'package:sandanter_dev_week_23_flutter/services/api.dart';
import 'package:sandanter_dev_week_23_flutter/shared/app_settings.dart';
import 'package:sandanter_dev_week_23_flutter/widgets/balance.dart';
import 'package:sandanter_dev_week_23_flutter/widgets/card.dart';
import 'package:sandanter_dev_week_23_flutter/widgets/features.dart';
import 'package:sandanter_dev_week_23_flutter/widgets/header.dart';
import 'package:sandanter_dev_week_23_flutter/widgets/info_card.dart';

import '../../shared/app_colors.dart';
import '../../shared/app_images.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    user = await ApiApp.fetchUser(1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return user == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            drawer: const Drawer(),
            appBar: AppBar(
              backgroundColor: AppColors.red,
              foregroundColor: Colors.white,
              title: Center(
                child: SvgPicture.asset(
                  AppImages.logo,
                  height: 24,
                ),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset(
                    AppImages.notification,
                    height: 24,
                  ),
                ),
              ],
            ),
            body: Stack(
              children: [
                Column(
                  children: [
                    HeaderWidget(
                      user: user!,
                    ),
                    const SizedBox(height: 160),
                    FeaturesWidget(features: user!.features!),
                    const SizedBox(height: 10),
                    CardWidget(card: user!.card!),
                    const SizedBox(height: 10),
                    InfoCardsWidget(news: user!.news!),
                  ],
                ),
                Positioned(
                  top: (AppSettings.screenHeigth / 5) - 40,
                  child: BalanceWidget(account: user!.account!),
                ),
              ],
            ),
          );
  }
}
