// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sandanter_dev_week_23_flutter/models/user_model/user_model.dart';

import '../shared/app_colors.dart';
import '../shared/app_settings.dart';

class HeaderWidget extends StatefulWidget {
  final UserModel user;

  const HeaderWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      height: AppSettings.screenHeigth / 5,
      width: AppSettings.screenWidth,
      color: AppColors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            // 'Olá, ${widget.user.name}',
            'Olá, Italo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Ag ${widget.user.account!.agency} Cc ${widget.user.account!.number}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
