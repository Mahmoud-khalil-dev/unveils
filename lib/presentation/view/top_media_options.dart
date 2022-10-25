// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:unveils/business_logic/global_cubit/global_cubit.dart';
// import 'package:unveils/business_logic/global_cubit/global_state.dart';
//
// class TopMediaOptions extends StatelessWidget {
//   const TopMediaOptions({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var cubit = GlobalCubit.get(context);
//
//     return BlocConsumer<GlobalCubit,GlobalState>(
//       listener: (context,state){},
//       builder:(context,state)=> Positioned(
//         top: 10,
//         left: 0,
//         right: 0,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             IconButton(
//               onPressed: () async {
//                cubit.flashButtonPressed();
//               },
//               color: Colors.white70,
//               iconSize: 40,
//               icon:
//               Icon(cubit.dARController.flashState ? Icons.flash_on : Icons.flash_off),
//             ),
//             IconButton(
//               onPressed: () async {
//                 cubit.faceMaskButtonPressed();
//               },
//               color: Colors.white70,
//               iconSize: 40,
//               icon: Icon(
//                 cubit.isFaceMask
//                     ? Icons.face_retouching_natural_rounded
//                     : Icons.face_retouching_off,
//               ),
//             ),
//             IconButton(
//               onPressed: () async {
//              cubit.filterButtonPressed();
//               },
//               color: Colors.white70,
//               iconSize: 40,
//               icon: Icon(
//                 cubit.isFilter ? Icons.filter_hdr : Icons.filter_hdr_outlined,
//               ),
//             ),
//             IconButton(
//                 onPressed: () {
//                   cubit.cameraSwitchButtonPressed();
//                 },
//                 iconSize: 50,
//                 color: Colors.white70,
//                 icon: const Icon(Icons.cameraswitch))
//           ],
//         ),
//       ),
//     );
//   }
// }
//
