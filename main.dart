import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Calculator"),
            ),
            body: MyWidget(),
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  //khai báo biên nhận gtri input
  final TextEditingController textController1 = TextEditingController();
  final TextEditingController textController2 = TextEditingController();
  double dataResult = double
      .infinity; //gán 1 số vô hạn, khi thay đổi giá trị trong wid thì nó sẽ nhận gtri mới
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            TextField(
              controller: textController1,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ], //chỉ cho phép nhập số
              keyboardType:
                  TextInputType.number, //kiểu bàn phím khi tick vào ô input
              // obscureText: true, //password
              cursorColor: Colors.red, //màu của trỏ
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    //hiển thị icon ở trước hint, nếu muốn ở sau: dùng suffixIcon
                    Icons.calculate,
                    color: Colors.red,
                  ),
                  // suffixIcon: Icon(Icons.remove_red_eye),
                  hintText: "Input number 1: ",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: textController2,
              keyboardType:
                  TextInputType.number, //kiểu bàn phím khi tick vào ô input
              // obscureText: true, //password
              cursorColor: Colors.red, //màu của trỏ
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    //hiển thị icon ở trước hint, nếu muốn ở sau: dùng suffixIcon
                    Icons.calculate,
                    color: Colors.red,
                  ),
                  // suffixIcon: Icon(Icons.remove_red_eye),
                  hintText: "Input number 2: ",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //khi ấn + text1 nhận giá trị từ num1
                      String text1 = textController1.text.toString();
                      String text2 = textController2.text.toString();

                      if (text1.isEmpty || text2.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Vui lòng nhâp dữ liệu")));
                        return; //không cần trường hợp else
                      }
                      double so1 = double.parse(text1);
                      double so2 = double.parse(text2);
                      //khi muốn thay đổi giá trị -> đổi thành stateFul
                      //đặt giá trị thay đổi trong setState(({...})
                      setState(() {
                        dataResult = (so1 + so2);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 8, 75, 190),
                        minimumSize: const Size(70, 50)),
                    child: const Text(
                      "+",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                ElevatedButton(
                    onPressed: () {
                      String text1 = textController1.text.toString();
                      String text2 = textController2.text.toString();

                      if (text1.isEmpty || text2.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Vui lòng nhâp dữ liệu")));
                        return; //không cần trường hợp else
                      }
                      double so1 = double.parse(text1);
                      double so2 = double.parse(text2);
                      setState(() {
                        dataResult = (so1 - so2);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 8, 75, 190),
                        minimumSize: const Size(70, 50)),
                    child: const Text(
                      "-",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                ElevatedButton(
                    onPressed: () {
                      String text1 = textController1.text.toString();
                      String text2 = textController2.text.toString();

                      if (text1.isEmpty || text2.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Vui lòng nhâp dữ liệu")));
                        return; //không cần trường hợp else
                      }
                      double so1 = double.parse(text1);
                      double so2 = double.parse(text2);
                      setState(() {
                        dataResult = (so1 * so2);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 8, 75, 190),
                        minimumSize: const Size(70, 50)),
                    child: const Text(
                      "*",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                ElevatedButton(
                    onPressed: () {
                      String text1 = textController1.text.toString();
                      String text2 = textController2.text.toString();

                      if (text1.isEmpty || text2.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Vui lòng nhâp dữ liệu")));
                        return; //không cần trường hợp else
                      }
                      double so1 = double.parse(text1);
                      double so2 = double.parse(text2);
                      if (text2 == "0") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Vui lòng nhập số thứ 2 khác 0")));
                        return;
                      }
                      setState(() {
                        dataResult = (so1 / so2);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 8, 75, 190),
                        minimumSize: const Size(70, 50)),
                    child: const Text(
                      "/",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Text(
                dataResult == double.infinity ? "" : "Kết quả: $dataResult",
                style: const TextStyle(
                    backgroundColor: Colors.blue,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
