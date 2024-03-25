TODU: This is a custom Flutter widget that can create a draggable BoardView or also known as a kanban. The view can be reordered with drag and drop.
[![pub package](https://img.shields.io/pub/v/boardview.svg)](https://pub.dev/packages/drag_and_drop_with_pageview)

# Description

This is a custom Flutter widget that can create a draggable BoardView or also known as a kanban. The view can be reordered with drag and drop.

## Example

<p>
<img src = "https://github.com/Tinut-Chan/Drag_and_Drop/blob/main/asset/listview.gif?raw=true", width = "270">
<img src = "https://github.com/Tinut-Chan/Drag_and_Drop/blob/main/asset/gridview.gif?raw=true" , width = "270">
</p>

### BoardView

The BoardView class takes in a List of BoardLists. It can also take in a BoardViewController which is can be used to animate to positions in the BoardView

``` dart

BoardViewController boardViewController = BoardViewController();

BoardView(
      crossAxisCount: 4,
      isListView: widget.isEnableButton, // check listview or gridview
      isShake: true, // check shake when holding
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

```

### BoardList

The BoardList has several callback methods for when it is being dragged. The header item is a Row and expects a List<Widget> as its object. The header item on long press will begin the drag process for the BoardList.

``` dart

    BoardList(
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

```

### BoardItem

The BoardItem view has several callback methods that get called when dragging. A long press on the item field widget will begin the drag process.

``` dart

   BoardItem(
        draggable: true,
        onStartDragItem:
            (int? listIndex, int? itemIndex, BoardItemState? state) {
          isAutoPlay = !isAutoPlay;
          setState(() {});
        },
        onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
            int? oldItemIndex, BoardItemState? state) {
          //Used to update our local item data
          var item = _listData[oldListIndex!].items[oldItemIndex!];
          _listData[oldListIndex].items.removeAt(oldItemIndex);
          _listData[listIndex!].items.insert(itemIndex!, item);
          debugPrint('===========> Drop Item: ');
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
