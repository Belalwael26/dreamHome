import 'package:dream_home/core/utils/app_images.dart';

class OnBoardingModel {
  final String title;
  final String subTitle;
  final String image;

  OnBoardingModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

List<OnBoardingModel> onBoarding = [
  OnBoardingModel(
    title: "Welcome to Dream Home",
    subTitle:
        "Connecting skilled craft workers with clients for every project need.",
    image: AppImages.vec6,
  ),
  OnBoardingModel(
    title: "Showcase Your Expertise",
    subTitle:
        "Build a professional profile to highlight your craft and reach more clients.",
    image: AppImages.vec8,
  ),
  OnBoardingModel(
    title: "Find the Right Talent",
    subTitle:
        "Explore skilled craft workers for your projects, all in one place",
    image: AppImages.vec5,
  ),
  OnBoardingModel(
    title: "Connect & Collaborate",
    subTitle:
        "Communicate with clients or craft workers in real-time and manage your projects effortlessly",
    image: AppImages.vec7,
  ),
  OnBoardingModel(
    title: "Reliable Services",
    subTitle:
        "Experience reliable services from skilled craft workers with secure payments and verified profiles.",
    image: AppImages.vec9,
  ),
];
