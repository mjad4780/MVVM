import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled/future/user_future/presentation/cubit/user_cubit.dart';
import 'package:untitled/future/user_future/presentation/cubit/user_state.dart';
import 'package:untitled/future/user_future/presentation/widgets/custom_search_bar.dart';
import 'package:untitled/future/user_future/presentation/widgets/landing_widget.dart';
import 'package:untitled/future/user_future/presentation/widgets/user_data_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: state is GetUserSuccessfully
              ? ListView(
                  children: [
                    const LandingWidget(),
                    UserData(user: state.user),
                    const CustomSearchBar(),
                  ],
                )
              : state is GetUserFailure
                  ? Text(state.errMessage)
                  : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
