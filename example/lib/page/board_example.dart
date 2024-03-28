import 'package:drag_and_drop_with_pageview/drag_and_drop_with_pageview.dart';

import 'package:example/page/board_card.dart';
import 'package:example/page/board_list.dart';
import 'package:example/page/board_model.dart';
import 'package:flutter/material.dart';

class ExampleBoard extends StatefulWidget {
  final bool isEnableButton;
  const ExampleBoard({super.key, required this.isEnableButton});

  @override
  State<ExampleBoard> createState() => _ExampleBoardState();
}

class _ExampleBoardState extends State<ExampleBoard> {
  final List<BoardListModel> _listData = [
    BoardListModel(
      count: 100,
      name: 'ALL',
      items: List.generate(
        114,
        (index) => BoardItemModel.stub(),
      ),
    ),
    BoardListModel(
      count: 11,
      name: 'TODO',
      items: List.generate(100, (index) => BoardItemModel.stub()),
    ),
    BoardListModel(count: 4, name: 'IN PROGRESS', items: [
      // BoardItemModel.stub(),
      // BoardItemModel.stub(),
      // BoardItemModel.stub(),
      // BoardItemModel.stub(),
    ]),
    BoardListModel(count: 6, name: 'REVIEW', items: [
      BoardItemModel.stub(),
      BoardItemModel.stub(),
      BoardItemModel.stub(),
      BoardItemModel.stub(),
      BoardItemModel.stub(),
    ]),
    BoardListModel(count: 1, name: 'DONE', items: [
      BoardItemModel.stub(),
      BoardItemModel.stub(),
      BoardItemModel.stub(),
      BoardItemModel.stub(),
      BoardItemModel.stub(),
    ]),
  ];

  //Can be used to animate to different sections of the BoardView
  BoardViewController boardViewController = BoardViewController();

  void _handleDropList(int? listIndex, int? oldListIndex) {
    //Update our local list data
    var list = _listData[oldListIndex!];
    _listData.removeAt(oldListIndex);
    _listData.insert(listIndex!, list);
  }

  void _onDroppedItem(String? taskTitle, String? newPage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$taskTitle Dropped to $newPage',
        ),
      ),
    );
  }

  void _handleCardTap(BoardItemModel item) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Item tap ${item.title}')));
    debugPrint("============> OnTap: ${item.title}");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<BoardList> lists = [];
    for (int i = 0; i < _listData.length; i++) {
      lists.add(_createBoardList(_listData[i]) as BoardList);
    }

    return BoardView(
      crossAxisCount: 4,
      isListView: widget.isEnableButton,
      isShake: true,
      width: size.width * 1,
      itemInMiddleWidget: (p0) {
        debugPrint('hello');
      },
      onDropItemInMiddleWidget: (listIndex, itemIndex, percentX) {
        debugPrint('drop Mid');
      },
      lists: lists,
      boardViewController: boardViewController,
    );
  }

  Widget _createBoardList(BoardListModel list) {
    List<BoardItem> items = [];

    Widget buildBoardItem(BoardItemModel itemObject) {
      return BoardItem(
        draggable: true,
        onStartDragItem:
            (int? listIndex, int? itemIndex, BoardItemState? state) {},
        onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
            int? oldItemIndex, BoardItemState? state) {
          //Used to update our local item data
          var item = _listData[oldListIndex!].items[oldItemIndex!];
          _listData[oldListIndex].items.removeAt(oldItemIndex);
          _listData[listIndex!].items.insert(itemIndex!, item);
          debugPrint('===========> Drop Item: ');
          _onDroppedItem(itemObject.title, _listData[listIndex].name);
        },
        onTapItem:
            (int? listIndex, int? itemIndex, BoardItemState? state) async {},
        item: BoardCard(
          item: itemObject,
          onTap: () {
            _handleCardTap(itemObject); // onTap Item
          },
        ),
      );
    }

    for (int i = 0; i < list.items.length; i++) {
      items.insert(i, buildBoardItem(list.items[i]) as BoardItem);
    }

    return BoardList(
      // backgroundColor: Colors.grey, //! Customize PageView BackgoundColor
      crossAxisCount:
          4, // if ListView == false please input crossAxisCount for GridView
      isListView: widget.isEnableButton,
      onTapList: (listIndex) {
        debugPrint('=========> onTap listIndex: $listIndex');
      },
      isShake: false,
      draggable: true,
      onDropList: _handleDropList,
      header: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            list.name,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ],
      items: items,
    );
  }
}
