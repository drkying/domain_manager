import 'package:domain_manager/tools/system.dart';
import 'package:flutter/material.dart';
import '../tools/database/Operations.dart';
import '../tools/database/hive_type/Domain.dart';

class MyDomainsPage extends StatefulWidget {
  const MyDomainsPage({super.key});

  @override
  State<MyDomainsPage> createState() => _MyDomainsPage();
}

class _MyDomainsPage extends State<MyDomainsPage> {
  late Operations<Domain> domainOperations;

  @override
  void initState() {
    super.initState();
    domainOperations = Operations<Domain>('domains');
  }

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
            final domain = Domain(
                1,
                '博客',
                'drkying.com',
                'cloudflare',
                DateTime.parse('2024-12-31'),
                DateTime.parse('2024-04-18')); // Create a new Domain object
            domainOperations.add(domain, key:domain.id);
            print('Added domain with key: 1');
          },
          child: const Text('Add Domain'),
        ),
        ElevatedButton(
          onPressed: () {
            // Delete a domain
            const key = 1; // Get the key of the domain to delete
            domainOperations.delete(key);
            print(' deleted domain with key: $key');
          },
          child: const Text('Delete Domain'),
        ),
        ElevatedButton(
          onPressed: () {
            // Update a domain
            const key = 1; // Get the key of the domain to update
            final domain =
                domainOperations.retrieve(key); // Get the existing domain

            if (domain != null) {
              // TODO: Update the properties of the domain object
              domainOperations.update(key, domain);
              print('update obj:');
              print(domain); // Save the updated domain
            } else {
              print('No domain found with key: $key');
            }
          },
          child: const Text('Update Domain'),
        ),
        ElevatedButton(
          onPressed: () {
            // Retrieve a domain
            const key = 1; // Get the key of the domain to retrieve
            final domain = domainOperations.retrieve(key); // Get the domain

            if (domain != null) {
              // TODO: Do something with the domain
              print('Retrieved domain: $domain');
            } else {
              print('No domain found with key: $key');
            }
          },
          child: const Text('Retrieve Domain'),
        ),
      ],
    ));
  }
}
