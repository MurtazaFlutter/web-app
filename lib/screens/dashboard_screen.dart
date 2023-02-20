import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final textList = ['Daily', 'Weekly', 'Monthly'];
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Statistics',
                          style: GoogleFonts.urbanist(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            ...List.generate(
                                textList.length,
                                (index) => textWidget(
                                      index: index,
                                      text: textList[index],
                                    ))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Upcoming Appointements',
                              style: GoogleFonts.urbanist(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  'See All',
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Colors.blue),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Upcoming \nEvent',
                                  style: GoogleFonts.urbanist(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ...List.generate(
                                          5, (index) => upcomingEvents())
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: height * 0.3,
                              child: SfCalendar(
                                view: CalendarView.timelineWeek,
                                firstDayOfWeek: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row upcomingEvents() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Client XY',
        ),
        Row(
          children: const [Icon(Icons.cancel), Icon(Icons.more_horiz)],
        )
      ],
    );
  }

  Container textWidget({required String text, required int index}) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: selectedIndex == index ? Colors.grey.withOpacity(0.1) : null,
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.urbanist(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: selectedIndex == index ? Colors.blue : Colors.grey),
        ),
      ),
    );
  }
}
