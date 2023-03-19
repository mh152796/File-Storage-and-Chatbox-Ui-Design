import 'package:chat_app_ui_design/pages/project.dart';
import 'package:flutter/material.dart';

class TeamFolderPage extends StatefulWidget {
  const TeamFolderPage({Key? key}) : super(key: key);

  @override
  State<TeamFolderPage> createState() => _TeamFolderPageState();
}

class _TeamFolderPageState extends State<TeamFolderPage> {
  double availableScreenWidth = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery.of(context).size.width - 50;
    //print(availableScreenWidth);
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            height: 170,
            decoration: BoxDecoration(color: Colors.blue.shade800),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Riotters",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Team Folder",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 28,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.notifications,
                          size: 28,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Storage",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: "9.1/10GB",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ))
                    ],
                  ),
                ),
                Text(
                  "Upgrade",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                buildFileSizeChart("Sources", Colors.blue, .3),
                SizedBox(
                  width: 2,
                ),
                buildFileSizeChart("Docs", Colors.red, .25),
                SizedBox(
                  width: 2,
                ),
                buildFileSizeChart("Images", Colors.yellow, .20),
                SizedBox(
                  width: 2,
                ),
                buildFileSizeChart("", Colors.grey, .23),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            height: 20,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(25),
              children: [
                Text(
                  "Recently updated",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    buildFileColumn('sketch', 'desktop', '.sketch'),
                    SizedBox(
                      width: availableScreenWidth * .03,
                    ),
                    buildFileColumn('sketch', 'mobile', '.sketch'),
                    SizedBox(
                      width: availableScreenWidth * .03,
                    ),
                    buildFileColumn('prd', 'interaction', '.prd'),
                  ],
                ),
                const Divider(
                  height: 60,
                ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("Projects ",
                     style: TextStyle(
                       color: Colors.black,
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                     ),
                     ),
                     Text("Create new ",
                     style: TextStyle(
                       color: Colors.blue,
                       fontSize: 16,
                       fontWeight: FontWeight.bold,
                     ),
                     ),
                   ],
                 ),
                SizedBox(height: 20,),
                buildProjectRow("Chatbox"),
                buildProjectRow("TimeNote"),
                buildProjectRow("Something"),
                buildProjectRow("Other"),
              ],
            ),
          ),

        ],
      ),
     floatingActionButton: Container(
       decoration: BoxDecoration(
         shape: BoxShape.circle,
         boxShadow: [
           BoxShadow(color: Colors.white, spreadRadius: 7,blurRadius: 1),
         ],
       ),
       child: FloatingActionButton(
         onPressed: () {},
         child: Icon(Icons.add),
       ),
     ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: "Time"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Folder"),
        ],
      ),
    );
  }

  Column buildFileSizeChart(String title, Color color, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: availableScreenWidth * width,
          height: 4,
          color: color,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Column buildFileColumn(String image, String filename, String extension) {
    return Column(
      children: [
        Container(
          width: availableScreenWidth * .31,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(38),
          height: 110,
          child: Image.asset('assets/images/$image.png'),
        ),
        const SizedBox(
          height: 15,
        ),
        RichText(
          text: TextSpan(
              text: filename,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text: extension,
                  style: const TextStyle(
                    color: Colors.grey,
                     fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
              ]),
        ),
      ],
    );
  }

 Widget buildProjectRow(String folderName) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProjectPage(folderName: folderName),)),
      child: Container(
        height: 65,
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.folder, color: Colors.blue[200],),
                SizedBox(width: 12,),
                Text(folderName, style: TextStyle(fontSize: 16,
                ),)
              ],
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_vert_rounded,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
 }
}
