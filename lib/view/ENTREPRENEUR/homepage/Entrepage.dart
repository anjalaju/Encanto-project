import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Entreentreprenuer extends StatefulWidget {
  const Entreentreprenuer({super.key});

  @override
  State<Entreentreprenuer> createState() => _EntreentreprenuerState();
}

class _EntreentreprenuerState extends State<Entreentreprenuer> {
   final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) { print(_auth.currentUser!.uid);
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/entrepropic.jpg"), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      border: Border.all(
                        width: 2,
                      )),
                  child: Stack(
                    children: [
                      const Center(
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Positioned(
                          top: 50,
                          left: 60,
                          right: 40,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                            iconSize: 20,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          )),
                    ],
                  ),
                ),
              ),
              const Center(child: const Text("Add profile Picture")),
                const Text("EnterprenurName"),
              const SizedBox(height: 7),
              Card(
                color: Colors.white,
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListTile(
                        title: Text(
                          "Abdulla cvp",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        textColor: Color.fromARGB(255, 0, 0, 0),
                        leading: Icon(Icons.person),
                        iconColor: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    )
                  ],
                ),
              ),
            
         
              const SizedBox(height: 10),
              const Text("Mobile Number"),
              const SizedBox(height: 7),
              Card(
                color: Colors.white,
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child:  Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListTile(
                        title: StreamBuilder(
                    stream: _firestore
                        .collection("enterprenur")
                        .where("Id", isEqualTo: _auth.currentUser!.uid)
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        final List<DocumentSnapshot> documents =
                            snapshot.data!.docs;
                        if (documents.isNotEmpty) {
                         
                          final mobile = documents[0].get("EnterprenurNumber");
                          return Text(mobile ?? "");
                        }
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                        textColor: Color.fromARGB(255, 0, 0, 0),
                        leading: Icon(Icons.call),
                        iconColor: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text("Email"),
              const SizedBox(height: 7),
              Card(
                color: Colors.white,
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListTile(
                        title: Text(
                          "anjalkoranath@gmail.com",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        textColor: Color.fromARGB(255, 0, 0, 0),
                        leading: Icon(Icons.email),
                        iconColor: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
               const SizedBox(height: 10),
              const Text("Business name"),
              const SizedBox(height: 7),
              Card(
                color: Colors.white,
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListTile(
                        title: Text(
                          "Event Crafters",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        textColor: Color.fromARGB(255, 0, 0, 0),
                        leading: Icon(Icons.apartment),
                        iconColor: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    )
                  ],
                ),
              ),     const SizedBox(height: 10),
              const Text("Location"),
              const SizedBox(height: 7),
              Card(
                color: Colors.white,
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListTile(
                        title: Text(
                          "Perinthalmanna",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        textColor: Color.fromARGB(255, 0, 0, 0),
                        leading: Icon(Icons.location_on_sharp),
                        iconColor: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
