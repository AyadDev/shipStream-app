part of 'address_cubit.dart';

//  الحالة الأساسية للعنوان
abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object?> get props => [];
}

/// الحالة الأولية عند عدم وجود بيانات
class AddressInitial extends AddressState {
  const AddressInitial();
}

/// حالة التحميل أثناء جلب البيانات
class AddressLoading extends AddressState {
  const AddressLoading();
}

/// حالة النجاح بعد جلب البيانات
class AddressLoaded extends AddressState {
  final Address address;

  const AddressLoaded({required this.address});

  @override
  List<Object?> get props => [address];
}

/// حالة الخطأ في حال حدوث مشكلة
class AddressError extends AddressState {
  final String message;

  const AddressError({required this.message});

  @override
  List<Object?> get props => [message];
}
