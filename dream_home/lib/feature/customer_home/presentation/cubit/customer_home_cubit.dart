import 'package:dream_home/core/utils/app_images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'customer_home_state.dart';

class CustomerHomeCubit extends Cubit<CustomerHomeState> {
  CustomerHomeCubit() : super(CustomerHomeInitialState());

  static CustomerHomeCubit get(context) =>
      BlocProvider.of<CustomerHomeCubit>(context);

  List<String> vectors = [
    AppImages.vec1,
    AppImages.vec2,
    AppImages.vec3,
    AppImages.vec4,
  ];
}
