import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/add_post.dart';
import 'package:instagram/screens/home.dart';
import 'package:instagram/screens/profile.dart';
import 'package:instagram/screens/search.dart';
import 'package:instagram/shared/colors.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobile Screen"),
      ),
      bottomNavigationBar: CupertinoTabBar(
          backgroundColor: mobileBackgroundColor,
          onTap: (index) {
            // navigate to the tabed page
            _pageController.jumpToPage(index);
            setState(() {
              currentPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: currentPage == 0 ? primaryColor : secondaryColor),
              // label: "Home"
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: currentPage == 1 ? primaryColor : secondaryColor,
              ),
              // label: "Search"
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color: currentPage == 2 ? primaryColor : secondaryColor,
              ),
              // label: "Add Post"
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: currentPage == 3 ? primaryColor : secondaryColor,
              ),
              // label: "Favorite"
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: currentPage == 4 ? primaryColor : secondaryColor,
              ),
              // label: "Profile"
            ),
          ]),
      body: PageView(
        // onPageChanged: (index) {}
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          const Home(),
          const Search(),
          const AddPost(),
          const Center(
              child: Text(
            "❤",
            style: TextStyle(color: Colors.red, fontSize: 200),
          )),
          Profile(uiddd: FirebaseAuth.instance.currentUser!.uid),
        ],
      ),
    );
  }
}
