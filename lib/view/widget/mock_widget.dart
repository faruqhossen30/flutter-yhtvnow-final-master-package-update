import 'package:flutter/material.dart';
class MockWidget extends StatelessWidget {
  const MockWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('some');
    // return FutureBuilder(
    //   future: PostService.categoryWisePosts(_post.categoryId ?? 0),
    //   builder: (context, AsyncSnapshot snapshot) {
    //     if (snapshot.hasError) {
    //       return Text('Error: ${snapshot.error}');
    //     } else if (!snapshot.hasData) {
    //       return Column(
    //         children: [
    //           ListView.builder(
    //             shrinkWrap: true,
    //             physics: NeverScrollableScrollPhysics(),
    //             itemCount: 8,
    //             itemBuilder: (context, index) {
    //               return Container(
    //                 margin: EdgeInsets.symmetric(vertical: 5),
    //                 child: Shimmer.fromColors(
    //                   baseColor: Colors.grey[500]!,
    //                   highlightColor: Colors.grey[100]!,
    //                   child: Wrap(
    //                     crossAxisAlignment: WrapCrossAlignment.center,
    //                     spacing: 5,
    //                     children: [
    //                       Container(
    //                         decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
    //                         width: 100.w,
    //                         height: 80.h,
    //                       ),
    //                       Wrap(
    //                         direction: Axis.vertical,
    //                         spacing: 10,
    //                         children: [
    //                           Container(
    //                             decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
    //                             width: 230.w,
    //                             height: 20.h,
    //                           ),
    //                           Container(
    //                             decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
    //                             width: 230.w,
    //                             height: 20.h,
    //                           ),
    //                           Container(
    //                             decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
    //                             width: 230.w,
    //                             height: 20.h,
    //                           ),
    //                         ],
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               );
    //             },
    //           ),
    //         ],
    //       );
    //     } else {
    //       return Container(
    //         constraints: BoxConstraints(maxHeight: 420.h),
    //         padding: EdgeInsets.symmetric(horizontal: 10),
    //         height: 410.h,
    //         child: GridView.builder(
    //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: 2,
    //               crossAxisSpacing: 10,
    //               mainAxisSpacing: 10,
    //               childAspectRatio: 1.2
    //           ),
    //           shrinkWrap: true,
    //           itemCount: snapshot.data.length,
    //           itemBuilder: (context, index) {
    //             PostModel catpost = PostModel.fromJson(snapshot.data[index]);
    //             return InkWell(
    //               onTap: () {
    //                 // Get.off(SinglePostPage(postId: catpost.id ?? 0));
    //                 Navigator.pushReplacement(
    //                     context, MaterialPageRoute(builder: (context) => SinglePostPage(postId: catpost.id ?? 0)));
    //               },
    //               child: Center(
    //                 child: Container(
    //                   child: Wrap(
    //                     children: [
    //                       Container(
    //                         child: CachedNetworkImage(
    //                           // color: Colors.amberAccent,
    //                           height: 100.h,
    //                           width: double.infinity,
    //                           fit: BoxFit.cover,
    //                           key: UniqueKey(),
    //                           maxHeightDiskCache: 200,
    //                           imageUrl: siteURL + "/uploads/post/${catpost.thumbnail}",
    //                           // imageUrl: "https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?s=612x612",
    //                           placeholder: (context, url) => Container(
    //                             width: 200.0,
    //                             height: 100.0,
    //                             child: Center(
    //                               child: Shimmer.fromColors(
    //                                 baseColor: Colors.red,
    //                                 highlightColor: Colors.yellow,
    //                                 child: Text(
    //                                   'YHTV NOW',
    //                                   textAlign: TextAlign.center,
    //                                   style: TextStyle(
    //                                     fontSize: 40.0,
    //                                     fontWeight: FontWeight.bold,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                           errorWidget: (context, url, error) => Icon(Icons.error),
    //                         ),
    //                       ),
    //                       Container(
    //                           width: 230,
    //                           child: Wrap(
    //                             children: [
    //                               Text(catpost.title.toString(),
    //                                   maxLines: 1,
    //                                   style: TextStyle(
    //                                     color: Colors.white70,
    //                                     fontWeight: FontWeight.normal,
    //                                     fontSize: 16,
    //                                   ))
    //                             ],
    //                           )),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             );
    //           },
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}
