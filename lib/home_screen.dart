import 'package:auto_route/auto_route.dart';
import 'package:custom_animations/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TodoModel {
  const TodoModel({
    required this.label,
    required this.isCompleted,
  });
  final String label;
  final bool isCompleted;
}

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final GlobalKey<AnimatedListState> _animatedListKey = GlobalKey();
  static List<TodoModel> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink.withOpacity(0.6),
        title: const Text('ToDo'),
        actions: [
          IconButton(
              onPressed: () {
                context.pushRoute(const DetailRoute());
              },
              icon: const Icon(
                Icons.book_outlined,
                size: 30,
              ))
        ],
      ),
      body:
          // tasks.isEmpty
          //     ? Center(
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Lottie.asset(
          //               'assets/lottie/empty_list.json',
          //             ),
          //             const SizedBox(height: 10),
          //             const Text(
          //               'No Tasks Yet',
          //               style: TextStyle(
          //                 fontSize: 30,
          //                 fontWeight: FontWeight.w700,
          //               ),
          //             ),
          //           ],
          //         ),
          //       )
          //     :
          AnimatedList(
        key: _animatedListKey,
        initialItemCount: tasks.length,
        itemBuilder: (context, index, animation) {
          return buildItem(
            tasks[index],
            animation,
            index,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Widget buildItem(
    TodoModel task,
    Animation<double> animation,
    int index,
  ) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          title: Text(task.label),
          onLongPress: () => removeItem(index),
          contentPadding: const EdgeInsets.all(8),
        ),
      ),
    );
  }

  void removeItem(int index) async {
    final removedTask = tasks.removeAt(index);
    _animatedListKey.currentState!.removeItem(
      index,
      (context, animation) => buildItem(
        removedTask,
        animation,
        index,
      ),
    );
  }

  void addTask() async {
    TodoModel newTask = TodoModel(
      label: 'New Task ${tasks.length + 1}',
      isCompleted: false,
    );
    tasks.add(newTask);
    _animatedListKey.currentState!.insertItem(tasks.length - 1);
  }
}
