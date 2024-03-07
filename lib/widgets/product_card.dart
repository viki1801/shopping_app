import'package:flutter/material.dart';
    
    class productCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;
      const productCard({Key? key, required this.title, required this.price, required this.image, required this.backgroundColor}) : super(key: key);
    
      @override
      Widget build(BuildContext context) {
        return Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: Theme.of(context).textTheme.titleMedium,),
              const SizedBox(height: 5,),
              Text("₹ $price",style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: 5,),
              Center(
                child: Image.asset(image,
                  height: 175,
                ),
              ),

            ],
          ),
        );
      }
    }
    