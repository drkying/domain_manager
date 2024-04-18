import 'package:domain_manager/tools/system.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../tools/database/hive_type/Domain.dart';

class MyDomainsPage extends StatefulWidget {
  const MyDomainsPage({super.key});

  @override
  State<MyDomainsPage> createState() => _MyDomainsPage();
}
class _MyDomainsPage extends State<MyDomainsPage> {
  var domains =  Hive.openBox('domains');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('My Domains'),
          const Text('This is the My Domains page'),
          Text(environmentCheck()),
          ElevatedButton(
            onPressed: () {
              // Add a new domain
              final domain = Domain(1,'博客','drkying.com','cloudflare','2024-12-31' as DateTime,'2024-04-18' as DateTime); // Create a new Domain object
              // TODO: Set the properties of the domain object
              domains.add(domain);
            },
            child: const Text('Add Domain'),
          ),
          ElevatedButton(
            onPressed: () {
              // Delete a domain
              const key = '1'; // Get the key of the domain to delete
              domains.delete(key);
            },
            child: const Text('Delete Domain'),
          ),
          ElevatedButton(
            onPressed: () {
              // Update a domain
              const key = 1; // Get the key of the domain to update
              final domain = domains.get(key); // Get the existing domain
              // TODO: Update the properties of the domain object
              domains.put(key, domain); // Save the updated domain
            },
            child: const Text('Update Domain'),
          ),
          ElevatedButton(
            onPressed: () {
              // Retrieve a domain
              const key = 1; // Get the key of the domain to retrieve
              final domain = domains.get(key); // Get the domain
              // TODO: Do something with the domain
            },
            child: const Text('Retrieve Domain'),
          ),
        ],
      )
    );
  }
}