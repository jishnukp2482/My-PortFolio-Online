import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(30.w),
      child: Text(
        "message",
        style: GoogleFonts.inter(
          color: Colors.white.withOpacity(0.6),
          fontSize: 16.sp,
        ),
      ),
    );
  }
}



// Widget projectImagesWidget({
//   required List<ProjectImageItem> images,
//   required void Function(void Function()) setState,
//   required ProjectController projectController,

//   ProjectData? model,
//   required BuildContext context,
// }) {
//   return Container(
//     padding: EdgeInsets.all(15.w),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(15.w),
//       border: Border.all(color: Colors.white24),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Project Images",
//           style: GoogleFonts.inter(
//             color: AppColors.appBlue,
//             fontWeight: FontWeight.w700,
//             fontSize: 18.sp,
//           ),
//         ),

//         SizedBox(height: 15.h),

//         SizedBox(
//           height: 160.h,
//           child: ReorderableListView.builder(
//             scrollDirection: Axis.horizontal,
//             buildDefaultDragHandles: false,
//             itemCount: images.length + 1,

//             onReorder: (oldIndex, newIndex) {
//               if (oldIndex >= images.length || newIndex > images.length) {
//                 return;
//               }

//               setState(() {
//                 if (newIndex > oldIndex) {
//                   newIndex -= 1;
//                 }

//                 final item = images.removeAt(oldIndex);
//                 images.insert(newIndex, item);
//               });
//             },

//             itemBuilder: (context, index) {
//               /// ADD BUTTON
//               if (index == images.length) {
//                 return Container(
//                   key: const ValueKey("add_image"),
//                   width: 120.w,
//                   margin: EdgeInsets.only(right: 10.w),
//                   child: GestureDetector(
//                     onTap: () async {
//                       final result = await FilePicker.platform.pickFiles(
//                         allowMultiple: true,
//                         type: FileType.image,
//                         withData: true,
//                       );

//                       if (result != null) {
//                         setState(() {
//                           for (var file in result.files) {
//                             images.add(
//                               ProjectImageItem(
//                                 memoryImage: file.bytes!,
//                                 fileBytes: file.bytes!,

//                                 fileName: file.name,
//                               ),
//                             );
//                           }
//                         });
//                       }
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12.w),
//                         border: Border.all(color: Colors.white24),
//                       ),
//                       child: const Center(
//                         child: Icon(Icons.add, color: AppColors.appBlue),
//                       ),
//                     ),
//                   ),
//                 );
//               }

//               final item = images[index];

//               return Container(
//                 key: ValueKey(item.networkImage ?? item.memoryImage.hashCode),
//                 width: 120.w,
//                 margin: EdgeInsets.only(right: 10.w),
//                 child: Stack(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(12.w),
//                       child: item.networkImage != null
//                           ? CachedNetworkImage(
//                               imageUrl: item.networkImage!,
//                               width: 120.w,
//                               height: 160.h,
//                               fit: BoxFit.cover,
//                             )
//                           : Image.memory(
//                               item.memoryImage!,
//                               width: 120.w,
//                               height: 160.h,
//                               fit: BoxFit.cover,
//                             ),
//                     ),

//                     /// DRAG HANDLE
//                     Positioned(
//                       top: 5,
//                       left: 5,
//                       child: ReorderableDragStartListener(
//                         index: index,
//                         child: Container(
//                           padding: EdgeInsets.all(5.w),
//                           decoration: BoxDecoration(
//                             color: Colors.black54,
//                             borderRadius: BorderRadius.circular(8.w),
//                           ),
//                           child: const Icon(
//                             Icons.drag_handle,
//                             color: Colors.white,
//                             size: 18,
//                           ),
//                         ),
//                       ),
//                     ),

//                     /// DELETE
//                     Positioned(
//                       bottom: 5,
//                       right: 5,
//                       child: GestureDetector(
//                         onTap: () async {
//                           try {
//                             if (item.publicId != null && model?.id != null) {
//                               await projectController.deleteProjectImg(
//                                 model!.id,
//                                 item.publicId!,
//                               );
//                               setState(() {
//                                 images.removeWhere(
//                                   (e) => e.publicId == item.publicId,
//                                 );
//                               });
//                             } else {
//                               setState(() {
//                                 images.removeAt(index);
//                               });
//                             }
//                           } catch (e) {
//                             bottomMsg(context, "Failed to Delete Image");
//                           }
//                         },
//                         child: Container(
//                           padding: EdgeInsets.all(5.w),
//                           decoration: BoxDecoration(
//                             color: Colors.black54,
//                             borderRadius: BorderRadius.circular(8.w),
//                           ),
//                           child: const Icon(
//                             Icons.delete,
//                             color: Colors.red,
//                             size: 18,
//                           ),
//                         ),
//                       ),
//                     ),

//                     /// THUMBNAIL
//                     if (index == 0)
//                       Positioned(
//                         bottom: 5,
//                         left: 5,
//                         child: Container(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 8.w,
//                             vertical: 4.h,
//                           ),
//                           decoration: BoxDecoration(
//                             color: AppColors.appBlue,
//                             borderRadius: BorderRadius.circular(8.w),
//                           ),
//                           child: Text(
//                             "Thumbnail",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 10.sp,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }
