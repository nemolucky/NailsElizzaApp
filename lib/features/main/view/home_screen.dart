import 'package:app/features/config/theme/text_styles.dart';
import 'package:app/features/utils/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
              ShaderMask(
                blendMode: BlendMode.dstIn,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black38,
                      Colors.black87,
                      Colors.black,
                      Colors.black,
                      Colors.black87,
                      Colors.black38,
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.2, 0.4, 0.5, 0.6, 0.7, 0.9, 1.0],
                  ).createShader(bounds);
                },
                child: AspectRatio(
                  aspectRatio: 1.8,
                  child: Image.asset(
                    "assets/images/background_image.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Column(
                children: [
                  const Spacer(flex: 8),                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Spacer(flex: 1,),
                      const CircleAvatar(
                        radius: 50, 
                        backgroundImage: AssetImage("assets/images/profile_photo.jpg"),
                      ),
                      const Spacer(flex: 1,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Елизавета", style: TextStyles.mediumText.copyWith(
                            color: Color.fromRGBO(71, 71, 71, 1),
                            fontSize: 22
                          ),),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Срочно запишись на маникюр!",
                               style: TextStyles.smallText.copyWith(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(flex: 4,),
                    ],
                  ),
                  const Spacer(flex: 7),
                  BaseButton(
                    buttonText: "Записаться",                         
                    function: (){
                        Navigator.of(context).pushNamed('/services');
                    },),
                  const Spacer(flex: 1),
                  BaseButton(
                    buttonText: "Работы",                        
                    function: (){
                      Navigator.of(context).pushNamed('/works');
                  },),
                  const Spacer(flex: 1),
                  BaseButton(
                    buttonText: "Отзывы",                        
                    function: (){
                      Navigator.of(context).pushNamed('/reviews');
                  },),
                  const Spacer(flex: 2),
                ],
              ),
          ],
        ),
      )
    );
  }
}