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
  WorkerDataModel(jobName: "Carpentry", image: AppImages.carpenter),
  WorkerDataModel(jobName: "Blacksmithing", image: AppImages.blacksmith),
  WorkerDataModel(jobName: "Plumbing", image: AppImages.plumber),
  WorkerDataModel(jobName: "Electricity", image: AppImages.electrician),
  WorkerDataModel(jobName: "Painting", image: AppImages.painter),
  WorkerDataModel(jobName: "Tiling ", image: AppImages.tiler),
  WorkerDataModel(jobName: "Carving and Sculpting", image: AppImages.sculptor),
  WorkerDataModel(
      jobName: "Tiling and Flooring Installation", image: AppImages.flooring),
  WorkerDataModel(
      jobName: "Cooling and Air Conditioning", image: AppImages.technician),
  WorkerDataModel(jobName: "Electronic Repairs", image: AppImages.electronic),
  WorkerDataModel(jobName: "Home Appliance Maintenance", image: AppImages.home),
  WorkerDataModel(jobName: "House Cleaning ", image: AppImages.clean),
];
