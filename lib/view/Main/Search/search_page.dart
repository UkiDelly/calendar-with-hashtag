import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //
  TextEditingController searchController = TextEditingController();

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // exit icon
            Align(
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                padding: const EdgeInsets.all(0),
                onPressed: () => Navigator.of(context).pop(),
                child: Icon(
                  CupertinoIcons.multiply_circle,
                  size: 40,
                  color: Colors.grey.shade500,
                ),
              ),
            ),

            // 검색 text
            const Text(
              "검색",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),

            //
            const SizedBox(
              height: 5,
            ),

            // search field
            CupertinoTextField(
              padding: const EdgeInsets.all(10),
              controller: searchController,
              prefix: const Padding(
                padding: EdgeInsets.fromLTRB(10.0, 5, 5, 5),
                child: Icon(CupertinoIcons.search),
              ),
              placeholder: "제목, 위치, URL 및 메모",
              decoration: BoxDecoration(
                  color: const Color(0xfff4f4f4),
                  borderRadius: BorderRadius.circular(20)),
            ),

            //
            const SizedBox(
              height: 40,
            ),

            // search history
            Row(
              children: const [
                // histroy icon
                Icon(
                  Icons.history,
                  size: 30,
                ),

                //
                SizedBox(
                  width: 10,
                ),

                // 최근 검색
                Text(
                  "최근 검색",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),

                //
                Spacer(),

                // erase search history
                Icon(Icons.cancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
