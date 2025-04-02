import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/address_model.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(const AddressInitial());

  Future<void> updateAddress(Address newAddress) async {
    try {
      emit(const AddressLoading());
      // يمكن إضافة تأخير محاكاة إذا لزم الأمر
      await Future.delayed(const Duration(milliseconds: 500));
      emit(AddressLoaded(address: newAddress));
    } catch (e) {
      emit(AddressError(message: e.toString()));
    }
  }
}
