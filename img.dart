
import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'responsive image',
      home:ResponsiveImage(),
    );
  }
}

class ResponsiveImage extends StatefulWidget{
  ResponsiveImageState createState()=> ResponsiveImageState();
}

class ResponsiveImageState extends State<ResponsiveImage>
    with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  void initState(){
    super.initState();

    _controller=AnimationController(
        duration: const Duration(seconds: 5),
        vsync: this,
    );

    _animation=CurvedAnimation(parent: _controller,
        curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context){
    final screenWidth=MediaQuery.of(context).size.width;
    final imageSize=screenWidth*0.5;

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Transition Image demo'),
      ),
      body: Center(
        child: ScaleTransition(
            scale: _animation,
          child: FadeTransition(opacity: _animation,
            child: Image.asset(
                'assets/images/flower1.jpg',
              width: imageSize,
              height: imageSize,
              fit:BoxFit.cover,
            ),

          ),
        ),
      ),
    );
  }
}