import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/global_variable.dart';
import 'package:shopping_app/widgets/product_card.dart';
import 'package:shopping_app/pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = ['All','Addidas','Nike','Bata'];
  late String selectedFilter = filters[0];

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }
  @override
  Widget build(BuildContext context) {

    const border = OutlineInputBorder(
      borderSide: BorderSide(
          color: Color.fromRGBO(225, 225, 225, 1)
      ),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50),),
    );

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Shoes\nCollection",style: Theme.of(context).textTheme.titleLarge,
                ),
              ),

              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index){
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child:
                    GestureDetector(
                      onTap: ()=>{
                        setState(() {

                          selectedFilter = filter;
                        }),
                      },
                      child: Chip(
                          backgroundColor: selectedFilter == filter
                              ? Theme.of(context).colorScheme.primary
                              : const Color.fromRGBO(245, 247, 249, 1),
                          side: const BorderSide(
                            color: Color.fromRGBO(245, 247, 249, 1),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          label: Text(filter,
                            style: const TextStyle(
                                fontSize:20),)
                      ),
                    ),
                  );
                }),
          ),

          Expanded(
            child: LayoutBuilder(
                builder: (context, constraints){
                  if(constraints.maxWidth>1080){
                    return GridView.builder(
                          itemCount: products.length,
                            gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.75,
                            ),
                        itemBuilder: (context, index){
                          final product = products[index];
                          return GestureDetector(
                          onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context){
                              return ProductDetailPage(product: product);
                          }));
                          },
            
                            child: productCard(title: product['title']as String,
                              price: product['price']as double,
                              image: product['imageUrl'] as String,
                              backgroundColor: index.isEven
                              ? const Color.fromRGBO(216, 240, 253, 1)
                                  :const Color.fromRGBO(245, 247, 249, 1),
                          ),
                        );
                      }
                    );
                  }else{
                    return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index){
                          final product = products[index];
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context){
                                        return ProductDetailPage(product: product);
                                      }));
                            },
                            child: productCard(title: product['title']as String,
                              price: product['price']as double,
                              image: product['imageUrl'] as String,
                              backgroundColor: index.isEven
                                  ? const Color.fromRGBO(216, 240, 253, 1)
                                  :const Color.fromRGBO(245, 247, 249, 1),
                            ),
                          );
                        }
                        );
                  }
                },
                ),
          ),
        ],
      ),
    );
  }
}
