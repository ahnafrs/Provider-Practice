import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/favourite_screen_provider.dart';
import 'package:provider_practice/screens/myfavourite_item.dart';

class FavouriteScreenPage extends StatefulWidget {
  const FavouriteScreenPage({super.key});

  @override
  State<FavouriteScreenPage> createState() => _FavouriteScreenPageState();
}

class _FavouriteScreenPageState extends State<FavouriteScreenPage> {
  List<int> selectedIndex = [];
  @override
  Widget build(BuildContext context) {
    // final favourtiteItemProvider = Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyFavouriteItem()));
              },
              child: Icon(Icons.favorite)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 100,
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
