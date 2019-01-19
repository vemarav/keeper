import 'package:flutter/material.dart';
import 'package:keeper/themes/styles.dart';
import 'package:keeper/static/constants.dart';

class SearchBar extends StatelessWidget {

  final VoidCallback searchCallBack, menuCallBack, profileCallback;
  SearchBar({this.searchCallBack, this.menuCallBack, this.profileCallback});

  @override
  Widget build(BuildContext context) {
    return
      SliverAppBar(
        elevation: 0.0,
        floating: true,
        expandedHeight: 80.0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Card(
          margin: EdgeInsets.all(Styles.horizontalSpacing),
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
              InkWell(
                onTap: this.menuCallBack,
                child: Container(
                  margin: EdgeInsets.all(
                    Styles.keyLineSpacing,
                  ),
                  child: Icon(
                    Icons.menu,
                    size: 28,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: this.searchCallBack,
                  child: Container(
                    padding: EdgeInsets.all(
                      Styles.keyLineSpacing,
                    ),
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
                onTap: this.profileCallback,
                child: Container(
                  padding: EdgeInsets.all(
                    Styles.keyLineSpacing,
                  ),
                  child: Image.network(Constants.profileImageUri),
                ),),
            ],
          ),
        ),
      );
  }
}