import 'package:deepar_flutter/deepar_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unveils/business_logic/global_cubit/global_cubit.dart';
import 'package:unveils/business_logic/global_cubit/global_state.dart';

import '../../view/bottom_media_options.dart';
import '../../view/top_media_options.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    var cubit = GlobalCubit.get(context);

    return BlocConsumer<GlobalCubit,GlobalState>(

      listener: ( context, state) {  },
      builder:(context, state)=> Scaffold(
        appBar: AppBar(
          title: const Text('DeepAR Flutter Plugin'),
        ),
        body: Stack(
          children: [
            cubit.dARController.isInitialized
                ? DeepArPreview(cubit.dARController)
                : const Center(
              child: CircularProgressIndicator(),
            ),
            const TopMediaOptions(),
            const BottomMediaOptions(),
          ],
        ),
      ),
    );
  }
}
