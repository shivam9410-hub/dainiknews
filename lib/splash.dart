import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mausam/views/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateTohome();
  }

  _navigateTohome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://media.istockphoto.com/photos/online-news-on-a-smartphone-woman-reading-news-or-articles-in-a-picture-id1216923019?k=20&m=1216923019&s=612x612&w=0&h=OZWzznrV-hBMp2AYqBCflzUBjov0qaOlNn3tL5DBZFM="),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "DainikNews",
                style: GoogleFonts.pacifico(
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  //FontWeight.w400,
                ),
              ),
              Text("News that keeps you aware",
                  style: GoogleFonts.lancelot(
                    color: Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  )),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
