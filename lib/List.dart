import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class List extends StatefulWidget {
  const List({Key? key}) : super(key: key);

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  final products = <Product>[
 const   Product(
      name: 'Sản phẩm 1',
      description: 'Mô tả sản phẩm 1',
      price: 100,
    ),
    const Product(
      name: 'Sản phẩm 2',
      description: 'Mô tả sản phẩm 2',
      price: 200,
    ),
    const Product(
      name: 'Sản phẩm 3',
      description: 'Mô tả sản phẩm 3',
      price: 300,
    ),
    const Product(
      name: 'Sản phẩm 4',
      description: 'Mô tả sản phẩm 4',
      price: 400,
    ),
    const Product(
      name: 'Sản phẩm 5',
      description: 'Mô tả sản phẩm 5',
      price: 500,
    ),
    const Product(
      name: 'Sản phẩm 6',
      description: 'Mô tả sản phẩm 5',
      price: 500,
    ),
    const Product(
      name: 'Sản phẩm 7',
      description: 'Mô tả sản phẩm 5',
      price: 500,
    ),
    const Product(
      name: 'Sản phẩm 8',
      description: 'Mô tả sản phẩm 5',
      price: 500,
    ),
    const Product(
      name: 'Sản phẩm 9',
      description: 'Mô tả sản phẩm 5',
      price: 500,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Danh sách sản phẩm',style: TextStyle(color: Colors.white),),
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      ),
      body: ListView.builder(
        itemCount: products.length,

        padding: const EdgeInsets.all( 19.0),
        itemBuilder: (context, index) {
          final product = products[index];
          
          return Container(
            margin: const EdgeInsets.all(9),
            child: ListTile(
            
              title: Text('Tên SP: ${product.name}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            
                children: [
            
                  Text('TTSP:${product.description}'),
                  Text('Giá :${product.price} VND'),
                ],
              ),
              onTap: () {
                // Xử lý khi người dùng nhấn vào sản phẩm
              },
              tileColor: Colors.blueGrey[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: Colors.grey,width: 1.0),
            
              ),
            
            ),
          );

        },

      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final int price;

  const Product({
    required this.name,
    required this.description,
    required this.price,
  });
}
