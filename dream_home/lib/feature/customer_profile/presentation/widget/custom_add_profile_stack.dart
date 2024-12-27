import 'package:dream_home/Core/extension/extension.dart';
import 'package:dream_home/core/utils/app_color.dart';
import 'package:dream_home/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widget/dialogs/custom_images_picker_dialog.dart';
import '../cubit/image_picker/image_picker_cubit.dart';

class CustomAddProfileStack extends StatelessWidget {
  final Widget? personIcon;
  final Color? borderColor;
  final Color? containerColor;
  final Color? iconBorderColor;
  final Color? iconColor;
  final Widget? child;
  const CustomAddProfileStack({
    super.key,
    this.personIcon,
    this.borderColor,
    this.containerColor,
    this.iconBorderColor,
    this.iconColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<ImagePickerCubit>();
    return Center(
      child: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: appCubit.image,
            builder: (context, image, child) {
              return Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: containerColor,
                  border: Border.all(
                    color: borderColor ?? AppColor.primaryColor,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: image == null
                      ? personIcon ??
                          SvgPicture.asset(
                            AppImages.person,
                            colorFilter: ColorFilter.mode(
                              AppColor.lightblack,
                              BlendMode.srcIn,
                            ),
                          )
                      : CircleAvatar(
                          radius: 60,
                          backgroundImage: FileImage(image),
                        ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: iconBorderColor ?? AppColor.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.edit_square,
                color: iconColor ?? AppColor.white,
              ).onTap(() {
                showImagePickerDialog(
                  cameraOnTap: () {
                    appCubit.imagePicker(ImageSource.camera);
                    context.pop();
                  },
                  galleryOnTap: () {
                    appCubit.imagePicker(ImageSource.gallery);
                    context.pop();
                  },
                  context,
                  cameraText: "Take By Camera",
                  galleryText: "Choose From Gallery",
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
