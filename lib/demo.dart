import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Demo extends StatelessWidget {
  var count = 0.obs;
  var bool = false.obs;
  var min = 10.obs;
  var max = 100.obs;
  var slider = 50.0.obs;

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(child: Obx(() {
        print("obx");
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter: $count",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Get.snackbar("title", "message",
                    snackPosition: SnackPosition.TOP);
                //                 // Get.defaultDialog(
                //                 // Get.defaultDialog(
                //     title: "Title", middleText: "Congratulations");
              },
              child: Text("On Tap"),
            ),
            Switch(
              value: bool.value,
              onChanged: (value) {
                bool.value = value!;
                print(value);
              },
            ),
            Checkbox(
              value: bool.value,
              onChanged: (value) {
                bool.value = value!;
              },
            ),
            Slider.adaptive(
              value: slider.value.toDouble(),
              onChanged: (value) {
                slider.value = value;
              },
              min: min.value.toDouble(),
              max: max.value.toDouble(),
              divisions: 4,
            ),
          ],
        );
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
