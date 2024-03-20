import 'package:domain_manager/tools/system.dart';
import 'package:flutter/material.dart';

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
          const Text('My Domains'),
          const Text('This is the My Domains page'),
          Text(environmentCheck())
        ],
      )
    );
  }
}