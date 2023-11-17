import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controller/HomeController.dart';
import '../model/fiveDaysData.dart';

class MyChart extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 240,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries<FiveDaysData, String>>[
            SplineSeries<FiveDaysData, String>(
              dataSource: controller.fiveDaysData,
              xValueMapper: (FiveDaysData f, _) => f.dateTime,
              yValueMapper: (FiveDaysData f, _) => f.temp,
            ),
          ],
        ),
      ),
    );
  }
}
