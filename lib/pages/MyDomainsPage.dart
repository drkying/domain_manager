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
  final _domainController = TextEditingController();
  final _registerController = TextEditingController();
  final _expirationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    domainOperations = Operations<Domain>('domains');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Domains'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Add domain'),
                    content: SingleChildScrollView( // Wrap the Column in a SingleChildScrollView
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: _domainController,
                            decoration: const InputDecoration(
                              labelText: 'Domain',
                            ),
                          ),
                          TextField(
                            controller: _registerController,
                            decoration: const InputDecoration(
                              labelText: 'Register',
                            ),
                          ),
                          TextField(
                            controller: _expirationController,
                            decoration: const InputDecoration(
                              labelText: 'Expiration',
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Add'),
                        onPressed: () {
                          // Get the input values
                          String domainName = _domainController.text;
                          String register = _registerController.text;
                          DateTime expiration = DateTime.parse(_expirationController.text);

                          // Create a new Domain object
                          final domain = Domain(
                            0, // TODO: Generate a unique ID for the new domain
                            domainName,
                            domainName, // Assuming the domain name is the same as the domain
                            register,
                            expiration,
                            DateTime.now(), // Set the lastUpdatedTime to now
                          );

                          // Add the new domain
                          domainOperations.add(domain, key: domain.id);

                          // Close the dialog
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
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
                  final domains = domainOperations.retrieveAll(); // Get the domain

                  if (domains != null) {
                    // TODO: Do something with the domain
                    print('Retrieved domain: $domains');
                  } else {
                    print('No domain found with key: $key');
                  }
                },
                child: const Text('Retrieve Domain'),
              ),
            ],
          ))
    );
  }
}
