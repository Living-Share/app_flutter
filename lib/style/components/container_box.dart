import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:living_share_app/style/theme/Colors.dart';
import 'package:living_share_app/style/theme/Text.dart';

class DoWorkContainer extends StatelessWidget {
  final String title;
  final String user_name;
  final bool isDoWork;
  final dynamic context;
  final dynamic events;
  final void Function() refreshData;

  const DoWorkContainer({
    Key? key,
    required this.title,
    required this.user_name,
    required this.isDoWork,
    required this.context,
    required this.events,
    required this.refreshData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              width: Get.width,
              padding: const EdgeInsets.fromLTRB(45.0, 24, 45.0, 0),
              decoration: const BoxDecoration(
                color: Colors.white, // 모달 배경색
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0), // 모달 좌상단 라운딩 처리
                  topRight: Radius.circular(10.0), // 모달 우상단 라운딩 처리
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "오늘의 일을 확인하고 완료하세요.",
                    style: TextStyle(
                      fontFamily: 'Pretendart',
                      fontSize: 24.0,
                      color: ThemeColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        final homework = events[index];
                        return ThemeContainer(
                          id: homework["id"],
                          title: homework['event'],
                          user_name: homework['user_name'],
                          isDoWork: homework['doevent'] == 0 ? false : true,
                          context: context,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ).then((value) {
          refreshData();
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: Get.width, // 100%
              padding: const EdgeInsets.fromLTRB(24, 25, 0, 25),
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isDoWork ? ThemeColors.primary : ThemeColors.falseRed,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // 그림자 색상
                    spreadRadius: 2, // 그림자 확산 정도
                    blurRadius: 5, // 그림자 흐림 정도
                    offset: const Offset(0, 3), // 그림자 위치 (x, y)
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.doWorkContainer_title,
                  ),
                  Row(
                    children: [
                      ClipOval(
                        child: Container(
                          width: 23, // 원의 지름과 같은 값으로 설정
                          height: 23, // 원의 지름과 같은 값으로 설정
                          color: Colors.blue, // 프로필 박스의 배경색
                          child: Image.network(
                            '', // 이미지 URL
                            width: 25, // 이미지의 너비
                            height: 25, // 이미지의 높이
                            fit: BoxFit.cover, // 이미지를 박스에 맞추기 위해 cover 사용
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        user_name,
                        style: TextStyles.doWorkContainer_name.copyWith(
                          color: Colors.white, // 텍스트의 색상
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeContainer extends StatefulWidget {
  final int id;
  final String title;
  final String user_name;
  final bool isDoWork;
  final dynamic context;

  const ThemeContainer({
    Key? key,
    required this.id,
    required this.title,
    required this.user_name,
    required this.isDoWork,
    required this.context,
  }) : super(key: key);

  @override
  _ThemeContainerState createState() => _ThemeContainerState();
}

class _ThemeContainerState extends State<ThemeContainer> {
  bool _switchValue = false; // Initialize with a default value

  final dio = Dio();

  @override
  void initState() {
    super.initState();
    _switchValue =
        widget.isDoWork; // Initialize _switchValue from widget property
  }

  @override
  Widget build(BuildContext context) {
    void _toggleSwitch(bool value) async {
      setState(() {
        _switchValue = value;
      });

      try {
        final response = await dio.put(
          'http://localhost:3000/homeworks/${widget.id}/doEvent',
          data: {'doevent': value ? 1 : 0},
        );
        print('Response: ${response.data}');
      } catch (e) {
        print('Error: $e');
      }
    }

    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: Get.width, // 100%
            padding: const EdgeInsets.fromLTRB(24, 25, 25, 25),
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: ThemeColors.white,
              border: Border.all(
                color: _switchValue
                    ? ThemeColors.primary
                    : ThemeColors.falseRed, // border color
                width: 2.0, // border width
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.title,
                          style: TextStyles.doWorkContainer_title.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            ClipOval(
                              child: Container(
                                width: 23, // 원의 지름과 같은 값으로 설정
                                height: 23, // 원의 지름과 같은 값으로 설정
                                color: Colors.blue, // 프로필 박스의 배경색
                                child: Image.network(
                                  '', // 이미지 URL
                                  width: 25, // 이미지의 너비
                                  height: 25, // 이미지의 높이
                                  fit: BoxFit.cover, // 이미지를 박스에 맞추기 위해 cover 사용
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              widget.user_name,
                              style: TextStyles.doWorkContainer_name.copyWith(
                                color: Colors.black, // 텍스트의 색상
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Switch(
                      value: _switchValue,
                      activeColor: ThemeColors.primary, // true일 때 색상
                      inactiveThumbColor:
                          ThemeColors.falseRed, // false일 때 버튼 색상
                      onChanged: _toggleSwitch,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
