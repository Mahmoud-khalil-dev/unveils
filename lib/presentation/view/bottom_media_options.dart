import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unveils/business_logic/global_cubit/global_cubit.dart';
import 'package:unveils/business_logic/global_cubit/global_state.dart';

class BottomMediaOptions extends StatelessWidget {
  const BottomMediaOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = GlobalCubit.get(context);

    return BlocConsumer<GlobalCubit,GlobalState>(
      listener: (context,state){},
      builder:(context,state)=> Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  iconSize: 60,
                  onPressed: () {
                    cubit.backButtonPressed();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white70,
                  )),
              IconButton(
                  onPressed: () async {
                    cubit.recordButtonPressed();
                  },
                  iconSize: 50,
                  color: Colors.white70,
                  icon: Icon(cubit.dARController.isRecording
                      ? Icons.videocam_sharp
                      : Icons.videocam_outlined)),
              const SizedBox(width: 20),
              IconButton(
                  onPressed: () {
                    cubit.cameraButtonPressed();
                  },
                  color: Colors.white70,
                  iconSize: 40,
                  icon: const Icon(Icons.photo_camera)),
              IconButton(
                  iconSize: 60,
                  onPressed: () {
                   cubit.forwardButtonPressed();
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white70,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

