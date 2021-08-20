import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mais_devagar/app/modules/core/models/config_model_box.dart';
import 'package:mais_devagar/app/modules/core/utils/sizes.dart';
import 'package:mais_devagar/app/modules/introduction/pages/indroduction_one.dart';
import 'package:mais_devagar/app/modules/introduction/pages/introduction_three.dart';
import 'package:mais_devagar/app/modules/introduction/pages/introduction_two.dart';
import 'package:mais_devagar/app/modules/introduction/widgets/indicator_pages.dart';

import '../../../objectbox.g.dart';

class IntroductionPage extends StatefulWidget {
  IntroductionPage({Key? key}) : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final PageController _pageController = PageController();
  ValueNotifier<double> indexPage = ValueNotifier(0);

  final listPages = <Widget>[
    IntroductionOne(),
    IntroductionTwo(),
    IntroductionThree()
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      indexPage.value = _pageController.page!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Sizes.maxHeight(context),
        width: Sizes.maxWidth(context),
        child: Stack(
          children: [
            Positioned.fill(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return listPages[index];
                },
              ),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                width: Sizes.maxWidth(context),
                alignment: Alignment.center,
                child: IndicatorPages(
                  pagesQuantity: listPages.length,
                  indexPage: indexPage,
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              left: Sizes.maxWidth(context) / 2 - 100 / 2,
              child: Container(
                width: 100,
                child: ValueListenableBuilder(
                  valueListenable: indexPage,
                  builder: (context, value, child) {
                    return Visibility(
                      visible: indexPage.value == 2.0,
                      replacement: SizedBox(),
                      child: ElevatedButton(
                        onPressed: () async {
                          var configStore = Modular.get<Store>();
                          var configBoxModel =
                              configStore.box<ConfigModelBox>();
                          configBoxModel.put(
                              ConfigModelBox(showIntroductionPages: false));
                          Modular.to.pushReplacementNamed('/home');
                        },
                        child: Text('Começar'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
