import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.plus)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search contacts...',
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white10,
                    child: Text(
                      'C${index + 1}',
                      style: const TextStyle(color: Color(0xFF03DAC6)),
                    ),
                  ),
                  title: Text('Contact Name ${index + 1}'),
                  subtitle: Text('+254 7${index + 10} 123 456'),
                  trailing: IconButton(
                    icon: const Icon(FontAwesomeIcons.paperPlane, size: 16, color: Colors.white54),
                    onPressed: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
