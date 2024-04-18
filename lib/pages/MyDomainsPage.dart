import 'package:domain_manager/tools/system.dart';
import 'package:flutter/material.dart';

import '../tools/database/domains.dart';

class MyDomainsPage extends StatefulWidget {
  const MyDomainsPage({super.key});

  @override
  State<MyDomainsPage> createState() => _MyDomainsPage();
}
class _MyDomainsPage extends State<MyDomainsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(environmentCheck()),
          ElevatedButton(
            onPressed: () {
              addDomain('1', 'Test Domain', 'test.com', 'Test Registrar', '2023-01-01');
            },
            child: Text('Add Domain'),
          ),
          ElevatedButton(
            onPressed: () {
              getDomains();
            },
            child: Text('Get Domains'),
          ),
          ElevatedButton(
            onPressed: () {
              updateDomain('1', 'Updated Domain', 'updated.com', 'Updated Registrar', '2024-01-01');
            },
            child: Text('Update Domain'),
          ),
          ElevatedButton(
            onPressed: () {
              deleteDomain('1');
            },
            child: Text('Delete Domain'),
          ),
        ],
      )
    );
  }
}