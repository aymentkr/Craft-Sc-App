import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
          children: <Widget>[
            ClipPath(
                child: Container(
                  color: Colors.red[400],
                  height: 140,
                  width: screenSize.width,
                ),
                clipper: WaveClipperOne()
            ),

            ClipPath(
              child: Container(
                color: Colors.red[600],
                height: 120,
                width: screenSize.width,
              ),
              clipper: WaveClipperTwo(),
            ),

            //curves for bottom
            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.red[400],
                  height: 80,
                  width: screenSize.width,
                ),
                clipper: WaveClipperOne(reverse: true),
              ),
              bottom: 0,
              left: 0,
            ),
            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.red[600],
                  height: 90,
                  width: screenSize.width,
                ),
                clipper: WaveClipperTwo(reverse: true),
              ),
              bottom: 0,
              left: 0,
            ),


            Container(
              //for large screens
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                children: <Widget>[

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 64),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Text("Craft Science", style: TextStyle(

                                    fontSize: 50, fontWeight: FontWeight.w700, color: Colors.red
                                )
                                ),
                                SizedBox(height: 8,),
                                Text("We believe that education should be available for everyone",
                                    style: TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.w300, letterSpacing: 1.0, color: Colors.grey[800]
                                    )
                                ),
                                SizedBox(height: 16,),

                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  )
                ],
              ),
            ),



          ],
        ),

      ),
    );
  }
}


