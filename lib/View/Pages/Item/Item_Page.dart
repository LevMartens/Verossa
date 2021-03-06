import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Items/Presentation/Item_Factory.dart';
import 'package:verossa/Features/Items/Presentation/Widgets/Item_Page_Widget.dart';
import 'package:verossa/Features/Items/Presentation/Item_Model.dart';
import 'package:verossa/Features/Prices/Presentation/Prices_Provider.dart';
import 'package:verossa/Injection_Container.dart' as di;
import 'package:verossa/View/Widgets/App_Bar_Widget.dart';
import 'package:verossa/View/Widgets/Bottom_Section_Widget.dart';
import 'package:verossa/View/Widgets/Left_Drawer_Widget.dart';
import 'package:verossa/View/Widgets/Right_Drawer_Widget.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Free_Shipping_Banner_Widget.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Verossa_Logo.dart';

class ItemPage extends StatefulWidget {
final ItemModel itemModel;

ItemPage({this.itemModel});

  @override
  _InputPageState createState() => _InputPageState(itemModel: itemModel);
}

class _InputPageState extends State<ItemPage> {

  final _scrollController = ScrollController(keepScrollOffset: false);

   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ItemModel itemModel;

  _InputPageState({this.itemModel});


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double startScroll = kToolbarHeight + MediaQuery.of(context).padding.top;

    String priceItem1 = Provider.of<PricesProvider>(context, listen: true).priceItem1;
    String priceItem2 = Provider.of<PricesProvider>(context, listen: true).priceItem2;
    String priceItem3 = Provider.of<PricesProvider>(context, listen: true).priceItem3;
    String priceItem4 = Provider.of<PricesProvider>(context, listen: true).priceItem4;
    String priceItem5 = Provider.of<PricesProvider>(context, listen: true).priceItem5;
    String priceItem6 = Provider.of<PricesProvider>(context, listen: true).priceItem6;

    return  Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: VerossaAppBar(aScaffoldKey: _scaffoldKey,),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverFixedExtentList(
            itemExtent: 2500,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white70,
                child: Column(children: <Widget>[
                  SizedBox(height: startScroll),
                  FreeShippingBanner(),
                  SizedBox(
                    height: 20,
                  ),
                  VerossaLogo(),
                  SizedBox(height: 10),
                  ItemPageWidget(itemModel: itemModel),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text(
                        'RELATED ITEMS',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Divider(
                    indent: 32,
                    endIndent: 32,
                    color: Colors.black,
                    thickness: 0.75,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 18, left: 0.0, bottom: 13, right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('ItemPage3');

                            //_scrollController.jumpTo(0);
                          },
                          child: Container(
                            height: 170,
                            width: 163,
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  child: Container(
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image:
                                      di.sl<ItemFactory>().item3.itemImage,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 17.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        di.sl<ItemFactory>().item3.title,
                                        style: TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem3,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 18, left: 10.0, bottom: 13, right: 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('ItemPage4');
                          },
                          child: Container(
                            height: 170,
                            width: 163,
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  child: Container(
                                    height: 80,
                                    width: 163,
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: di.sl<ItemFactory>().item4.itemImage,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        di.sl<ItemFactory>().item4.title,
                                        style: TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem4,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0, left: 0.0, bottom: 13, right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('ItemPage5');
                            //_scrollController.jumpTo(0);
                          },
                          child: Container(
                            height: 200,
                            width: 163,
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  child: Container(
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: di.sl<ItemFactory>().item5.itemImage,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 17.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        di.sl<ItemFactory>().item5.title,
                                        style: TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem5,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0, left: 10.0, bottom: 13, right: 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('ItemPage6');
                          },
                          child: Container(
                            height: 200,
                            width: 163,
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  child: Container(
                                    height: 80,
                                    width: 163,
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: di.sl<ItemFactory>().item6.itemImage,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        di.sl<ItemFactory>().item6.title,
                                        style: TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem6,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  BottomSection(scrollController: _scrollController),
                ]),
              ),
            ]),
          ),
        ],
      ),
      drawer: LeftDrawer(),
      endDrawer: RightDrawer(),
    );
  }
}