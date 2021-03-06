import 'package:bar_iland_app/pages/lost_found_board.dart';
import 'package:flutter/material.dart';
import 'package:bar_iland_app/scoped-models/main.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class LostFoundManager extends StatelessWidget {
  final MainModel model;
  LostFoundManager(this.model);

  @override
  Widget build(BuildContext context) {
    model.fetchLostFoundLocations();
    model.fetchLostFoundTypes();
    model.fetchLostItems();
    model.fetchFoundItems();
    return DefaultTabController(
      length: 2,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: Text('אבידות ומציאות'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(MaterialCommunityIcons.file_search),
                  text: 'פריטים שאבדו',
                ),
                Tab(
                  icon: Icon(MaterialCommunityIcons.file_check),
                  text: 'פריטים שנמצאו',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              LostFoundBoard(model, "אבידות"),
              LostFoundBoard(model, "מציאות")
            ],
          ),
        ),
      ),
    );
  }
}
