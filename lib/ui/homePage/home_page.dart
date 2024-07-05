import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:living_share_app/Dto/constants.dart';

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
      final response = await dio.get('$serverIp/events'); // 여기에 서버 IP 주소 사용
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
          await dio.get('$serverIp/homeworks'); // 여기에 서버 IP 주소 사용
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

  Future<void> _deleteEvent(int id) async {
    logger.d(id);
    try {
      // 서버 URL에 맞게 수정하세요
      await dio.delete('$serverIp/events/$id');

      setState(() {
        events.removeWhere((event) => event['id'] == id);
      });
      getEvents();
      Get.snackbar('삭제 완료', '이벤트가 삭제되었습니다.',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      logger.e(e);
      Get.snackbar('삭제 실패', '이벤트 삭제 중 오류가 발생했습니다.',
          snackPosition: SnackPosition.BOTTOM);
    }
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
                height: 300.0, // 이벤트 박스의 높이 조정
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.95),
                  itemCount: events.length,
                  itemBuilder: (BuildContext context, int index) {
                    final event = events[index];
                    return EventBox(
                      whoEvent: event['user_name'],
                      whatEvent: event['event'],
                      whenEvent: event['day'],
                      time: event['time'],
                      type: event['type'],
                      id: event['id'],
                      onDelete: _deleteEvent,
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
