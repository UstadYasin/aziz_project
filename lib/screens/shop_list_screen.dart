import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_1/models/shop.dart';
import 'package:flutter_app_1/screens/shop_detail_screen.dart';
import 'package:flutter_app_1/services/shop_service.dart';

class ShopListScreen extends StatefulWidget {
  const ShopListScreen({super.key});

  @override
  State<ShopListScreen> createState() => _ShopListScreenState();
}

class _ShopListScreenState extends State<ShopListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ShopService>(context, listen: false).fetchShops();
    });
  }

  @override
  Widget build(BuildContext context) {
    final shopService = Provider.of<ShopService>(context);
    final shops = shopService.shops;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Management App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text('Total Shops'),
                        Text(
                          shops.length.toString(),
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Rented'),
                        Text(
                          shopService.rentedCount.toString(),
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Free'),
                        Text(
                          shopService.freeCount.toString(),
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: shops.length,
              itemBuilder: (context, index) {
                final shop = shops[index];
                return Card(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ListTile(
                    title: Text(shop.name),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShopDetailScreen(shop: shop),
                          ),
                        );
                      },
                      child: const Text('Detail'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddShopDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddShopDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Shop'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Shop Name'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  final newShop = Shop(
                    id: '',
                    name: nameController.text,
                    isRented: false,
                    rentPaid: false,
                    waterPaid: false,
                    electricityPaid: false,
                    rentAmount: 0,
                    waterAmount: 0,
                    electricityAmount: 0,
                  );
                  Provider.of<ShopService>(context, listen: false)
                      .addShop(newShop);
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}