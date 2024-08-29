import 'package:flutter/material.dart';
import 'package:vital_health/home.dart';

class HealthReport extends StatefulWidget {
  const HealthReport({Key? key}) : super(key: key);

  @override
  _HealthReportState createState() => _HealthReportState();
}

class _HealthReportState extends State<HealthReport> {
  String _heartbeatSelectedPeriod = "Daily";
  String _bloodOxygenSelectedPeriod = "Daily";

  // Heartbeat page-specific variables
  String _heartbeatGraphImage = 'assets/images/heartgraph_daily.png';
  String _averageHeartbeat = "90";

  // Blood oxygen page-specific variables
  String _bloodOxygenGraphImage = 'assets/images/heartgraph_daily.png';
  String _averageBloodOxygen = "98";

  void _onHeartbeatPeriodSelected(String period) {
    setState(() {
      if (_heartbeatSelectedPeriod == period) {
        _heartbeatSelectedPeriod = "Daily";
        _heartbeatGraphImage = 'assets/images/heartgraph_daily.png';
        _averageHeartbeat = "90";
      } else {
        _heartbeatSelectedPeriod = period;

        switch (period) {
          case "Weekly":
            _heartbeatGraphImage = 'assets/images/heartgraph_weekly.png';
            _averageHeartbeat = "85";
            break;
          case "Monthly":
            _heartbeatGraphImage = 'assets/images/heartgraph_monthly.png';
            _averageHeartbeat = "80";
            break;
          case "Annually":
            _heartbeatGraphImage = 'assets/images/heartgraph_annually.png';
            _averageHeartbeat = "75";
            break;
        }
      }
    });
  }

  void _onBloodOxygenPeriodSelected(String period) {
    setState(() {
      if (_bloodOxygenSelectedPeriod == period) {
        _bloodOxygenSelectedPeriod = "Daily";
        _bloodOxygenGraphImage = 'assets/images/heartgraph_daily.png';
        _averageBloodOxygen = "98";
      } else {
        _bloodOxygenSelectedPeriod = period;

        switch (period) {
          case "Weekly":
            _bloodOxygenGraphImage = 'assets/images/heartgraph_weekly.png';
            _averageBloodOxygen = "97";
            break;
          case "Monthly":
            _bloodOxygenGraphImage = 'assets/images/heartgraph_monthly.png';
            _averageBloodOxygen = "96";
            break;
          case "Annually":
            _bloodOxygenGraphImage = 'assets/images/heartgraph_annually.png';
            _averageBloodOxygen = "95";
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          buildHealthPage(
            context,
            title: "Heartbeat Rate",
            graphImage: _heartbeatGraphImage,
            averageValue: _averageHeartbeat,
            metric: "Heart Rate",
            onPeriodSelected: _onHeartbeatPeriodSelected,
            selectedPeriod: _heartbeatSelectedPeriod,
          ),
          buildHealthPage(
            context,
            title: "Blood Oxygen",
            graphImage: _bloodOxygenGraphImage,
            averageValue: _averageBloodOxygen,
            metric: "Blood Oxygen",
            onPeriodSelected: _onBloodOxygenPeriodSelected,
            selectedPeriod: _bloodOxygenSelectedPeriod,
          ),
        ],
      ),
    );
  }

  Widget buildHealthPage(
    BuildContext context, {
    required String title,
    required String graphImage,
    required String averageValue,
    required String metric,
    required Function(String) onPeriodSelected,
    required String selectedPeriod,
  }) {
    return Column(
      children: [
        // Header with Navigation
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        title,
                        style: const TextStyle(fontSize: 25.0),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Icon(Icons.more_vert_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),

        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(174, 174, 199, 255),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
            ),
            padding: const EdgeInsets.all(20.0),
            
            child: Column(
              children: [
                // Row with 3 Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      title: "Week",
                      isSelected: selectedPeriod == "Weekly",
                      onPressed: () => onPeriodSelected("Weekly"),
                      buttonWidth: 110.0,
                      buttonHeight: 50.0,
                    ),
                    CustomButton(
                      title: "Month",
                      isSelected: selectedPeriod == "Monthly",
                      onPressed: () => onPeriodSelected("Monthly"),
                      buttonWidth: 110.0,
                      buttonHeight: 50.0,
                    ),
                    CustomButton(
                      title: "Year",
                      isSelected: selectedPeriod == "Annually",
                      onPressed: () => onPeriodSelected("Annually"),
                      buttonWidth: 110.0,
                      buttonHeight: 50.0,
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),

                // Display Picture
                Container(
                  padding: const EdgeInsets.all(8.0),
                  constraints: BoxConstraints(
                    maxHeight: 400.0, // Set max height for the image container
                    maxWidth: MediaQuery.of(context).size.width * 0.9, // Set max width as 90% of screen width
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.blueGrey[50],
                  ),
                  child: Image.asset(
                    graphImage,
                    fit: BoxFit.contain, // Ensure the entire image is visible
                  ),
                ),
                const SizedBox(height: 20.0),

                // Last Card with Column and Row
                Container(
                  height: 100.0,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(164, 165, 255, 1),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, // Center items in the column
                    children: [
                      Text(
                        "Average $metric Per Minute",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min, // Ensure the row only takes up as much space as needed
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 30.0,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              averageValue, // Display the dynamic health data
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Custom Button Widget
class CustomButton extends StatelessWidget {
  final String title;
  final double buttonWidth;
  final double buttonHeight;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onPressed,
    this.buttonWidth = double.infinity,
    this.buttonHeight = 40.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero, // Remove padding
          backgroundColor: isSelected
              ? const Color.fromRGBO(255, 218, 225, 1) // Pink when selected
              : const Color.fromRGBO(164, 165, 255, 1), // Purple when not selected
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown, // Ensure the text scales down to fit the button
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
