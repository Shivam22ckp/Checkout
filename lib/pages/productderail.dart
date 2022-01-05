import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key? key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool cart = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            cart
                ? Container(
                    height: 300,
                    width: 300,
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/checkoutapp-7472c.appspot.com/o/chair1.jpg?alt=media&token=e7a66606-43d3-4e6e-a963-52fcadb5d361",
                      fit: BoxFit.cover,
                    ),
                  )
                : Stack(
                    children: [
                      Container(
                        height: 300,
                        width: 300,
                        child: Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/checkoutapp-7472c.appspot.com/o/chair1.jpg?alt=media&token=e7a66606-43d3-4e6e-a963-52fcadb5d361",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 300,
                        width: 300,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.grey[100]),
                            height: 90,
                            width: 90,
                            child: Text("Added to cart"),
                          ),
                        ),
                      )
                    ],
                  ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Chair",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  "Ugx 65,000",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Text("Farn House Organic",
                style: TextStyle(fontSize: 20.0, fontFamily: 'Poppins')),
            Text("Rose Wine 2018",
                style: TextStyle(fontSize: 20.0, fontFamily: 'Poppins')),
            Text("75ml",
                style: TextStyle(fontSize: 20.0, fontFamily: 'Poppins')),
            SizedBox(
              height: 30.0,
            ),
            cart
                ? GestureDetector(
                    onTap: () {
                      cart = false;
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(7)),
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      cart = false;
                      setState(() {});
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.lightGreen),
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          "Go to Cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              height: 20.0,
            ),
            cart
                ? Container()
                : Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.lightGreen),
                    padding: EdgeInsets.all(16),
                    child: Text("Continue Shopping"),
                  )
          ],
        ),
      ),
    );
  }
}
