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
    image: AppImages.carpenter,
    jobNameEn: "Carpentry",
  ),
  WorkerDataModel(
    jobName: "Blacksmithing".tr(),
    image: AppImages.blacksmith,
    jobNameEn: "Blacksmithing",
  ),
  WorkerDataModel(
    jobName: "Plumbing".tr(),
    image: AppImages.plumber,
    jobNameEn: "Plumbing",
  ),
  WorkerDataModel(
    jobName: "Electricity".tr(),
    image: AppImages.electrician,
    jobNameEn: "Electricity",
  ),
  WorkerDataModel(
    jobName: "Painting".tr(),
    image: AppImages.painter,
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
    image: AppImages.flooring,
    jobNameEn: "Tiling and Flooring Installation",
  ),
  WorkerDataModel(
    jobName: "Cooling".tr(),
    image: AppImages.technician,
    jobNameEn: "Cooling and Air Conditioning",
  ),
  WorkerDataModel(
    jobName: "Electronic".tr(),
    image: AppImages.electronic,
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
