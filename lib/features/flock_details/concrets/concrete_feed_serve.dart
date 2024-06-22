import 'package:flutter/material.dart';

import '../models/feed_serve_model.dart';
import '../models/flock_data_model.dart';
import '../widgets/filtration/feed_served_filtration_bar.dart';
import '../widgets/items/feed_server_item.dart';
import 'abstract_widget.dart';


class ConcreteFeedServed implements MyItem {
  @override
  Widget buildItem(FlockDataModel flock) {
    return FeedServedItem(flock: flock as FeedServeModel);
  }

  @override
  void converting(BuildContext context) {
    // BlocProvider.of<FlocksDataCubit>(context).getFeedServed();
  }

  @override
  String get getTitle => 'FeedServed';

  @override
  Widget buildFiltration() {
    return const FeedServedFiltration();
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
  
  @override
  void fromjson() {
    // TODO: implement fromjson
  }
  
  @override
  // TODO: implement getLink
  String get getLink => throw UnimplementedError();
  
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
