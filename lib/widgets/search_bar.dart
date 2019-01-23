import 'package:flutter/material.dart';
import 'package:keeper/themes/styles.dart';
import 'package:keeper/static/constants.dart';

class SearchBar extends StatelessWidget {

  final VoidCallback searchCallBack, menuCallBack, profileCallback;
  SearchBar({this.searchCallBack, this.menuCallBack, this.profileCallback});

  @override
  Widget build(BuildContext context) {

    var _itemPadding = EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: Styles.keyLineSpacing,
    );

    return
      SliverAppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        floating: true,
        expandedHeight: 72.0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Card(
          margin: EdgeInsets.all(
            Styles.allSpacing,
          ),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Styles.borderRadius,
              ),
              side: BorderSide(
                color: Theme.of(context).primaryColorLight,
              )
          ),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: this.menuCallBack,
                icon: Icon(
                  Icons.menu,
                ),
              ),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(32.0),
                  onTap: this.searchCallBack,
                  child: Container(
                    padding: _itemPadding,
                    child: Text(
                      'Search your notes',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(32.0),
                onTap: this.profileCallback,
                child: Container(
                  padding: _itemPadding,
                  child: Image.network(Constants.profileImageUri),
                ),
              ),
            ],
          ),
        ),
      );
  }
}