import 'package:dream_home/core/utils/app_images.dart';

class WorkerDataModel {
  final String jobName;
  final String image;

  WorkerDataModel({
    required this.jobName,
    required this.image,
  });
}

final List<WorkerDataModel> worker = [
  WorkerDataModel(jobName: "Carpentry", image: AppImages.vec1),
  WorkerDataModel(jobName: "Blacksmithing", image: AppImages.vec2),
  WorkerDataModel(jobName: "Plumbing", image: AppImages.vec3),
  WorkerDataModel(jobName: "Electricity", image: AppImages.vec4),
  WorkerDataModel(jobName: "Painting", image: AppImages.vec1),
  WorkerDataModel(jobName: "Tiling ", image: AppImages.vec2),
  WorkerDataModel(jobName: "Carving and Sculpting", image: AppImages.vec3),
  WorkerDataModel(
      jobName: "Tiling and Flooring Installation", image: AppImages.vec4),
  WorkerDataModel(
      jobName: "Cooling and Air Conditioning", image: AppImages.vec1),
  WorkerDataModel(jobName: "Electronic Repairs", image: AppImages.vec2),
  WorkerDataModel(jobName: "Home Appliance Maintenance", image: AppImages.vec3),
  WorkerDataModel(jobName: "Home Carpentry", image: AppImages.vec4),
  WorkerDataModel(jobName: "House Cleaning ", image: AppImages.vec1),
];
