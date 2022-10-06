import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'styleScheme.dart';
import 'ProductPage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( fontFamily: 'Avenir'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedCategory = 'all';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Container(
                margin: EdgeInsets.only(bottom: 5, right: 5),
                height: 50,
                width: 50,
                decoration: containerStyle('all'),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
              actions: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 5, right: 5),
                  height: 50,
                  width: 50,
                  decoration: containerStyle('all'),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  margin: EdgeInsets.only(bottom: 5, right: 5),
                  height: 50,
                  width: 50,
                  decoration: containerStyle('all'),
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 20,
                  ),
                ),

              ],
            ),
            //SearchBar
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              height: 60,
              decoration: containerStyle('right'),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search, size: 30),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        style: TextStyle(fontSize: 22),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(fontSize: 22, color: Colors.black)
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    categoryWidget('All'),
                    categoryWidget('Sofas'),
                    categoryWidget('Chairs'),
                    categoryWidget('Tables'),
                  ],
                ),
            ),
            //MainGridPanel
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*0.5-15,
                          child: Column(
                            children: <Widget>[
                              productWidget('right','singleSofa','NASHVILLE','\$349',2),
                              productWidget('left','lamp2','FLOOR LAMP','\$129',3),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5-15,
                          child: Column(
                            children: <Widget>[
                              productWidget('right','lamp1','TRIPOD LAMP','\$159',3),
                              productWidget('left','chair1','ACCENT CHAIR','\$34',2)
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width-30,
                          child: productWidget('left','sofa1','LOVESEAT SOFA','\$534',2)
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*0.5-15,
                          child: productWidget('left','chair2','RAYNER CHAIR','\$100',2) ,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5-15,
                          child: productWidget('right','marineStool','MARINE STOOL','\$250',2) ,
                        )
                      ],
                    )

                  ],
                )
              )
            ),
            Container(
              height: 60,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: containerStyle('left').copyWith(color: Colors.black),
              child: Center(
                child: Text('Show more', style: TextStyle(color: Colors.white, fontSize: 22)),
              ),
            )
            


          ],
        ),
      ),

    );
  }

  Container productWidget(String side, String img, String name, String price, double heightMultiplier) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
      height: 120*heightMultiplier,
      decoration: containerStyle(side),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage()));
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/images/$img.png')
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(name, style: TextStyle(color: Colors.grey, fontSize: 17)),
            SizedBox(height: 5),
            Text(price, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );

  }


  InkWell categoryWidget(String title) {
    return InkWell(
      onTap: () {
        funcselectCategory(title);
        },
      child: Container(
        margin: EdgeInsets.only(right: 5, bottom: 5),
        height: 40,
        width: 110,
        decoration: containerStyle('right').copyWith(border: (title == selectedCategory) ? Border.all(color: Color(0xff005dff), width: 2) : null),
        child: Center(
          child: Text(title, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600, fontFamily: 'Avenir')),
        ),
      ),
    );
  }

  void funcselectCategory(String title) {
    selectedCategory = title;
    setState(() {

    });
  }



}
