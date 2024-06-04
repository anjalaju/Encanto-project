import 'package:flutter/material.dart';
import 'package:main_project/ENTREPRENEUR/Entrechat.dart';
import 'package:main_project/provider/FunctionProvider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Entrepsmallvenues extends StatefulWidget {
  const Entrepsmallvenues({super.key});

  @override
  State<Entrepsmallvenues> createState() => _EntrepsmallvenuesState();
}

class _EntrepsmallvenuesState extends State<Entrepsmallvenues> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Small Function / Party Halls',
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
        ),
        body: Consumer<FunctionProvider>(
          builder: (context, instance, child) {
            return StreamBuilder(
              stream: instance
                  .getEventproject('Small Function/ Part halls', 'Venues')
                  .asStream(),
              builder: (context, snapshot) {
                final listproject = instance.listevent;
                return listproject.isEmpty?Center(child: Text('No Small function find'),):  SingleChildScrollView(
                    child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        fillColor: const Color(0xffD9D9D9),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: ("  Search Venues..."),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                    ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listproject.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Container(
                                height: 231,
                                width: 350,
                                child: listproject[index].Image.isEmpty
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Image(
                                        image: NetworkImage(
                                          listproject[index].Image,
                                        ),
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Icon(Icons.error);
                                        },
                                      ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(listproject[index].eventName),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(listproject[index].eventPlace),
                                      ],
                                    ),
                                    Text(listproject[index].discription),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.currency_rupee,
                                          size: 20,
                                        ),
                                        Text(
                                          listproject[index].startingPriceFrom,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    // Text("500-700 max")
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OutlinedButton(
                                        style: ButtonStyle(
                                            foregroundColor: MaterialStateProperty.all(
                                                const Color(0xffFF004D)),
                                            textStyle: MaterialStateProperty.all(
                                                const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14)),
                                            minimumSize: MaterialStateProperty.all(
                                                const Size(250, 50)),
                                            side: MaterialStateProperty.all(
                                                const BorderSide(
                                                    color: Color(0xffFF004D))),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15)))),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => EntreChatpage(
                                              name: 'Banquet Halls',
                                            ),
                                          ));
                                        },
                                        child: const Row(
                                          children: [
                                            Icon(Icons.message),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text("Message"),
                                          ],
                                        )),
                                    OutlinedButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                const Color(0xff63C336)),
                                        textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                        minimumSize: MaterialStateProperty.all(
                                            const Size(30, 50)),
                                        shape: MaterialStateProperty.all(
                                          const CircleBorder(),
                                        ),
                                        side: MaterialStateProperty.all(
                                          const BorderSide(
                                              color: Color(0xff63C336)),
                                        ),
                                      ),
                                      onPressed: () {
                                        _makePhoneCall(
                                            listproject[index].phonenumber);
                                      },
                                      child: const Row(
                                        children: [
                                          Icon(Icons.call),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 40,
                        );
                      },
                    ),
                  ],
                ));
              },
            );
          },
        ));
  }

  void _makePhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
