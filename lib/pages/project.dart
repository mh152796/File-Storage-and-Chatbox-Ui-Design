import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  final String folderName;


  const ProjectPage({required this.folderName, super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            height: 170,
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chatbox",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Project",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.05),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 28,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.05),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.share,
                          size: 28,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
     //Header Done

          Container(
            padding: EdgeInsets.only(left: 25, top: 25),
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildAvatar('Mia', 'mia'),
                buildAvatar('Adam', 'adam'),
                buildAvatar('Jess', 'jess'),
                buildAvatar('Mike', 'mike'),
                buildAvatar('Brandon', 'brandon'),
                buildAvatar('Alie', 'alie'),
                buildAvatar('Mia', 'mia'),
                buildAvatar('Adam', 'adam'),
                buildAvatar('Jess', 'jess'),
                buildAvatar('Mike', 'mike'),
                buildAvatar('Brandon', 'brandon'),
                buildAvatar('Alie', 'alie'),
              ],
            ),
          ),
          Divider(),
          //Chat Image Avatar building Done
          
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(25),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Files",
                      style: TextStyle(
                      color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                    ),
                    ),
                    Text(
                      "Create new",
                      style: TextStyle(
                      color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),

                 buildFileRow("Assets", true),
                 buildFileRow("Brandbook", false),
                 buildFileRow("Design", false),
                 buildFileRow("Moodboard", false),
                 buildFileRow("Other", false),

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

 Widget buildAvatar(String name, String filename) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: Image.asset('assets/images/$filename.jpeg').image,
          ),
          SizedBox(height: 8,),
          Text(name,style:
          TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),),
          
        ],
      ),
    );
  }

 Container buildFileRow(String folderName, bool showAlert) {
    return Container(
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
              Stack(
                  children: [
                    Icon(Icons.folder, color: Colors.blue[200],),
                    if(showAlert)
                    Positioned(
                      right: -1,
                      top: 2,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                        ),
                        child: CircleAvatar(
                          radius: 3.5,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    )
                  ]
              ),
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
    );
  }
}
