import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;
  List<BottomTabs> bottomTabs = [
    BottomTabs(
      icon: CupertinoIcons.house_fill,
      action: () {},
    ),
    BottomTabs(
      icon: CupertinoIcons.heart,
      action: () {},
    ),
    BottomTabs(
      icon: CupertinoIcons.cart,
      action: () {},
    ),
    BottomTabs(
      icon: CupertinoIcons.person,
      action: () {},
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: const Color(0xFFf4f6f7),
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 70,
                            height: 70,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/user.jpeg'),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.bell,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(text: 'Choose\n'),
                            TextSpan(text: 'Your Favorite '),
                            TextSpan(
                              text: 'Food ',
                              style: TextStyle(
                                color: Color(0xFF9d090f),
                              ),
                            ),
                          ],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              height: 70,
                              child: TextField(
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(CupertinoIcons.search),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Search...',
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 25.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton.filled(
                            onPressed: () {},
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Color(0xFF9d090f),
                              ),
                              padding:
                                  WidgetStatePropertyAll(EdgeInsets.all(20)),
                            ),
                            icon: const Icon(
                              Icons.filter_list_outlined,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              bottomNavigationArea(width, bottomTabs),
            ],
          ),
        ),
      ),
    );
  }

  Positioned bottomNavigationArea(double width, List<BottomTabs> bottomTabs) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: width - 20,
          decoration: BoxDecoration(
            color: const Color(0xFF9d090f),
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              bottomTabs.length,
              (index) => IconButton(
                onPressed: bottomTabs[index].action,
                icon: Icon(
                  bottomTabs[index].icon,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomTabs {
  final IconData icon;
  final void Function() action;

  BottomTabs({required this.icon, required this.action});
}
