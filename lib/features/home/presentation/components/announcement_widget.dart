import 'package:flutter/material.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/features/home/presentation/components/custom_carousel_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AnnouncementsWidget extends StatefulWidget {
  const AnnouncementsWidget({super.key, required this.listOfData});
  final List<Map<String, dynamic>> listOfData;

  @override
  State<AnnouncementsWidget> createState() => _AnnouncementsWidgetState();
}

class _AnnouncementsWidgetState extends State<AnnouncementsWidget> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150, // Ensuring fixed height for PageView
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.listOfData.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: double.infinity,
                  ),
                  child: CustomCarouselWidget(
                    imagePath: widget.listOfData[index]['imagePath'],
                    title: widget.listOfData[index]['title'],
                    text: widget.listOfData[index]['text'],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: widget.listOfData.length,
            effect: const ExpandingDotsEffect(
              dotColor: AppColors.primaryColor,
              dotHeight: 10,
              dotWidth: 10,
              expansionFactor: 2,
              spacing: 5.0,
              activeDotColor: AppColors.secondaryColor,
            ),
            onDotClicked: (index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ],
    );
  }
}
