import 'package:checkoutapp/pages/productderail.dart';
import 'package:checkoutapp/pages/signin.dart';
import 'package:checkoutapp/services/Database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  TextEditingController searchgroceryEditingController =
      TextEditingController();

  Stream? orderStream;

  // Widget Search() {
  //   return Material(
  //     borderRadius: BorderRadius.all(Radius.circular(30.0)),
  //     child: Container(
  //       height: 50,
  //       width: 180,
  //       child: TextField(
  //           style: TextStyle(color: Colors.black, fontSize: 16.0),
  //           cursorColor: Theme.of(context).primaryColor,
  //           controller: searchgroceryEditingController,
  //           decoration: InputDecoration(
  //             hintStyle: TextStyle(color: Colors.black),
  //             contentPadding:
  //                 EdgeInsets.symmetric(horizontal: 34.0, vertical: 14.0),
  //             suffixIcon: Material(
  //                 borderRadius: BorderRadius.all(Radius.circular(30.0)),
  //                 child: GestureDetector(
  //                     onTap: () {
  //                       if (searchgroceryEditingController.text != "") {
  //                         // onSearchBtnClick();
  //                       }
  //                     },
  //                     child: null)),
  //             border: InputBorder.none,
  //             hintText: "Search",
  //           )),
  //     ),
  //   );
  // }

  doThisOnLaunch() async {
    orderStream = await DatabaseMethods().getCategories();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    doThisOnLaunch();
  }

  Widget orderSoon() {
    return StreamBuilder(
      stream: orderStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? GridView.builder(
                itemCount: snapshot.data.docs.length,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetail()));
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        child: Container(
                          height: 20,
                          width: 20,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                            child: Text(
                              ds["Name"],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ));
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.green),
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              Center(
                child: Text(
                  "Shoprite Victoria Mall",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 500,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(34),
                        topRight: Radius.circular(34))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 250,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Search",
                            style: TextStyle(
                                color: Colors.black54, fontSize: 15.0),
                          ),
                        ),
                        Icon(
                          Icons.qr_code_scanner_rounded,
                          color: Colors.black,
                          size: 26,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 388,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(34),
                              topRight: Radius.circular(34))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Supposed to contain",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "shop adverts e.g x-mas specials",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                right: 30.0, left: 30.0, bottom: 10.0),
                            height: 280,
                            decoration: BoxDecoration(color: Colors.grey[300]),
                            child: orderSoon(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
