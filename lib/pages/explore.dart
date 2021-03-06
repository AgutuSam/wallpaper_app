import 'package:flutter/material.dart';
import 'package:wallpaper_app/widgets/new_items.dart';
import 'package:wallpaper_app/widgets/popular_items.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({Key key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          child: SafeArea(
            child: TabBar(
              controller: tabController,
              labelStyle: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500),
              tabs: <Widget>[
                Tab(
                  child: Text('Popular'),
                ),
                Tab(
                  child: Text(
                    'New',
                  ),
                )
              ],
              labelColor: Colors.black,
              indicatorColor: Colors.grey[900],
              unselectedLabelColor: Colors.grey,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: <Widget>[PopularItems(), NewItems()],
            ),
          ),
          // Align(
          //   alignment: Alignment(0, 1.0),
          //   child: Container(
          //     color: Colors.deepPurpleAccent,
          //     child: facebookBannerAd,
          //   ),
          // ),
        ],
      ),
    );
  }
}
