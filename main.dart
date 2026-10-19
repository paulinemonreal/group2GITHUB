import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Drink {
  const Drink({
    required this.name,
    required this.price,
    required this.icon,
    required this.color,
    required this.description,
  });

  final String name;
  final String price;
  final IconData icon;
  final Color color;
  final String description;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Drink Menu',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: const Color(0xFFFFF8F0),
      ),
      home: const DrinkMenuScreen(),
    );
  }
}

class DrinkMenuScreen extends StatelessWidget {
  const DrinkMenuScreen({super.key});

  static const List<Drink> drinks = [
    Drink(
      name: 'Iced Coffee',
      price: '₱89.00',
      icon: Icons.coffee,
      color: Color(0xFFD7B899),
      description: 'Refreshing coffee with ice',
    ),
    Drink(
      name: 'Milk Tea',
      price: '₱79.00',
      icon: Icons.local_cafe,
      color: Color(0xFFF2D6B3),
      description: 'Creamy milk tea with pearls',
    ),
    Drink(
      name: 'Strawberry Juice',
      price: '₱65.00',
      icon: Icons.local_drink,
      color: Color(0xFFF8C8D0),
      description: 'Sweet and refreshing strawberry',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Drink Menu',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Our Drinks',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Choose your favorite drink!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                const Icon(Icons.local_cafe, color: Colors.brown, size: 28),

                const SizedBox(width: 10),

                const Expanded(
                  child: Text(
                    'Available Drinks',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Welcome to My Drink Menu!'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Explore'),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: drinks.length,
                itemBuilder: (context, index) {
                  final drink = drinks[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.brown.withValues(alpha: 0.12),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Row(
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            color: drink.color,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            drink.icon,
                            size: 35,
                            color: Colors.brown,
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                drink.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                drink.description,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                drink.price,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${drink.name} selected!'),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.brown,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
