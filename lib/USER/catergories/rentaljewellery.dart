import 'package:flutter/material.dart';
import 'package:main_project/USER/Drawer/shotlist.dart';
import 'package:main_project/USER/catogories2/rentaljewellery/RentalJewellery.dart';
import 'package:main_project/USER/chat.dart';
import 'package:main_project/USER/homepage/bottomnav.dart';

class Rentaljewellery extends StatefulWidget {
  const Rentaljewellery({super.key});

  @override
  State<Rentaljewellery> createState() => _RentaljewelleryState();
}

class _RentaljewelleryState extends State<Rentaljewellery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myNav(
        index: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => bottomnavipage(
                      indexnum: 0,
                    )));
          } else if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => bottomnavipage(
                      indexnum: 1,
                    )));
          } else if (index == 2) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => bottomnavipage(
                      indexnum: 2,
                    )));
          } else if (index == 3) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => bottomnavipage(
                      indexnum: 3,
                    )));
          } else if (index == 4) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => bottomnavipage(
                      indexnum: 4,
                    )));
          }
        },
      ),
      appBar: AppBar(
          title: const Text(
            'Rentals Jewellery',
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
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Shortlist()));
                },
                icon: const Icon(Icons.favorite)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Chatpage(
                      name: 'Rentals Jewellery',
                    ),
                  ));
                },
                icon: const Icon(Icons.chat_outlined))
          ]),
      backgroundColor: Color(0xccFF004D),
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Card(
                  color: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: ListTile(
                          title: Text(
                            "Rental Jewellery",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          textColor: Color.fromARGB(255, 0, 0, 0),
                          leading: Icon(Icons.library_books_outlined),
                          iconColor: Color.fromRGBO(0, 0, 0, 1),
                          trailing: Icon(Icons.navigate_next),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RentalJewellery()));
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}