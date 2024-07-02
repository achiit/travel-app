import 'package:dump_it/ui/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingViewModel with ChangeNotifier {
  final List<OnboardingModel> onboardingPages;
  int currentPage = 0;

  OnboardingViewModel(this.onboardingPages);

  void setPage(int index) {
    currentPage = index;
    notifyListeners();
  }
}
