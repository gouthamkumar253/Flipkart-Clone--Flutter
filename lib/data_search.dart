import 'package:ecommerce/models/list_items.dart';
import 'package:ecommerce/product_details.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  DataSearch(this.searchItems);

  final List<ListItems> searchItems;

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<ListItems> suggestionItems = query.isEmpty
        ? searchItems.where((ListItems item) => item.id == 2).toList()
        : searchItems
            .where((ListItems item) => item.name.toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => InkWell(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute<BuildContext>(
                  builder: (BuildContext context) =>
                      ProductDetails(suggestionItems[index]),
                ),
              );
              //print(query.toLowerCase());
              //print(suggestionItems[index].name);
            },
            child: ListTile(
              leading: const Icon(Icons.toys),
              title: RichText(
                text: TextSpan(
                  text: suggestionItems[index].name.substring(0, query.length),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            suggestionItems[index].name.substring(query.length),
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ),
      itemCount: suggestionItems.length,
    );
  }
}
