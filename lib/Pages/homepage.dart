import 'package:chat_app_with_data_analysis/Pages/chats_page.dart';
import 'package:chat_app_with_data_analysis/Pages/status_page.dart';
import 'package:chat_app_with_data_analysis/Pages/calls_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  //For the swapping of the pages in the navigation bar
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).hintColor,

      //APP BAR!!!
      appBar: AppBar(
        //title of the appBar
        title: SafeArea(
          child: Text(
            "ChatHive",
            style: GoogleFonts.poppins(
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        backgroundColor: Theme.of(context).hintColor,

        //icons
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          ),

          // IconButton(
          //     onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))

          //POPUP MENU BUTTON
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                  child: Text("New group",
                      style: Theme.of(context).textTheme.bodyMedium)),
              PopupMenuItem(
                  child: Text("New Broadcast",
                      style: Theme.of(context).textTheme.bodyMedium)),
              PopupMenuItem(
                  child: Text("Linked Devices",
                      style: Theme.of(context).textTheme.bodyMedium)),
              PopupMenuItem(
                  child: Text("Starred Messages",
                      style: Theme.of(context).textTheme.bodyMedium)),
              PopupMenuItem(
                  child: Text("Settings",
                      style: Theme.of(context).textTheme.bodyMedium)),
            ];
          }),
        ],
      ),

      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          ChatsPage(),
          StatusPage(),
          CallsPage(),
        ],
      ),

      //BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        //iconSize , selected item and background color
        iconSize: 24,
        selectedItemColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).hintColor,

        //for the size of the unselected text
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),

        //for the size of the selected text
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
          _pageController.jumpToPage(value);
        },

        //icons and names at the bottom of the screen
        items: const [
          BottomNavigationBarItem(
            label: 'Chats',
            icon: Icon(Icons.chat_bubble_outline),
          ),
          BottomNavigationBarItem(
            label: 'Status',
            icon: Icon(Icons.camera_alt_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Calls',
            icon: Icon(Icons.call),
          ),
        ],
      ),
    );
  }
}
