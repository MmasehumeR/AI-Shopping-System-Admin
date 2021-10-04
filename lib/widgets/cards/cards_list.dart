import 'package:aishop_admin/provider/app_provider.dart';
import 'package:aishop_admin/provider/products_provider.dart';
import 'package:aishop_admin/provider/tables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'card_item.dart';

class CardsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    TablesProvider tablesProvider = Provider.of<TablesProvider>(context);
    ProductsProvider productsProvider = Provider.of<ProductsProvider>(context);
    return Container(
      height: 120,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardItem(
              icon: Icons.monetization_on_outlined,
              title: "Revenue",
              subtitle: "Revenue this month",
              value: "\R ${appProvider.revenue}",
              color1: Colors.black,
              color2: Colors.black54,
            ),
            CardItem(
              icon: Icons.shopping_basket_outlined,
              title: "Products",
              subtitle: "Total products on store",
              value: "${productsProvider.products.length}",
              color1: Colors.black,
              color2: Colors.black45,
            ),
            CardItem(
              icon: Icons.delivery_dining,
              title: "Orders",
              subtitle: "Total orders for this month",
              value: "${tablesProvider.orders.length}",
              color1: Colors.black,
              color2: Colors.black38,
            ),
          ],
        ),
      ),
    );
  }
}
