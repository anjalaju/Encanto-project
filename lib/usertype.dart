import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:main_project/ENTREPRENEUR/formscreen/welcome.dart';
import 'package:main_project/Intropage.dart/Swipe.dart';
import 'package:main_project/utils/String.dart';

class UserType extends StatelessWidget {
  const UserType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SplashUserFirst(),
                        ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Helper.W(context) * .250,
                    height: Helper.h(context) * .050,
                    color: Colors.red,
                    child: Text('User'),
                  ),
                ),
                SizedBox(
                  height: Helper.h(context) * .020,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EntrewelcomeEnterpRenur(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Helper.W(context) * .250,
                    height: Helper.h(context) * .050,
                    color: Colors.red,
                    child: Text('Enterprenur'),
                  ),
                ),
                SizedBox(
                  height: Helper.h(context) * .020,
                ),
                Container(
                  alignment: Alignment.center,
                  width: Helper.W(context) * .250,
                  height: Helper.h(context) * .050,
                  color: Colors.red,
                  child: Text('admin'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
