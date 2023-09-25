import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:tradings/app/view/res/custom_textstyles.dart';
import '../../res/my_colors.dart';
import 'components/action_buttons.dart';
import 'components/course_container.dart';
import 'components/price_indicator_overlay.dart';
import 'data/models/content/courses.dart';

class SimulatorPage extends StatefulWidget {
  const SimulatorPage({Key? key}) : super(key: key);

  @override
  State<SimulatorPage> createState() => _SimulatorPageState();
}

class _SimulatorPageState extends State<SimulatorPage> {
  int selectedCourse = 0;
  List<CandleData> candles = [];
  late Timer timer;
  bool isUp = true;
  double currentPrice = 0.0;
  double initialBalance = 100000.0;
  double balance = 100000.0;
  int selectedTimeOptionIndex = 2;
  int selectedPriceOptionIndex = 2;
  final listOfCourses = Courses.listOfCourses;
  late double _min = listOfCourses[selectedCourse].min;
  late double _max = listOfCourses[selectedCourse].max;
  final List<int> listOfSeconds = [90, 60, 30];
  final List<int> listOfAmounts = [5000, 2500, 1000];
  double? playPrice;
  final countDownController = CountdownController(autoStart: true);

  @override
  void initState() {
    super.initState();
    initBalance();
    candles = generateRandomCandles(50, _min, _max);
    currentPrice = candles.last.close ?? 0;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updateData();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Simulator',
                      style: CustomTextStyles.customTextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      'Balance: \$ ${balance.toStringAsFixed(2)}',
                      style: CustomTextStyles.customTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    listOfCourses.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCourse = index;
                          _max = listOfCourses[selectedCourse].max;
                          _min = listOfCourses[selectedCourse].min;
                          candles = generateRandomCandles(50, _min, _max);
                          currentPrice = candles.last.close ?? 0;
                        });
                      },
                      child: CourseContainer(
                        image: listOfCourses[index].image,
                        name: listOfCourses[index].title,
                        price: selectedCourse == index
                            ? currentPrice
                            : listOfCourses[index].max,
                        index: index,
                        isSelected: selectedCourse == index,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    InteractiveChart(
                      candles: candles,
                      initialVisibleCandleCount: 30,
                      style: const ChartStyle(
                        volumeHeightFactor: 0,
                        priceGainColor: Colors.green,
                        priceLossColor: Colors.red,
                        priceLabelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      priceLabel: (price) => '',
                      overlayInfo: (c) => {},
                      timeLabel: (_, __) => '',
                    ),
                    PriceIndicatorOverlay(
                      price: currentPrice,
                      height: 400,
                      chartHeight: 200,
                    ),
                  ],
                ),
              ),
              playPrice == null
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ActionButtons(
                            onUp: () {
                              setState(() {
                                isUp = true;
                                playPrice = currentPrice;
                                balance -=
                                    listOfAmounts[selectedPriceOptionIndex];
                                setBalanceToLocalData();
                              });
                            },
                            onDown: () {
                              setState(() {
                                isUp = false;
                                playPrice = currentPrice;
                                balance -=
                                    listOfAmounts[selectedPriceOptionIndex];
                                setBalanceToLocalData();
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showPriceOptions(context);
                                },
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Amount: ',
                                        style: CustomTextStyles.customTextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w400,
                                          color: MyColors.grey,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '\$${listOfAmounts[selectedPriceOptionIndex]}',
                                        style: CustomTextStyles.customTextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            textDecoration:
                                                TextDecoration.underline),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showTimeOptions(context);
                                },
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Time: ',
                                        style: CustomTextStyles.customTextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w400,
                                          color: MyColors.grey,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '${listOfSeconds[selectedTimeOptionIndex]} s',
                                        style: CustomTextStyles.customTextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            textDecoration:
                                                TextDecoration.underline),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Countdown(
                      controller: countDownController,
                      seconds: listOfSeconds[selectedTimeOptionIndex],
                      build: (ctx, value) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              secondsToTimeString(value.toInt() + 1),
                              style: CustomTextStyles.customTextStyle(
                                fontSize: 42,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            Text(
                              'Bet price: ${playPrice!.toStringAsFixed(2)}',
                              style: CustomTextStyles.customTextStyle(
                                fontSize: 20,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            Text(
                              'Bet amount: ${listOfAmounts[selectedPriceOptionIndex]} \$',
                              style: CustomTextStyles.customTextStyle(
                                fontSize: 20,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            Text(
                              'Bet direction: ${isUp ? 'Up' : 'Down'}',
                              style: CustomTextStyles.customTextStyle(
                                fontSize: 20,
                                color: isUp ? MyColors.green : MyColors.red,
                              ),
                            ),
                          ],
                        );
                      },
                      onFinished: () {
                        if (isUp) {
                          if (playPrice! < currentPrice) {
                            final perc = calculatePercentageDifference(
                              playPrice!,
                              currentPrice,
                            );
                            final result = calculatePercentageAddition(
                              listOfAmounts[selectedPriceOptionIndex],
                              perc,
                            );

                            setState(() {
                              balance += result;
                              playPrice = null;
                            });
                            setBalanceToLocalData();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: MyColors.green,
                                content: Text(
                                    'You win: ${result.toStringAsFixed(2)}'),
                              ),
                            );
                          } else {
                            playPrice = null;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: MyColors.red,
                                content: Text(
                                    'You lose ${listOfAmounts[selectedPriceOptionIndex]}\$'),
                              ),
                            );
                          }
                        } else {
                          if (playPrice! > currentPrice) {
                            final perc = calculatePercentageDifference(
                              playPrice!,
                              currentPrice,
                            );
                            final result = calculatePercentageAddition(
                              listOfAmounts[selectedPriceOptionIndex],
                              perc,
                            );

                            setState(() {
                              balance += result;
                              playPrice = null;
                            });
                            setBalanceToLocalData();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: MyColors.green,
                                content: Text(
                                    'You win: ${result.toStringAsFixed(2)}'),
                              ),
                            );
                          } else {
                            playPrice = null;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: MyColors.red,
                                content: Text(
                                    'You lose ${listOfAmounts[selectedPriceOptionIndex]}\$'),
                              ),
                            );
                          }
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  double calculatePercentageDifference(double oldValue, double newValue) {
    if (oldValue == 0.0) {
      if (newValue == 0.0) {
        return 0.0;
      } else {
        return 100.0;
      }
    }

    double difference = ((newValue - oldValue).abs() / oldValue) * 100.0;
    return difference;
  }

  double calculatePercentageAddition(int number, double percentage) {
    double result = number + (number * (percentage / 100.0));
    return result;
  }

  String secondsToTimeString(int seconds) {
    int minutes = (seconds / 60).floor();
    int remainingSeconds = seconds % 60;

    String minutesStr = (minutes < 10) ? '0$minutes' : '$minutes';
    String secondsStr =
        (remainingSeconds < 10) ? '0$remainingSeconds' : '$remainingSeconds';

    return '$minutesStr:$secondsStr';
  }

  List<CandleData> generateRandomCandles(int count, double min, double max) {
    List<CandleData> candles = [];
    for (int i = 0; i < count; i++) {
      double open = min + (max - min) * i / count;
      double high = open + (max - min) * (i + 0.3) / count;
      double low = open - (max - min) * (i + 0.3) / count;
      double close = open + (max - min) * (i + 0.6) / count;
      double volume = (1000 + i * 10).toDouble();
      CandleData candle = CandleData(
        open: open,
        high: high,
        low: low,
        close: close,
        volume: volume,
        timestamp: 1,
      );
      candles.add(candle);
    }
    return candles;
  }

  void updateData() {
    double changePercentage = isUp ? 0.01 : -0.01;
    currentPrice = currentPrice +
        (currentPrice * changePercentage * (Random().nextBool() ? 1 : -1));
    double lastClose = candles.last.close ?? 0;
    double open = lastClose;
    double high = open + (open * 0.01 * (Random().nextBool() ? 1 : -1));
    double low = open - (open * 0.01 * (Random().nextBool() ? 1 : -1));
    double close = open + (open * 0.01 * (Random().nextBool() ? 1 : -1));
    double volume = (1000 + candles.length * 10).toDouble();
    CandleData newCandle = CandleData(
      open: open,
      high: high,
      low: low,
      close: close,
      volume: volume,
      timestamp: 1,
    );

    setState(() {
      candles.removeAt(0);
      candles.add(newCandle);
    });
  }

  setBalanceToLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('balance', balance);
  }

  initBalance() async {
    final prefs = await SharedPreferences.getInstance();
    final _balance = prefs.getDouble('balance');
    if (_balance != null) {
      setState(() {
        balance = _balance;
      });
    }
  }

  showTimeOptions(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('What time do you want to set?'),
          actions: List.generate(
            listOfSeconds.length,
            (index) => CupertinoActionSheetAction(
              onPressed: () {
                setState(() {
                  selectedTimeOptionIndex = index;
                });
                Navigator.pop(context);
              },
              child: Text('${listOfSeconds[index]}s'),
            ),
          ),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context, null);
            },
            child: Text('Cancel'),
          ),
        );
      },
    );
  }

  showPriceOptions(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('How much do you want to bet?'),
          actions: List.generate(
            listOfSeconds.length,
            (index) => CupertinoActionSheetAction(
              onPressed: () {
                setState(() {
                  selectedPriceOptionIndex = index;
                });
                Navigator.pop(context);
              },
              child: Text('\$${listOfAmounts[index]}'),
            ),
          ),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context, null);
            },
            child: Text('Cancel'),
          ),
        );
      },
    );
  }
}
