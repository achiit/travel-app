import 'package:dump_it/ui/view_models/onboarding_VM.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OnboardingViewModel>(context);
    final PageController pageController = PageController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Adaptive.h(15),
              ),
              Expanded(
                flex: 2,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    viewModel.setPage(index);
                  },
                  itemCount: viewModel.onboardingPages.length,
                  itemBuilder: (context, index) {
                    final page = viewModel.onboardingPages[index];
                    return Container(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: Adaptive.h(8),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: SvgPicture.asset(
                              page.imagePath,
                              height: Adaptive.h(34),
                            ),
                          ),
                          SizedBox(
                            height: Adaptive.h(10),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              page.title,
                              style: GoogleFonts.reemKufi(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Adaptive.h(2),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Text(
                              page.description,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.reemKufi(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: Adaptive.h(2),
              ),
              SizedBox(
                height: Adaptive.h(4),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(38.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        final lastPageIndex =
                            viewModel.onboardingPages.length - 1;
                        viewModel.setPage(lastPageIndex);
                        pageController.jumpToPage(lastPageIndex);
                      },
                      child: Text(
                        "Skip",
                        style: GoogleFonts.reemKufi(
                          color: Colors.grey[600],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: pageController,
                      count: viewModel.onboardingPages.length,
                      effect: ExpandingDotsEffect(
                        dotColor: Color(0xffFFD4D4),
                        activeDotColor: Color(0xffCE2022),
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 8,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (viewModel.currentPage <
                            viewModel.onboardingPages.length - 1) {
                          pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.of(context).pushNamed('/signup');
                        }
                      },
                      child: Text(
                        "Next",
                        style: GoogleFonts.reemKufi(
                          color: Color(0xff2FA45E),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
