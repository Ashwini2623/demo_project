import 'package:flutter/material.dart';
import 'package:project_code/shared/widgets/listtile_widget.dart';
import 'package:project_code/views/home_page/pod/home_pod.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<HomePage> {
  HomePageProvider provider = HomePageProvider();
  @override
  void initState() {
    super.initState();
    provider = context.read<HomePageProvider>();

    provider.sampleApi();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(builder: (_, p, c) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Home Page'),
          ),
          body: SafeArea(
              child: Container(
            child: p.ifLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: p.homedata.length,
                    itemBuilder: ((_, i) {
                      return Card(
                        child: Column(
                          children: [
                            RowWithListTileWidget(
                              title: 'Category Name',
                              subTitle:
                                  p.homedata[i].contestCategoryName.toString(),
                            ),
                            RowWithListTileWidget(
                              title: 'Joining Fee Amount',
                              subTitle: p.homedata[i].joiningFee.toString(),
                            ),
                            RowWithListTileWidget(
                              title: 'First Winning Amount',
                              subTitle:
                                  p.homedata[i].firstWinningAmt.toString(),
                            ),
                            RowWithListTileWidget(
                              title: 'Total Winners',
                              subTitle: p.homedata[i].totalWinners.toString(),
                            ),
                          ],
                        ),
                      );
                    })),
          )));
    });
  }
}
