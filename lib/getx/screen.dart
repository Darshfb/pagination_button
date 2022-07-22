import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination/getx/controller.dart';

class GetScreen extends StatelessWidget {
  GetScreen({Key? key}) : super(key: key);
  RightController control = Get.put(RightController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: IconButton(
            onPressed: () {
              control.fetch(isFirstPage: true);
            },
            icon: const Icon(Icons.add)),
        actions: [
          IconButton(
              onPressed: () {
                control.fetch();
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [
          GetBuilder<RightController>(
            builder: (GetxController controller) {
              return Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index)=> Column(children: [
                      Text(control.list[index]['id'].toString()),
                      Text(control.list[index]['title']),
                    ]),
                    separatorBuilder: (context, index)=> Divider(),
                    itemCount: control.list.length),
              );
            },
          ),
          MaterialButton(
            height: 45,
            minWidth: double.infinity,
            color: Colors.teal,
            onPressed: () {
              control.fetch();
            },
            child: Text('Load More'),
          )

        ],
      ),
    );
  }
}
