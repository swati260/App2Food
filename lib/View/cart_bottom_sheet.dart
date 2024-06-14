import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/menu_provider.dart';
import 'custom_button_widget.dart';
import 'custom_text_widget.dart';

class CartBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MenuProvider>(
      builder: (context, menuProvider, child) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black, width: 2.0)),
            ),
            height: 200,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'MY ORDER',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Row(
                      children: [
                        CustomButton(
                          label: 'Edit',
                          onPressed: () {},
                          color: Color.fromARGB(255, 86, 152, 90),
                        ),
                        const SizedBox(width: 10),
                        CustomButton(
                          label: 'View My Order',
                          onPressed: () {},
                          color: const Color.fromARGB(255, 86, 152, 90),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: 'Tax: \$${menuProvider.getTotalAmount()}',
                        style: Theme.of(context).textTheme.bodyMedium),
                    CustomText(
                      text: '|',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    CustomText(
                        text: 'Total: \$${menuProvider.getTotalAmount()}',
                        style: Theme.of(context).textTheme.bodyMedium),
                    CustomText(
                      text: '|',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    CustomText(
                        text: 'Items: ${menuProvider.getTotalItems()}',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 130,
                      child: CustomButton(
                        label: 'Cancel',
                        onPressed: () => Navigator.pop(context),
                        color: Color.fromARGB(255, 138, 11, 2),
                      ),
                    ),
                    Container(
                      width: 150,
                      child: CustomButton(
                        label: 'Order Now',
                        onPressed: () {},
                        color: Color.fromARGB(255, 86, 152, 90),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
