import 'package:flutter/material.dart';
import 'package:flutter_chart/molecules/gradient_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class WeightChart extends StatefulWidget {
  const WeightChart({Key? key}) : super(key: key);

  @override
  _WeightChartState createState() => _WeightChartState();
}

class _WeightChartState extends State<WeightChart> {

  late List<WeightData> data;

  get chartSeriesController => null;

  @override
  void initState() {
    data = [];
    chartSeriesController?.updateDataSource(
      addedDataIndexes: <int>[data.length - 1],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ChartSeriesController? chartSeriesController;
    final TextEditingController weight = TextEditingController();
    return Expanded(
            child: Column(
                children: <Widget> [
                  Expanded(child: SfCartesianChart(series: <ChartSeries>[
                    LineSeries<WeightData, double>(
                      dataSource: data,
                      xValueMapper: (WeightData weight, _) => weight.day,
                      yValueMapper: (WeightData weight, _) => weight.weight,
                      dataLabelSettings: const DataLabelSettings(isVisible: true),
                      onRendererCreated: (ChartSeriesController controller) {
                        chartSeriesController = controller;
                      },
                    )
                  ],
                    primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                    title: ChartTitle(text: 'Изменение веса'),
                  )
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: weight,
                    decoration: const InputDecoration(
                      hintText: 'Введите ваш текущий вес',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return value;
                    },
                  ),
                  TextButton(
                    child: GradientText(
                      'Добавить вес',
                      style: const TextStyle(color: Colors.grey, fontSize: 14.0),
                      gradient: LinearGradient(colors: [
                        Colors.blue.shade300,
                        Colors.blue.shade400,
                      ]),
                    ),
                    onPressed: () {
                      data.add(WeightData(double.parse(weight.text), data.length.toDouble() + 1));
                      weight.text = '';
                      chartSeriesController?.updateDataSource(
                        addedDataIndexes: <int>[data.length - 1],
                      );
                    },
                  ),
                ]
            )
    );
  }

  List<WeightData> getWeightData(){
    final List<WeightData> data = [
    ];
    return data;
  }
}

class WeightData {
  WeightData(this.weight, this.day);
  final double weight;
  final double day;
}
