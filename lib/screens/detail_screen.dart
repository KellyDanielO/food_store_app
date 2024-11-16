import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../models/data_models.dart';

class DetailScreen extends StatefulWidget {
  final ShopItem item;
  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late ScrollController _scrollController;
  bool _isCollapsed = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      final bool isCollapsed = _scrollController.offset >
          ((MediaQuery.sizeOf(context).height * .45) - kToolbarHeight);
      if (isCollapsed != _isCollapsed) {
        setState(() {
          _isCollapsed = isCollapsed;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  final List<String> _tabs = ['Details', 'Reviews'];
  String _selectedTab = 'Details';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: height * .45,
              floating: false,
              pinned: true,
              backgroundColor: AppColors.background,
              scrolledUnderElevation: 0,
              leading: Center(
                child: IconButton.filled(
                  onPressed: () => Navigator.pop(context),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      AppColors.white,
                    ),
                  ),
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.black,
                    size: 18,
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: _isCollapsed ? AppColors.black : AppColors.white,
                  ),
                  onPressed: () {},
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(500),
                      bottomRight: Radius.circular(500),
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Hero(
                    tag: widget.item.tag,
                    child: Image.asset(
                      widget.item.image,
                      fit: BoxFit.contain,
                      width: 350,
                      height: 350,
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.item.category,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.item.price,
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: List.generate(
                      _tabs.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = _tabs[index];
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: _selectedTab == _tabs[index]
                                ? AppColors.primaryColor
                                : AppColors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            _tabs[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: _selectedTab == _tabs[index]
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.item.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                AppColors.primaryColor,
                              ),
                              padding: const WidgetStatePropertyAll(
                                  EdgeInsets.all(20)),
                            ),
                            icon: Icon(Icons.remove, color: AppColors.white),
                          ),
                          const Text(
                            '1',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                AppColors.primaryColor,
                              ),
                              padding: const WidgetStatePropertyAll(
                                  EdgeInsets.all(20)),
                            ),
                            icon: Icon(Icons.add, color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
