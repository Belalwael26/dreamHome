import 'package:dream_home/core/utils/app_images.dart';
import 'package:easy_localization/easy_localization.dart';

class WorkerDataModel {
  final String jobName;
  final String image;
  final String jobNameEn;

  WorkerDataModel({
    required this.jobName,
    required this.image,
    required this.jobNameEn,
  });
}

final List<WorkerDataModel> worker = [
  WorkerDataModel(
    jobName: "Carpentry".tr(),
    image: AppImages.carpentry,
    jobNameEn: "Carpentry",
  ),
  WorkerDataModel(
    jobName: "Blacksmithing".tr(),
    image: AppImages.blacksmith,
    jobNameEn: "Blacksmithing",
  ),
  WorkerDataModel(
    jobName: "Plumbing".tr(),
    image: AppImages.bgPlumbing,
    jobNameEn: "Plumbing",
  ),
  WorkerDataModel(
    jobName: "Electricity".tr(),
    image: AppImages.electricity,
    jobNameEn: "Electricity",
  ),
  WorkerDataModel(
    jobName: "Painting".tr(),
    image: AppImages.painting,
    jobNameEn: "Painting",
  ),
  WorkerDataModel(
    jobName: "Tiling".tr(),
    image: AppImages.tiler,
    jobNameEn: "Tiling",
  ),
  WorkerDataModel(
    jobName: "Carving".tr(),
    image: AppImages.sculptor,
    jobNameEn: "Carving and Sculpting",
  ),
  WorkerDataModel(
    jobName: "Flooring".tr(),
    image: AppImages.woodenFlooring,
    jobNameEn: "Tiling and Flooring Installation",
  ),
  WorkerDataModel(
    jobName: "Cooling".tr(),
    image: AppImages.airConditioner,
    jobNameEn: "Cooling and Air Conditioning",
  ),
  WorkerDataModel(
    jobName: "Electronic".tr(),
    image: AppImages.appliance,
    jobNameEn: "Electronic Repairs",
  ),
  WorkerDataModel(
    jobName: "Appliance".tr(),
    image: AppImages.home,
    jobNameEn: "Home Appliance Maintenance",
  ),
  WorkerDataModel(
    jobName: "House".tr(),
    image: AppImages.clean,
    jobNameEn: "House Cleaning",
  ),
];
