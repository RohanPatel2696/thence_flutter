//======= FLUTTER IMPORTS: =======//
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//======= PACKAGE IMPORTS =======//
import 'package:nb_utils/nb_utils.dart';
import 'package:thence/application/export_blocs.dart';

//======= PROJECT IMPORTS =======//
import '../../utils/export_utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          return SizedBox(
            height: context.height(),
            width: context.width(),
            child: Text(mAppName, style: boldTextStyle(size: AppTextSize.textSize24, color: white)).center(),
          );
        }
      ),
    );
  }
}
