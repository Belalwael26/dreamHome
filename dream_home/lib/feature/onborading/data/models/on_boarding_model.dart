import 'package:dream_home/core/utils/app_images.dart';
import 'package:easy_localization/easy_localization.dart';

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
    title: "onboardingTitle1".tr(),
    subTitle: "onboardingsubtitle1".tr(),
    image: AppImages.vec6,
  ),
  OnBoardingModel(
    title: "onboardingTitle2".tr(),
    subTitle: "onboardingsubtitle2".tr(),
    image: AppImages.vec8,
  ),
  OnBoardingModel(
    title: "onboardingTitle3".tr(),
    subTitle: "onboardingsubtitle3".tr(),
    image: AppImages.vec5,
  ),
  OnBoardingModel(
    title: "onboardingTitle4".tr(),
    subTitle: "onboardingsubtitle4".tr(),
    image: AppImages.vec7,
  ),
  OnBoardingModel(
    title: "onboardingTitle5".tr(),
    subTitle: "onboardingsubtitle5".tr(),
    image: AppImages.vec9,
  ),
];
