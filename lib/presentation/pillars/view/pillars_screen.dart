import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart' as localized;
import 'package:flutter/material.dart';
import '../../../../../app/resources/resources.dart';


class PillarsScreen extends StatefulWidget {
  PillarsScreen({Key? key}) : super(key: key);

  @override
  State<PillarsScreen> createState() => _PillarsScreenState();
}

class _PillarsScreenState extends State<PillarsScreen> {
  int currentPage = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    _pageController = PageController(initialPage: currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.pillars.tr(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: FontSize.s18),
        ),
      ),
      body: Container(
        width: size.width,
        margin: EdgeInsets.symmetric(
            vertical: AppMargin.m20 * 1.6, horizontal: AppMargin.m8),
        child: Stack(
          children: [
            PageView.builder(
                controller: _pageController,
                onPageChanged: (pos) {
                  setState(() {
                    currentPage = pos;
                  });
                },
                itemCount: AppStrings.pillarsstring.length,
                itemBuilder: (context, index) {
                  return _buildpillarview(
                      image: ImageAsset.pillarsimgd[index],
                      description: AppStrings.pillarsstring[index]);
                }),
            Positioned(
              bottom: AppSize.s35,
              left: 0,
              right: 0,
              child: _dotsindicator(
                _pageController.hasClients ? _pageController.page?.round() : 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildpillarview({required String image, required String description}) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: AppPadding.p16),
            height: AppSize.s200 * 1.3,
            width: AppSize.s200 * 1.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.fill)),
          ),

          Container(
            height: AppSize.s200 * 1.6,
            width: AppSize.s200 * 1.5,
            child: Text(
              description,
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
            ),
          ),
        ],
      ),
    );
  }

  _dotsindicator(int? dotsindex) {
    return DotsIndicator(
      dotsCount: 5,
      position: dotsindex!,
      decorator: DotsDecorator(color: Colors.amber, activeColor: Colors.green),
    );
  }
}
