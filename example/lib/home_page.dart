import 'package:example/pages/simple_usage.dart';
import 'package:flutter/material.dart';

class LibraryExample {
  final String title;
  final Widget page;

  LibraryExample({required this.title, required this.page});
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of your library use cases
    final List<LibraryExample> examples = [
      LibraryExample(title: 'Basic Usage', page: const TimelineScreen()),
      // LibraryExample(
      //   title: 'Advanced Filtering',
      //   page: const AdvancedExamplePage(),
      // ),
      // LibraryExample(title: 'Custom Themes', page: const ThemeExamplePage()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Chained List Use Cases'), elevation: 2),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: examples.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = examples[index];
          return ListTile(
            title: Text(
              item.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            tileColor: Colors.grey[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => item.page),
              );
            },
          );
        },
      ),
    );
  }
}
