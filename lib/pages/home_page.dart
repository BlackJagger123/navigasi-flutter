import 'package:flutter/material.dart';
import 'package:praktikum7/models/item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Item> items = [
      Item(
          name: 'Sugar',
          price: 5000,
          photoUrl:
          'https://storage.aido.id/articles/May2021/cxx584kg68f7hlu8adul.jpg',
          stock: 10,
          rating: 4.5),
      Item(
          name: 'Salt',
          price: 2000,
          photoUrl:
          'https://asset.kompas.com/crops/DHhj5oBC_EOstrZKLTdDrr4qpWw=/0x0:1280x853/750x500/data/photo/2021/05/30/60b32e18f3646.jpg',
          stock: 15,
          rating: 4.0),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Items List'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.8,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {Navigator.pushNamed(context, '/item', arguments: item);
            },
            child: Hero(
              tag: item.name,
              child: Card(
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.network(
                        item.photoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text('Price: Rp ${item.price}'),
                          Text('Stock: ${item.stock}'),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.yellow, size: 16),
                              Text('${item.rating}',
                                  style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Satrio Adi Baskoro - NIM: 362358302007',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}