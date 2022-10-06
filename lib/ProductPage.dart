import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnitureshop_app/main.dart';
import 'package:furnitureshop_app/styleScheme.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Avenir'),
      home: productPage(),
    );
  }
}

class productPage extends StatefulWidget {
  @override
  _productPageState createState() => _productPageState();
}

class _productPageState extends State<productPage> {
  Color currentColor = Color(0xff2f4b81);
  String currentChair = '1';
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
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
                  )

                ),
              ),
              actions: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 5, right: 5),
                  height: 50,
                  width: 50,
                  decoration: containerStyle('all'),
                  child: Center(
                    child: Icon(Icons.shopping_cart, color: Colors.black, size: 20),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  margin: EdgeInsets.only(bottom: 5, right: 5),
                  height: 50,
                  width: 50,
                  decoration: containerStyle('all'),
                  child: Center(
                    child: Icon(Icons.menu, color: Colors.black, size: 20),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: containerStyle('all'),
                  margin: EdgeInsets.only(bottom: 5, right: 5),
                  height: 250,
                  width: MediaQuery.of(context).size.width*0.7,
                  child: Container(
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('asset/images/blueSofa/1.png')
                      )
                    ),
                  ),
                ),
                Container(
                  decoration: containerStyle('left'),
                  margin: EdgeInsets.only(bottom: 5, right: 5),
                  height: 250,
                  width: MediaQuery.of(context).size.width*0.15,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      colorWidget(Color(0xff2f4b81)),
                      colorWidget(Color(0xffbc4747)),
                      colorWidget(Color(0xfffec286)),
                      colorWidget(Color(0xff47bc66)),
                    ],
                  ),
                )
              ],
            ),
            //scrollview
            Container(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    prodWidget('1'),
                    prodWidget('2'),
                    prodWidget('3'),
                    prodWidget('4'),
                  ],
                ),
              ),
            )

          ],
        ),
      ),

    );
  }

  void setCurrentColor(Color colorName) {
    currentColor = colorName;
    setState(() {
      
    });
  }

  void setCurrentChair(String img) {
    currentChair = img;
    setState(() {

    });
  }

  Container colorWidget(Color colorName) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: (currentColor == colorName) ? colorName : Colors.transparent
        )
      ),
      child: Center(
        child: InkWell(
          onTap: (){
            setCurrentColor(colorName);
          },
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorName
            ),
          ),
        ),
      )
    );
  }
  
  InkWell prodWidget(String img) {
    return InkWell(
      onTap: (){
        setCurrentChair(img);
      },
      child: Container(
        height: 90,
        width: 90,
        margin: EdgeInsets.only(bottom: 5, right: 5),
        decoration: containerStyle('all').copyWith(
          border: Border.all(
              color: (currentChair == img) ? Color(0xff2f4b81) : Colors.transparent
          )
        ),
        child: Center(
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
               image: AssetImage('asset/images/blueSofa/$img.png')
              )
            ),
          ),
        ),
      ),
    );
  }
}

