import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/menu_provider.dart';
import 'cart_bottom_sheet.dart';
import 'custom_button_widget.dart';
import 'custom_text_widget.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    final selectedCategoryId = menuProvider.selectedCategoryId;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Menu',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Container(
                height: 28,
                child: CustomButton(
                  label: 'Back',
                  onPressed: () {},
                  color: const Color.fromARGB(255, 86, 152, 90),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Consumer<MenuProvider>(
        builder: (context, menuProvider, _) {
          if (menuProvider.categories.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final selectedCategory = menuProvider.categories.firstWhere(
              (category) => category.storeCategoryId == selectedCategoryId,
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // Category list
                      SizedBox(
                        width: 120,
                        child: ListView.builder(
                          itemCount: menuProvider.categories.length,
                          itemBuilder: (context, index) {
                            final category = menuProvider.categories[index];
                            final isSelected =
                                category.storeCategoryId == selectedCategoryId;

                            return GestureDetector(
                              onTap: () => menuProvider.setSelectedCategoryId(
                                  category.storeCategoryId),
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color.fromRGBO(250, 246, 246, 1)
                                      : null,
                                  border: Border.all(
                                      color: isSelected
                                          ? Colors.grey
                                          : Colors.transparent),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2.0,
                                            color: isSelected
                                                ? Color.fromARGB(
                                                    255, 60, 146, 70)
                                                : Colors.transparent),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Image.network(
                                        "https://media.istockphoto.com/id/938742222/photo/cheesy-pepperoni-pizza.jpg?s=1024x1024&w=is&k=20&c=OKXH55QwDa6L3cY2pTTz1DKVT2clqW3zcVaJVaU-N_U=",
                                        width: 100,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    CustomText(
                                      text: category.categoryName ?? '',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: isSelected
                                            ? Colors.green
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      const VerticalDivider(
                        color: Colors.black,
                        width: 1.0,
                      ),

                      // Product list
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Display selected category name as title above product column
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CustomText(
                                text: selectedCategory != null
                                    ? selectedCategory.categoryName!
                                    : 'No Category Selected',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: menuProvider
                                    .getProductsForCategory(selectedCategoryId)
                                    .length,
                                itemBuilder: (context, index) {
                                  final product =
                                      menuProvider.getProductsForCategory(
                                          selectedCategoryId)[index];
                                  return ListTile(
                                    title: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: product.productName ?? '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                              CustomText(
                                                text:
                                                    '\$${product.productPrice ?? ''}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 245, 243, 243),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 232, 229, 229)),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: IconButton(
                                            icon: const Icon(Icons.add,
                                                color: Colors.green, size: 35),
                                            onPressed: () {
                                              menuProvider.addToCart(product);
                                              _showCartBottomSheet(context);
                                            },
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
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  void _showCartBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      builder: (context) {
        return CartBottomSheet();
      },
    );
  }
}
