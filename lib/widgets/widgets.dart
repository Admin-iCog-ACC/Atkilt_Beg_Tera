// import 'package:flutter/material.dart';
// import 'package:food_and_health_app/configs/themes/default/theme.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// class ArticleBanner extends StatefulWidget {
//   final String title;
//   final String imageUrl;

//   final double size;
//   final double fontSize;
//   final Function? onTap;
//   const ArticleBanner(
//       {Key? key,
//       required this.title,
//       required this.imageUrl,
//       this.size = 250,
//       this.fontSize = 20,
//       this.onTap})
//       : super(key: key);

//   @override
//   State<ArticleBanner> createState() => _ArticleBannerState();
// }

// class _ArticleBannerState extends State<ArticleBanner> {
//   var _image;
//   var loadingSpinner;
//   var _imageLoaded = false;

//   @override
//   void initState() {
//     _image = NetworkImage(widget.imageUrl);

//     _image
//         .resolve(ImageConfiguration())
//         ?.addListener(ImageStreamListener((_, __) {
//       if (mounted) {
//         setState(() {
//           _imageLoaded = true;
//         });
//       }
//     }));
//   }

//   @override
//   Widget build(BuildContext context) {
//     loadingSpinner = SpinKitFadingCircle(color: Theme.of(context).primaryColor);
//     return GestureDetector(
//       onTap: () {
//         if (widget.onTap != null) {
//           widget.onTap!();
//         }
//       },
//       child: Container(
//         clipBehavior: Clip.hardEdge,
//         constraints: BoxConstraints(minHeight: 150, maxHeight: widget.size),
//         child: Row(children: [
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(top: 15),
//                     child: Text("Article".toUpperCase(),
//                         style: TextStyle(
//                             letterSpacing: 2,
//                             fontSize: 16,
//                             color: Theme.of(context).primaryColor)),
//                   ),
//                   // SizedBox(
//                   //   height: 5,
//                   // ),
//                   Text(widget.title,
//                       style:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(bottom: 15),
//                     child: ElevatedButton.icon(
//                         label: Padding(
//                           padding: const EdgeInsets.only(
//                               top: 15.0, right: 10.0, bottom: 15.0),
//                           child: Icon(
//                             Icons.chevron_right,
//                             size: 18,
//                           ),
//                         ),
//                         icon: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 8.0),
//                             child: Text(
//                               "Read Now",
//                               style: TextStyle(fontSize: 18),
//                             ),
//                           ),
//                         ),
//                         onPressed: () {},
//                         style: ButtonStyle(
//                             shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10))))),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Flexible(
//             child: Center(
//                 child: _imageLoaded
//                     ? Container(
//                         decoration: BoxDecoration(
//                             image: _imageLoaded
//                                 ? DecorationImage(
//                                     image: _image, fit: BoxFit.cover)
//                                 : null),
//                       )
//                     : loadingSpinner),
//           )
//         ]),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: AppTheme.bannerBackgroundColor),
//         // height: 200,
//       ),
//     );
//   }
// }
