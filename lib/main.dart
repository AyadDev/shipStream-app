import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipstreem_app/Features/Authentication/presentation/view_models/auth_repository.dart';
import 'package:shipstreem_app/Features/Authentication/presentation/views/login_view.dart';
import 'Core/widgets/custom_navigation_service.dart';
import 'Features/Authentication/presentation/view_models/login cubit/login_cubit.dart';

void main() {
  runApp(const ShipStream());
}

class ShipStream extends StatelessWidget {
  const ShipStream({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Nav.key,
      home: BlocProvider(
        create: (context) => LoginCubit(authRepository: AuthRepository()),
        child: LoginView(),
      ),
    );
  }
}
