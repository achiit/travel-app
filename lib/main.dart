import 'package:dump_it/app/app.dart';
import 'package:dump_it/ui/models/onboarding_model.dart';
import 'package:dump_it/ui/view_models/onboarding_VM.dart';

import 'package:dump_it/ui/view_models/splash_VM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => ResponsiveSizer(
        builder: (context, orientation, ScreenType) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => SplashViewModel()),
              ChangeNotifierProvider(
                create: (_) => OnboardingViewModel([
                  OnboardingModel(
                    imagePath: "assets/splash1.svg",
                    title: "Plan Trips!",
                    description:
                        " When an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  ),
                  OnboardingModel(
                    imagePath: "assets/splash2.svg",
                    title: "Explore hidden gems!",
                    description:
                        " When an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  ),
                  OnboardingModel(
                    imagePath: "assets/splash3.svg",
                    title: "Make a Community!",
                    description:
                        " When an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  )
                ]),
              ),
            ],
            child: const App(),
          );
        },
      ),
    ),
  );
}
