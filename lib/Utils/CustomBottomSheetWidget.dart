import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  final String text;
  final List<String> items;

  const BottomSheetWidget({super.key, required this.text, required this.items});

  @override
  _MultiSelectListViewState createState() => _MultiSelectListViewState();
}

class _MultiSelectListViewState extends State<BottomSheetWidget> {
  Set<String> selectedItems = Set<String>();

    @override
  void initState() {
    super.initState();
    if (widget.items.isNotEmpty) {
      selectedItems.add(widget.items.first);
    }
  }


  void onItemTap(String item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final item = widget.items[index];
              final isSelected = selectedItems.contains(item);
              return GestureDetector(
                onTap: () => onItemTap(item),
                child: Container(
                  width: 110,decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isSelected ? Colors.blue[300] : Colors.white,
                      ),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: Center(
                    child: Text(
                      item,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
