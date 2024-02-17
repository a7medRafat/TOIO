import 'package:flutter/cupertino.dart';
import 'package:TOIO/view/widgets/tasks/task_item.dart';

class TaskList extends StatelessWidget {

  const TaskList({super.key, required this.listName, required this.listLength});
  final List <Map<String,dynamic>> listName;
  final int listLength;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => BuildTaskItem(
          context: context,
          model: listName[index],
        ),
        separatorBuilder: (context, index) =>
        const SizedBox(height: 5),
        itemCount: listLength);
  }
}
