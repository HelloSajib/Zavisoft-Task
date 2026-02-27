import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// =============================================================================
//  MANDATORY EXPLANATION (as required by the task)
// =============================================================================
//
// 1. How horizontal swipe was implemented:
//    → Standard TabBar + TabBarView (uses horizontal PageView internally).
//      Default gesture priority: horizontal drag wins when gesture starts horizontally.
//      No custom GestureDetector / recognizers needed → clean & predictable.
//
// 2. Who owns the vertical scroll and why:
//    → ExtendedNestedScrollView with onlyOneScrollInBody: true owns the single vertical scroll chain.
//      Only one inner scroll position is active at a time (the visible tab).
//      Header slivers + body content are coordinated into exactly one coherent vertical scrollable.
//      This is currently the only reliable way in Flutter to combine:
//        • collapsible header
//        • pinned tab bar
//        • horizontal tab swipe
//        • literally one vertical scrollable
//
// 3. Trade-offs / limitations:
//    - Relies on extended_nested_scroll_view package (well-maintained, widely used for e-commerce UIs)
//    - Without this package + onlyOneScrollInBody: true it is impossible to satisfy
//      "exactly ONE vertical scrollable" + "horizontal swipe" at the same time.
//    - Dummy data used provisionally (easy to replace with FakeStore API later)
//    - Meets every other requirement: reliable pull-to-refresh, preserved position on tab switch,
//      no jitter/conflicts, sliver-based header, clean separation
//
// =============================================================================

class HomePage extends HookWidget {
  static const String path = "/home";
  static const String name = "home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 3);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text("Daraz Style Listing"),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline_rounded),
            tooltip: "User Profile",
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Logged in as Guest (Demo)")),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ExtendedNestedScrollView(
          onlyOneScrollInBody: true,  // ← enforces exactly ONE vertical scrollable
          physics: const ClampingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            // Collapsible banner / search area
            SliverToBoxAdapter(
              child: _buildBanner(),
            ),

            // Sticky / pinned TabBar
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarDelegate(
                TabBar(
                  controller: tabController,
                  labelColor: Colors.orange.shade800,
                  unselectedLabelColor: Colors.black54,
                  indicatorColor: Colors.orange.shade600,
                  indicatorWeight: 4,
                  labelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  tabs: const [
                    Tab(text: "All"),
                    Tab(text: "Electronics"),
                    Tab(text: "Fashion"),
                  ],
                ),
              ),
            ),
          ],

          // Body: each tab has preserved scroll + refresh
          body: TabBarView(
            controller: tabController,
            children: const [
              ProductTab(tabId: "all"),
              ProductTab(tabId: "electronics"),
              ProductTab(tabId: "fashion"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      height: 180,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade600, Colors.deepOrange.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "FLASH SALE",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            "Up to 80% OFF – Limited Time!",
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: Colors.white,
      elevation: overlapsContent ? 2 : 0,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) => tabBar != oldDelegate.tabBar;
}

// ────────────────────────────────────────────────
//  Product Tab – dummy data + keep-alive + refresh
// ────────────────────────────────────────────────
class ProductTab extends StatefulWidget {
  final String tabId;

  const ProductTab({super.key, required this.tabId});

  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> with AutomaticKeepAliveClientMixin<ProductTab> {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


  // Dummy products (30 items – same pool for all tabs)
  final List<Map<String, dynamic>> _products = List.generate(30, (i) {
    final titles = [
      "Wireless Earbuds Pro",
      "Smart Fitness Watch",
      "Men's Casual T-Shirt",
      "Running Sneakers",
      "Travel Backpack 40L",
      "Bluetooth Speaker",
    ];
    return {
      'title': "${titles[i % titles.length]} ${i + 1}",
      'price': 19.99 + (i * 4.5),
      'image': 'https://picsum.photos/seed/prod${i + 1}/140/140',
      'rating': 4.0 + (i % 9) * 0.1,
    };
  });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Hello >>>>>>>>>${widget.tabId}");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        // Simulate refresh delay
        await Future.delayed(const Duration(seconds: 1, milliseconds: 300));
        if (mounted) setState(() {});
      },
      color: Colors.orange.shade700,
      backgroundColor: Colors.white,
      child: CustomScrollView(
        //key: PageStorageKey<String>("scroll_${widget.tabId}"),
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 40),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final p = _products[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 1,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {}, // → product detail later
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                p['image'],
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported, size: 60),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    p['title'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "\$${p['price'].toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green.shade700,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.star_rounded, size: 16, color: Colors.amber.shade700),
                                      const SizedBox(width: 4),
                                      Text(
                                        p['rating'].toStringAsFixed(1),
                                        style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: _products.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
