import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:living_share_app/style/components/app_bar.dart';
import 'package:living_share_app/style/components/navigationBar.dart';
import 'package:living_share_app/style/theme/Colors.dart';

class ScheduleRegistration extends StatefulWidget {
  const ScheduleRegistration({super.key});

  @override
  _ScheduleRegistrationState createState() => _ScheduleRegistrationState();
}

class _ScheduleRegistrationState extends State<ScheduleRegistration> {
  int _selectedIndex = 0; // 선택된 컨테이너 인덱스

  final TextEditingController eventController = TextEditingController();
  final TextEditingController dayController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildSelectableContainer(0, "일정 등록"),
                SizedBox(width: 10),
                _buildSelectableContainer(1, "집안일"),
              ],
            ),
            SizedBox(
              height: Get.height * 0.06,
            ),
            const CustomTextLabel(label: "어떤 일인가요?"),
            CustomTextField(
              controller: eventController,
              hint: "ex) 부모님 방문",
            ),
            const SizedBox(
              height: 10.0,
            ),
            const CustomTextLabel(label: "언제 오나요?"),
            CustomTextField(
              controller: dayController,
              hint: "ex) 2024-06-29",
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            const CustomTextLabel(label: "시간을 작성해 주세요."),
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: startTimeController,
                    decoration: InputDecoration(
                      labelText: "10:00",
                      labelStyle: const TextStyle(
                        color: ThemeColors.n_02,
                      ), // labelText 색 변경
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0), // 둥근 모서리
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ThemeColors.black, // 검은색 테두리
                        ),
                        borderRadius: BorderRadius.circular(5.0), // 둥근 모서리
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ThemeColors.black, // 포커스 상태에서 검은색 테두리
                        ),
                        borderRadius: BorderRadius.circular(5.0), // 둥근 모서리
                      ),
                    ),
                    obscureText: false,
                    style: const TextStyle(
                      color: ThemeColors.black,
                    ), // 입력된 글자 색 변경
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text("~"),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: endTimeController,
                    decoration: InputDecoration(
                      labelText: "22:00",
                      labelStyle: const TextStyle(
                        color: ThemeColors.n_02,
                      ), // labelText 색 변경
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0), // 둥근 모서리
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ThemeColors.black, // 검은색 테두리
                        ),
                        borderRadius: BorderRadius.circular(5.0), // 둥근 모서리
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ThemeColors.black, // 포커스 상태에서 검은색 테두리
                        ),
                        borderRadius: BorderRadius.circular(5.0), // 둥근 모서리
                      ),
                    ),
                    obscureText: false,
                    style: const TextStyle(
                      color: ThemeColors.black,
                    ), // 입력된 글자 색 변경
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                print('${eventController.text}');
                print('${dayController.text}');
                print('${startTimeController.text}');
                print('${endTimeController.text}');
                print('선택된 인덱스: $_selectedIndex');
              },
              child: Container(
                width: Get.width,
                height: 50.0,
                decoration: const BoxDecoration(
                  color: ThemeColors.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "등록하기",
                    style: TextStyle(
                      color: ThemeColors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }

  Widget _buildSelectableContainer(int index, String text) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index; // 클릭한 컨테이너 인덱스를 저장
        });
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 9, 12, 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: _selectedIndex == index ? Color(0xFF85E657) : Colors.grey,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Pretendart',
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            color: ThemeColors.white,
          ),
        ),
      ),
    );
  }
}

class CustomTextLabel extends StatelessWidget {
  final String label;

  const CustomTextLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontFamily: 'Pretendart',
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        color: ThemeColors.black,
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const CustomTextField({required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: const TextStyle(
          color: ThemeColors.n_02,
        ), // labelText 색 변경
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0), // 둥근 모서리
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ThemeColors.black, // 검은색 테두리
          ),
          borderRadius: BorderRadius.circular(5.0), // 둥근 모서리
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ThemeColors.black, // 포커스 상태에서 검은색 테두리
          ),
          borderRadius: BorderRadius.circular(5.0), // 둥근 모서리
        ),
      ),
      obscureText: false,
      style: const TextStyle(
        color: ThemeColors.black,
      ), // 입력된 글자 색 변경
    );
  }
}
