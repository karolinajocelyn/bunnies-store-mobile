import 'package:bunnies_store/widgets/left_drawer.dart';
import 'package:flutter/material.dart';
import 'package:bunnies_store/menu.dart'; 

class AddItemFormPage extends StatefulWidget {
  const AddItemFormPage({super.key});

  @override
  State<AddItemFormPage> createState() => _AddItemFormPageState();
}

class _AddItemFormPageState extends State<AddItemFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _artist = '';
  double _price = 0.0;
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name can't be empty!";
                  }
                  if (value.length < 3) {
                    return "Name field must be longer than 3 characters!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Artist",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _artist = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Artist can't be empty!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _price = double.tryParse(value) ?? 0.0;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Price can't be empty!";
                  }
                  final parsedValue = double.tryParse(value);
                  if (parsedValue == null || parsedValue < 0) {
                    return "Price must be a positive integer!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                maxLines: 3,
                onChanged: (value) {
                  setState(() {
                    _description = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Description can't be empty!";
                  }
                  if (value.length > 200) {
                    return "Description must be less than 200 characters!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    minimumSize: Size(150, 50),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Item Saved!'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Name: $_name'),
                                  Text('Artist: $_artist'),
                                  Text('Price: Rp$_price'),
                                  Text('Description: $_description'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context); // Close the dialog
                                  // Navigate back to the main page
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyHomePage(),
                                    ),
                                  );
                                  _formKey.currentState!.reset(); // Reset the form
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
