import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_home_state.dart';

class CustomerHomeCubit extends Cubit<CustomerHomeState> {
  CustomerHomeCubit() : super(CustomerHomeInitialState());

  static CustomerHomeCubit get(context) =>
      BlocProvider.of<CustomerHomeCubit>(context);
}
