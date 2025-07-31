import 'package:flutter/material.dart';
import 'package:app/features/utils/widgets/widgets.dart';
import 'package:app/features/examples_of_works/widgets/widgets.dart';

class ExampleOfWorksScreen extends StatelessWidget {
  const ExampleOfWorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(flex: 1,),
              const Headliner(label: "Мои работы"),
              const Spacer(flex: 1,),
              Expanded(
                flex: 16,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true, // Важно!
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        itemCount: 10,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, 
                          crossAxisSpacing: 20, 
                          mainAxisSpacing: 20, 
                          childAspectRatio: 0.5, 
                        ),
                        itemBuilder: (context, index) {
                          return WorkTile();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(flex: 1,)
            ],
          ),
        )
      ),
    );
  }
}