import 'package:flutter/material.dart';
import './customers_add.dart';
import "../widgets/custom_app_bar.dart";
import "../widgets/customer_list.dart";

class CustomerMain extends StatefulWidget {
  const CustomerMain({Key? key}) : super(key: key);

  @override
  State<CustomerMain> createState() => _CustomerMainState();
}

class _CustomerMainState extends State<CustomerMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Customers"),
      body: Column(
        children: [
          const Expanded(
            child: CustomerList(),
          ),
          ElevatedButton(
            onPressed: () => {
              Navigator.of(context).pushNamed(
                CustomersAdd.routeName,
              )
            },
            child: const Text("Add Customer"),
          ),
        ],
      ),
    );
  }
}
