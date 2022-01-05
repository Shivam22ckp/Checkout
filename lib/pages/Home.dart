import 'package:checkoutapp/pages/categories.dart';
import 'package:checkoutapp/pages/signin.dart';
import 'package:checkoutapp/services/Database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchgroceryEditingController =
      TextEditingController();

  Stream? orderStream, productStream;
  doThisOnLaunch() async {
    orderStream = await DatabaseMethods().getCategories();
    productStream = await DatabaseMethods().getProducts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    doThisOnLaunch();
  }

  Widget Search() {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      child: Container(
        height: 50,
        width: 280,
        child: TextField(
            style: TextStyle(color: Colors.black, fontSize: 16.0),
            cursorColor: Theme.of(context).primaryColor,
            controller: searchgroceryEditingController,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 34.0, vertical: 14.0),
                suffixIcon: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: GestureDetector(
                        onTap: () {
                          if (searchgroceryEditingController.text != "") {
                            // onSearchBtnClick();
                          }
                        },
                        child: null)),
                border: InputBorder.none,
                hintText: "Search")),
      ),
    );
  }

  Widget orderSoon() {
    return StreamBuilder(
      stream: orderStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Container(
                        height: 60,
                        width: 100,
                        margin: EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            ds["Name"],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                      ));
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget Products() {
    return StreamBuilder(
      stream: productStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Container(
                      height: 60,
                      width: 90,
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            child: Image.network(
                              ds["Image"],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            ds["Product"],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                    ),
                  );
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 600,
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
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                          child: Text(
                        "Shop adverts e.g x-mas specials",
                        style: TextStyle(color: Colors.grey, fontSize: 18.0),
                      )),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Categories()));
                          },
                          child: Text(
                            "see all",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(height: 50, child: orderSoon()),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Furniture",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Snacksdetail(
                            //               id: "RLfywu6O43hrCYQB6wzx",
                            //               name: "Snacks",
                            //             )));
                          },
                          child: Text(
                            "see all",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(height: 130, child: Products()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
