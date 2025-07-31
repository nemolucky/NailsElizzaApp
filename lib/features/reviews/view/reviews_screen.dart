import 'package:flutter/material.dart';
import 'package:app/features/utils/widgets/widgets.dart';
import 'package:app/features/reviews/widgets/widgets.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(flex: 1,),
              const Headliner(label: "Ваши отзывы"),
              const Spacer(flex: 1,),
              Expanded(
                flex: 16,
                child: SingleChildScrollView(
                  child: GridView.builder(
                    shrinkWrap: true, 
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
                      return ReviewTile();
                    },
                  ),
                ),
              ),
              const Spacer(flex: 1,)
            ],
          ),
        )
      ),
    );
  }
}