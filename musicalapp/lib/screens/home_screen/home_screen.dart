import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicalapp/constants/colors.dart';
import 'package:musicalapp/constants/text_style.dart';
import 'package:musicalapp/list/home_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [

            //genres
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Genres",
                style: ourStyle(size: 20,fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Classical",
                      style: ourStyle(),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "POP",
                      style: ourStyle(),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Nepali",
                      style: ourStyle(),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Zazz",
                      style: ourStyle(),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            //grid musics

            //use wrap instead of grid
            // child: GridView.builder(
            //   physics:const BouncingScrollPhysics(),
            //   itemCount: homePlayList.length,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 3,
            //         crossAxisSpacing: 12,
            //         mainAxisSpacing: 15,
            //
            //     ),
            //     itemBuilder: (context, index) {
            //       return Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Expanded(
            //             child: Container(
            //               // height:200,
            //               decoration:BoxDecoration(
            //                   color: primaryColor,
            //                   borderRadius: const BorderRadius.all(Radius.circular(12)),
            //                   image: DecorationImage(
            //                     image:AssetImage(homePlayList[index]),
            //                     fit: BoxFit.cover
            //                   )
            //               ),
            //             ),
            //           ),
            //           const SizedBox(height: 8,),
            //           Text(homePlayListTitle[index],style: ourStyle(),)
            //         ],
            //       );
            //     },
            // ),



            //genres songs
            SizedBox(
              width: Get.width,
              child: Wrap(
                // alignment: WrapAlignment.spaceBetween,
                spacing: 10,
                runSpacing: 10,
                children: [
                  //
                 ListView.builder(
                   itemCount: homePlayList.length,
                     itemBuilder: (context, index) {
                       return Container(
                             width:120,
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Container(
                                   height: 100,
                                   width: 120,
                                   decoration:  BoxDecoration(
                                       color: primaryColor,
                                       borderRadius:const BorderRadius.all(Radius.circular(12)),
                                       image: DecorationImage(
                                           image: AssetImage(homePlayList[index]), fit: BoxFit.cover)),
                                 ),
                                 const SizedBox(
                                   height: 10,
                                 ),
                                 Text(
                                   homePlayListTitle[index],
                                   style: ourStyle(),
                                 ),
                               ],
                             ),
                           );
                     },
                 )

                ],
              ),
            ),

             const SizedBox(height: 20,),

            //artists name
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Popular Artists",
                style: ourStyle(size: 20,fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Taylor Swift",
                      style: ourStyle(),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Justin Biber",
                      style: ourStyle(),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Nepathya",
                      style: ourStyle(),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Swoopana Suman",
                      style: ourStyle(),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );

  }
}
