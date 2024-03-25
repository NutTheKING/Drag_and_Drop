import 'package:flutter_drag_and_drop_list/page/board_model.dart';

class BoardListModel {
  int count;
  List<BoardItemModel> items;
  String name;
  // PagingController<int, BoardItem>? pagingController;

  BoardListModel({
    required this.count,
    required this.name,
    required this.items,
    // this.pagingController,
  });
}
