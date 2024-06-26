import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:living_share_app/style/components/app_bar.dart';
import 'package:living_share_app/style/components/container_box.dart';
import 'package:living_share_app/style/components/container_event_box.dart';
import 'package:living_share_app/style/components/navigationBar.dart';
import 'package:living_share_app/style/theme/Text.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ko', null);

    getEvents();
    getHomeWork();
  }

  List<dynamic> events = [];
  List<dynamic> homeWorks = [];

  final dio = Dio();
  var logger = Logger();

  void getEvents() async {
    try {
      final response =
          await dio.get('http://localhost:3000/events'); // 여기에 서버 IP 주소 사용
      logger.d(response.data);

      setState(() {
        events = response.data;
      });
    } catch (e) {
      logger.e(e);
    }
  }

  void getHomeWork() async {
    try {
      final homeWorksResponse =
          await dio.get('http://localhost:3000/homeworks'); // 여기에 서버 IP 주소 사용
      logger.d(homeWorksResponse.data);

      setState(() {
        homeWorks = homeWorksResponse.data;
      });
    } catch (e) {
      logger.e(e);
    }
  }

  void refreshData() {
    getHomeWork(); // 이 함수가 호출되면 getHttp() 함수가 실행됩니다.
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('MM/dd(EEE)', 'ko').format(DateTime.now());

    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(44, 0, 44, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "오늘",
                textAlign: TextAlign.start,
                style: TextStyles.main_title_100, // TextStyles는 자신의 프로젝트에 맞게 설정
              ),
              // EventBox 목록
              SizedBox(
                height: 320.0, // 이벤트 박스의 높이 조정
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: events.length,
                  itemBuilder: (BuildContext context, int index) {
                    final event = events[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: EventBox(
                        whoEvent: event['user_name'] ?? '사용자', // null 값 확인 후 기본 값 사용
                        whatEvent: event['event'] ?? '기본 이벤트',
                        whenEvent: event['day'] ?? '날짜 없음',
                        time: event['time'] ?? '시간 없음',
                        type: event['type'] ?? "이벤트",
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              // 오늘 해야할 일 섹션
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "오늘 해야할 일이에요 ⏰",
                    style:
                        TextStyles.main_title_50, // TextStyles는 자신의 프로젝트에 맞게 설정
                  ),
                  Text(
                    formattedDate,
                    style:
                        TextStyles.main_day_50, // TextStyles는 자신의 프로젝트에 맞게 설정
                  ),
                ],
              ),
              // 할 일 컨테이너
              ...homeWorks.map((homework) {
                return DoWorkContainer(
                  title: homework["event"],
                  user_name: homework["user_name"],
                  isDoWork: homework["doevent"] == 0 ? false : true,
                  context: context,
                  events: homeWorks,
                  refreshData: refreshData,
                );
              }).toList(),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
