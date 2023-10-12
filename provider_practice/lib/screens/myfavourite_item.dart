import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/favourite_screen_provider.dart';

class MyFavouriteItem extends StatefulWidget {
  const MyFavouriteItem({super.key});

  @override
  State<MyFavouriteItem> createState() => _MyFavouriteItemState();
}

class _MyFavouriteItemState extends State<MyFavouriteItem> {
  @override
  Widget build(BuildContext context) {
    final myFavouriteItemProvider = Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: myFavouriteItemProvider.selectedIndex.length,
                  itemBuilder: (context, index) {
                    return Consumer<FavouriteItemProvider>(
                        builder: (context, value, child) {
                      return ListTile(
                        title: Text('Title ' + index.toString()),
                        trailing: IconButton(
                            onPressed: () {
                              if (value.selectedIndex.contains(index)) {
                                value.removeItem(index);
                              } else {
                                value.addItem(index);
                              }
                            },
                            icon: Icon(value.selectedIndex.contains(index)
                                ? Icons.favorite
                                : Icons.favorite_border_outlined)),
                      );
                    });
                  }))
        ],
      ),
    );
  }
}
