import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_1/models/shop.dart';
import 'package:flutter_app_1/services/shop_service.dart';

class ShopDetailScreen extends StatefulWidget {
  final Shop shop;

  const ShopDetailScreen({super.key, required this.shop});

  @override
  State<ShopDetailScreen> createState() => _ShopDetailScreenState();
}

class _ShopDetailScreenState extends State<ShopDetailScreen> {
  late Shop _editableShop;
  bool _isEditing = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rentController = TextEditingController();
  final TextEditingController _waterController = TextEditingController();
  final TextEditingController _electricityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _editableShop = widget.shop;
    _nameController.text = widget.shop.name;
    _rentController.text = widget.shop.rentAmount.toString();
    _waterController.text = widget.shop.waterAmount.toString();
    _electricityController.text = widget.shop.electricityAmount.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_editableShop.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_isEditing)
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Shop Name'),
                onChanged: (value) {
                  setState(() {
                    _editableShop = _editableShop.copyWith(name: value);
                  });
                },
              )
            else
              Text(
                _editableShop.name,
                style: const TextStyle(fontSize: 24),
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_isEditing)
                  ElevatedButton(
                    onPressed: () {
                      _saveChanges(context);
                    },
                    child: const Text('Save'),
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isEditing = true;
                      });
                    },
                    child: const Text('Change'),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Radio(
                  value: true,
                  groupValue: _editableShop.isRented,
                  onChanged: _isEditing
                      ? (value) {
                    setState(() {
                      _editableShop = _editableShop.copyWith(
                          isRented: value as bool);
                    });
                  }
                      : null,
                ),
                const Text('Rented'),
                const SizedBox(width: 20),
                Radio(
                  value: false,
                  groupValue: _editableShop.isRented,
                  onChanged: _isEditing
                      ? (value) {
                    setState(() {
                      _editableShop = _editableShop.copyWith(
                          isRented: value as bool);
                    });
                  }
                      : null,
                ),
                const Text('Free'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Payment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: const Text('Rent Paid'),
              value: _editableShop.rentPaid,
              onChanged: _isEditing
                  ? (value) {
                setState(() {
                  _editableShop =
                      _editableShop.copyWith(rentPaid: value!);
                });
              }
                  : null,
            ),
            CheckboxListTile(
              title: const Text('Water Paid'),
              value: _editableShop.waterPaid,
              onChanged: _isEditing
                  ? (value) {
                setState(() {
                  _editableShop =
                      _editableShop.copyWith(waterPaid: value!);
                });
              }
                  : null,
            ),
            CheckboxListTile(
              title: const Text('Electricity Paid'),
              value: _editableShop.electricityPaid,
              onChanged: _isEditing
                  ? (value) {
                setState(() {
                  _editableShop =
                      _editableShop.copyWith(electricityPaid: value!);
                });
              }
                  : null,
            ),
            const SizedBox(height: 20),
            const Text(
              'Payment Detail',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            if (_isEditing) ...[
              TextField(
                controller: _rentController,
                decoration: const InputDecoration(labelText: 'Rent Amount (\$)'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _editableShop = _editableShop.copyWith(
                        rentAmount: double.tryParse(value) ?? 0);
                  });
                },
              ),
              TextField(
                controller: _waterController,
                decoration:
                const InputDecoration(labelText: 'Water Amount (\$)'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _editableShop = _editableShop.copyWith(
                        waterAmount: double.tryParse(value) ?? 0);
                  });
                },
              ),
              TextField(
                controller: _electricityController,
                decoration:
                const InputDecoration(labelText: 'Electricity Amount (\$)'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _editableShop = _editableShop.copyWith(
                        electricityAmount: double.tryParse(value) ?? 0);
                  });
                },
              ),
            ] else ...[
              ListTile(
                title: const Text('Rent'),
                trailing: Text('\$${_editableShop.rentAmount}'),
              ),
              ListTile(
                title: const Text('Water'),
                trailing: Text('\$${_editableShop.waterAmount}'),
              ),
              ListTile(
                title: const Text('Electricity'),
                trailing: Text('\$${_editableShop.electricityAmount}'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _saveChanges(BuildContext context) {
    Provider.of<ShopService>(context, listen: false).updateShop(_editableShop);
    setState(() {
      _isEditing = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Shop details updated successfully')),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _rentController.dispose();
    _waterController.dispose();
    _electricityController.dispose();
    super.dispose();
  }
}

extension ShopCopyWith on Shop {
  Shop copyWith({
    String? name,
    bool? isRented,
    bool? rentPaid,
    bool? waterPaid,
    bool? electricityPaid,
    double? rentAmount,
    double? waterAmount,
    double? electricityAmount,
  }) {
    return Shop(
      id: id,
      name: name ?? this.name,
      isRented: isRented ?? this.isRented,
      rentPaid: rentPaid ?? this.rentPaid,
      waterPaid: waterPaid ?? this.waterPaid,
      electricityPaid: electricityPaid ?? this.electricityPaid,
      rentAmount: rentAmount ?? this.rentAmount,
      waterAmount: waterAmount ?? this.waterAmount,
      electricityAmount: electricityAmount ?? this.electricityAmount,
    );
  }
}