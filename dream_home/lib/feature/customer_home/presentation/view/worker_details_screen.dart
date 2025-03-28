import 'dart:developer';

import 'package:dream_home/Core/extension/extension.dart';
import 'package:dream_home/Core/styles/app_text_style.dart';
import 'package:dream_home/app/routes/routes.dart';
import 'package:dream_home/core/constant/app_sized.dart';
import 'package:dream_home/core/function/show_toast.dart';
import 'package:dream_home/core/widget/custom_app_button.dart';
import 'package:dream_home/di.dart';
import 'package:dream_home/feature/auth/data/model/Login/login_model/login_model.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_cubit.dart';
import 'package:dream_home/feature/customer_home/presentation/cubit/customer_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/cache/user_info_cache.dart';
import '../../../../core/utils/app_color.dart';
import '../../../customer_profile/presentation/widget/custom_add_profile_stack.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WorkerDetailsScreen extends StatefulWidget {
  final LoginModel user;
  const WorkerDetailsScreen({super.key, required this.user});

  @override
  State<WorkerDetailsScreen> createState() => _WorkerDetailsScreenState();
}

class _WorkerDetailsScreenState extends State<WorkerDetailsScreen> {
  LoginModel? _user;
  @override
  void initState() {
    load();
    super.initState();
  }

  Future<void> load() async {
    LoginModel? user = await getUserFromSharedPreferences();
    setState(() {
      _user = user;
    });
    log("$_user");
    log("${_user!.user?.firstName}");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerHomeCubit(getIt()),
      child: BlocConsumer<CustomerHomeCubit, CustomerHomeState>(
        listener: (context, state) {
          if (state is OrderCreatedSuccessfllyState) {
            showToast(
                message: "Order Created Successfully",
                backgroundColor: AppColor.beanut);
            context.pushReplacement(Routes.customernavbar);
          } else if (state is OrderCreatedFailureState) {
            showToast(message: state.message, backgroundColor: AppColor.redED);
          }
        },
        builder: (context, state) {
          final cubit = context.read<CustomerHomeCubit>();
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 40),
                    child: Column(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child:
                              Icon(Icons.arrow_back_ios, color: AppColor.beanut)
                                  .onTap(context.pop),
                        ),
                        height(16),
                        CustomAddProfileStack(
                          containerColor: AppColor.beanut,
                          borderColor: AppColor.greyD,
                          iconColor: AppColor.lightblack,
                          iconBorderColor: AppColor.transparent,
                        ),
                        height(16),
                        Text(
                          widget.user.user?.firstName ?? "",
                          style: AppTextStyle.style18.copyWith(
                            color: AppColor.lightblack,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        height(8),
                        Text(
                          widget.user.user?.contactNumber ?? "01000000000",
                          style: AppTextStyle.style18.copyWith(
                            color: AppColor.lightblack,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        height(8),
                        Text(
                          widget.user.user?.job ?? "",
                          style: AppTextStyle.style18.copyWith(
                            color: AppColor.lightblack,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        height(heightSize(context) * 0.1),
                        Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: CarouselSlider(
                              options: CarouselOptions(
                                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                                autoPlay: true,
                                aspectRatio: 1.0,
                                viewportFraction: 0.9,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: true,
                                enlargeFactor: 0.45,
                              ),
                              items: cubit.images
                                  .map((e) => Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Image.asset(e)))
                                  .toList()),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: AppColor.white,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                  child: CustomAppButton(
                    text: "Order Now",
                    containerColor: AppColor.beanut,
                    textColor: AppColor.white,
                    onPressed: () {
                      cubit.order(
                          userName: _user?.user?.firstName ?? "",
                          userphone: _user?.user?.contactNumber ?? "",
                          userLocation: "_user?.location ?? " "",
                          userId: _user?.user?.id ?? "",
                          isWorker: false,
                          job: widget.user.user?.job ?? "",
                          worderId: widget.user.user?.id ?? "",
                          workerName: widget.user.user?.firstName ?? "",
                          workerPhone: widget.user.user?.contactNumber ?? "",
                          workerLocation: "widget.user.location ?? " "");
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
