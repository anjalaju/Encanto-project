import 'package:flutter/material.dart';
import 'package:main_project/view/ENTREPRENEUR/catergories/bridalwearaccess.dart';
import 'package:main_project/view/ENTREPRENEUR/catergories/cakes.dart';
import 'package:main_project/view/ENTREPRENEUR/catergories/cardmakers.dart';
import 'package:main_project/view/ENTREPRENEUR/catergories/catering.dart';
import 'package:main_project/view/ENTREPRENEUR/catergories/gifts.dart';
import 'package:main_project/view/ENTREPRENEUR/catergories/groomwearaccess.dart';
import 'package:main_project/view/ENTREPRENEUR/catergories/jewelleryandaccess.dart.dart';
import 'package:main_project/view/ENTREPRENEUR/catergories/makeupartist.dart';
import 'package:main_project/view/ENTREPRENEUR/catergories/mehndiartist.dart';
import 'package:main_project/view/ENTREPRENEUR/catergories/musicanddancr.dart';
import 'package:main_project/view/ENTREPRENEUR/catergories/photographers.dart';
import 'package:main_project/view/ENTREPRENEUR/catergories/planninganddecor.dart';
import 'package:main_project/view/ENTREPRENEUR/catergories/preweddingshot.dart';
import 'package:main_project/view/ENTREPRENEUR/catergories/rentals.dart';
import 'package:main_project/view/ENTREPRENEUR/catergories/transportations.dart';
import 'package:main_project/view/ENTREPRENEUR/catergories/venues.dart';
import 'package:main_project/view/ENTREPRENEUR/events/mehndinight.dart';
import 'package:main_project/view/ENTREPRENEUR/events/weddinglist.dart';
import 'package:main_project/view/ENTREPRENEUR/homepage/bottomnav.dart';



class Entrewedding extends StatefulWidget {
  const Entrewedding({super.key});

  @override
  State<Entrewedding> createState() => _EntreweddingState();
}

class _EntreweddingState extends State<Entrewedding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
    bottomNavigationBar: EntremyNav(
        index: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Entrebottomnav(
                      indexnum: 0,
                    )));
          } else if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Entrebottomnav(
                      indexnum: 1,
                    )));
          }
        },
      ),
      appBar: AppBar(
        title: const Text(
          'Wedding',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
        backgroundColor: Colors.transparent,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            thickness: 2,
            color: Colors.black,
            height: 1,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          color: Colors.black,
        ),
        //  actions: [
        //   IconButton(onPressed: () {
        //        Navigator.of(context).push(MaterialPageRoute(
        //             builder: (context) => EntreChatpage(),
        //           ));
        //   }, icon: const Icon(Icons.chat_outlined))
        // ]
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
      
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: entreweddinglist.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 5,
                );
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Entravenuespage()));
                        break;
                      case 1:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Entrephotogrpage()));
                        break;
                      case 2:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Entrecateringpage()));
                        break;
                      case 3:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Entreplanningpage()));
                        break;
                      case 4:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Entrejewellpage()));
                        break;
                      case 5:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Entremkaeupspage()));
                        break;
                      case 6:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Entrebridwearpage()));
                        break;
                      case 7:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Entregroompage()));
                        break;
                      case 8:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Entrerentalpage()));
                        break;
                      case 9:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Entremehndipage()));
                        break;
                      case 10:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Entretranspage()));
                        break;
                      case 11:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Entregiftspage()));
                        break;
                      case 12:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Entrecakespage()));
                        break;
                      case 13:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Entremusicpage()));
                        break;
                      case 14:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Entrecardpage()));
                        break;
                      case 15:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Entrepreweddpage()));
                        break;
                      // Add more cases if needed for different index values
                    }
                  },
                  child: Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    color: entreweddinglist[index]["Color"],
                    // color: const Color.fromARGB(255, 248, 194, 168),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 50,
                          ),

                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${entreweddinglist[index]["Title"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              )
                              ,entreweddinglist[index]["subtitle"]==null?Text(""):
                                Text(
                                "${entreweddinglist[index]["subtitle"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                            ],
                          ),
                          // child: Text(
                          //   "Wedding",
                          //   style: TextStyle(
                          //       fontSize: 24, fontWeight: FontWeight.w600),
                          // ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(60),
                              bottomLeft: Radius.circular(60)),
                          child: Image.asset(
                            "${entreweddinglist[index]["Image"]}",
                            fit: BoxFit.fill,
                            height: 130,
                            width: 160,

                            // Container(
                            //   // height: 200,
                            //   width: 200,
                            //   decoration: BoxDecoration(
                            //       image: DecorationImage(
                            //           image:
                            //               AssetImage("${Events[index]["Image"]}"),
                            //           fit: BoxFit.fill),
                            //       color: Colors.white,
                            //       borderRadius: const BorderRadius.only(
                            //           topLeft: Radius.circular(80),
                            //           bottomLeft: Radius.circular(80))),
                            // child: const Image(
                            //   image: AssetImage("images/wedding.jpg"),
                            //   fit: BoxFit.cover,

                            // ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),

    );
  }
}
