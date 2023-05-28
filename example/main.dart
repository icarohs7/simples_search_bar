import 'package:flutter/material.dart';
import 'package:simple_search_bar/simple_search_bar.dart';

class MySearchBar extends StatelessWidget {
  // You could load the bar with search already active
  final SearchAppBarController appBarController = SearchAppBarController(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        primary: Theme.of(context).primaryColor,
        appBarController: appBarController,
        searchHint: "Pesquise aqui...",
        mainTextColor: Colors.white,
        onChange: (String value) {
          //Your function to filter list. It should interact with
          //the Stream that generate the final list
        },
        //Will show when SEARCH MODE wasn't active
        mainAppBar: AppBar(
          title: Text('Your Bar Title'),
          actions: <Widget>[
            InkWell(
              child: Icon(
                Icons.search,
              ),
              onTap: () {
                //This is where You change to SEARCH MODE. To hide, just
                //add FALSE as value on the stream
                appBarController.isOpen.value = true;
              },
            ),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
