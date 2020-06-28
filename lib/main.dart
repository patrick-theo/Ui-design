import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

final Color backgroundColor = Color(0xFF4A4A58);
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuDashboardPage(),
    );
  }
}

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;
  bool car = false;
  final first = [
    'T',
    'S',
    'P',
  ];

  final places = [
    'Tirmulala Veg',
    'Sambara Fast food',
    'Polar Bear',
  ];
  final cost = [
    '₹508L',
    '₹232L',
    '₹122L',
  ];
  final order = [
    'Order ID 1',
    'Order ID 2',
    'Order ID 2',
  ];
  final color = [Colors.green[700], Colors.red[100], Colors.purple[200]];
  final code = [
    ' KA 01 M 2211',
    ' KA 23 M 2401',
    ' KA 01 M 4212',
  ];
  int _radioValue;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          dashboard(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
       showUnselectedLabels: true,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black38,
        onTap: onTab,
        currentIndex: _currentIndex,

       
        items: [
          BottomNavigationBarItem(
            
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              "Home",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.trending_up,
            ),
            title: Text(
              "Trip",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            title: Text(
              "Driver",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_shipping,
            ),
            title: Text(
              "Vehicle",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.my_location,
            ),
            title: Text(
              "Track",
            ),
          ),
        ],
      ),
    );
  }

  void onTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          
         
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 17, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                          child: Column(
                        children: <Widget>[
                          Text(
                            "Good morning,",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black26),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Text('Kukujah Sanjaya',
                                style: TextStyle(fontSize: 21)),
                          ),
                        ],
                      )),
                      Padding(padding: EdgeInsets.only(left: 65)),
                      Stack(
                        children: <Widget>[
                          Icon(
                            Icons.notifications,
                            size: 38,
                          ),
                          new Positioned(
                            right: 0,
                            child: new Container(
                              padding: EdgeInsets.all(1),
                              decoration: new BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 15,
                                minHeight: 15,
                              ),
                              child: new Text(
                                '10',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(left: 12)),
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/man.jpg'),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 250,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage('assets/credit2.jpg'),
                                  fit: BoxFit.cover)),
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 30, top: 20),
                                    child: Text(
                                      "Earnings",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 90, top: 20),
                                    child: Image(
                                      image: AssetImage('assets/white.png'),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 80),
                              Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: Text(
                                  "Net Profits Of March 2020",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black38),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: Text(
                                  "₹6000",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage('assets/credit.jpg'),
                                  fit: BoxFit.cover)),
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 30, top: 20),
                                    child: Text(
                                      "Earnings",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 90, top: 20),
                                    child: Image(
                                      image: AssetImage('assets/white.png'),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 80),
                              Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: Text(
                                  "Net Profits Of March 2020",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.grey[200]),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: Text(
                                  "₹6000",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage('assets/credit2.jpg'),
                                  fit: BoxFit.cover)),
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 30, top: 20),
                                    child: Text(
                                      "Earnings",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 90, top: 20),
                                    child: Image(
                                      image: AssetImage('assets/white.png'),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 80),
                              Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: Text(
                                  "Net Profits Of March 2020",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: Text(
                                  "₹6000",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Expanded(
                            child: RaisedButton(
                                onPressed: () {},
                                child: Row(
                                  children: <Widget>[
                                    Text("Mar 26,2019"),
                                    Padding(
                                      padding: EdgeInsets.only(left: 25),
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 25,
                                      ),
                                    )
                                  ],
                                ),
                                color: Colors.grey[200],
                                textColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20))))),
                        Expanded(
                          child: RaisedButton(
                              onPressed: () {},
                              child: Row(
                                children: <Widget>[
                                  Text("Apr 26,2019"),
                                  Padding(
                                    padding: EdgeInsets.only(left: 25),
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: 25,
                                    ),
                                  )
                                ],
                              ),
                              color: Colors.grey[200],
                              textColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20)))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.teal[50],
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                "Spending",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                            Text(
                              "₹2450",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.indigo[50],
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                "Income",
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                            Text(
                              "₹6532",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Orders",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          child: Text(
                            "See All",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Expanded(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: places.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  leading: Container(
                                    width: 50,
                                    height: 50,
                                    child: DecoratedBox(
                                      child: Center(
                                        child: Text(
                                          first[index],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: color[index],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                  title: Text(places[index]),
                                  onTap: () {},
                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(
                                        order[index],
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 30),
                                        child: SizedBox(
                                          width: 10,
                                          height: 10,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: color[index],
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        code[index],
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                  trailing: Column(
                                    children: <Widget>[
                                      Text(
                                        cost[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        "Apr 26",
                                        style: TextStyle(color: Colors.black38),
                                      )
                                    ],
                                  ));
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Monthly Expenses",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 300,
                      child: PageView(
                        controller: PageController(viewportFraction: 0.8),
                        scrollDirection: Axis.horizontal,
                        pageSnapping: true,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.indigo[50]),
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                        padding:
                                            EdgeInsets.only(left: 30, top: 20),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Image.asset(
                                            'assets/Petrol.jpg',
                                            width: 75,
                                            height: 75,
                                          ),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.only(left: 120, top: 5),
                                        child: Icon(Icons.more_horiz)),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    "Fuel",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "AVG spent ",
                                        style: TextStyle(
                                            color: Colors.black26,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "₹24,000 ",
                                        style: TextStyle(
                                            color: Colors.blue[800],
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "a week",
                                        style: TextStyle(
                                            color: Colors.black26,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: new LinearPercentIndicator(
                                    width:
                                        MediaQuery.of(context).size.width - 250,
                                    animation: true,
                                    lineHeight: 20.0,
                                    animationDuration: 2000,
                                    percent: 0.45,
                                    leading: Text("2.00L"),
                                    trailing: Text("3.00L"),
                                    linearStrokeCap: LinearStrokeCap.roundAll,
                                    progressColor: Colors.yellowAccent,
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 30, top: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Radio(
                                          value: 0,
                                          groupValue: _radioValue,
                                          onChanged: _handleRadioValueChange,
                                        ),
                                        Text(
                                          "Your fuel budget is on a\ngood condition",
                                          style:
                                              TextStyle(color: Colors.black26),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.indigo[50]),
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                        padding:
                                            EdgeInsets.only(left: 30, top: 20),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Image.asset(
                                            'assets/gov.jpg',
                                            width: 75,
                                            height: 75,
                                          ),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.only(left: 120, top: 5),
                                        child: Icon(Icons.more_horiz)),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    "Government",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "AVG spent ",
                                        style: TextStyle(
                                            color: Colors.black26,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "₹24,000 ",
                                        style: TextStyle(
                                            color: Colors.blue[800],
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "a week",
                                        style: TextStyle(
                                            color: Colors.black26,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: new LinearPercentIndicator(
                                    width:
                                        MediaQuery.of(context).size.width - 250,
                                    animation: true,
                                    lineHeight: 20.0,
                                    animationDuration: 2000,
                                    percent: 0.6,
                                    leading: Text("4.0L"),
                                    trailing: Text("2.50L"),
                                    linearStrokeCap: LinearStrokeCap.roundAll,
                                    progressColor: Colors.redAccent,
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 30, top: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Radio(
                                          value: 0,
                                          groupValue: _radioValue,
                                          onChanged: _handleRadioValueChange,
                                        ),
                                        Text(
                                          "Your Government budget is \nincreasing",
                                          style:
                                              TextStyle(color: Colors.black26),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: 500,
                      width: 500,
                      color: Colors.blue[700],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 30, top: 30),
                            child: Text(
                              "Reminder",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                              padding: (EdgeInsets.only(left: 10, top: 30)),
                              child: Container(
                                height: 350,
                                width: 350,
                                child: PageView(
                                  controller:
                                      PageController(viewportFraction: 0.8),
                                  scrollDirection: Axis.horizontal,
                                  pageSnapping: true,
                                  children: <Widget>[
                                    Container(
                                      height: 150,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 3,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.indigo[50]),
                                      width: 150,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20, top: 20),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    child: Image.asset(
                                                      'assets/setting.png',
                                                      width: 75,
                                                      height: 75,
                                                    ),
                                                  )),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 120, top: 5),
                                                  child:
                                                      Icon(Icons.more_horiz)),
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                          Padding(
                                            padding: EdgeInsets.only(left: 25),
                                            child: Text(
                                              "Reminder 4",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: EdgeInsets.only(left: 25),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  "Service on ",
                                                  style: TextStyle(
                                                      color: Colors.black26,
                                                      fontSize: 15),
                                                ),
                                                Text(
                                                  "26 Apr ",
                                                  style: TextStyle(
                                                      color: Colors.blue[800],
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 25),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    "₹24,000 ",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    "Last invoice amt ",
                                                    style: TextStyle(
                                                      color: Colors.black26,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, top: 20),
                                              child: SizedBox(
                                                width: 225,
                                                height: 50,
                                                child: RaisedButton(
                                                  child: Center(
                                                    child: Text(
                                                      "Vehicle Renewal",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  color: Colors.blue[300],
                                                  onPressed: () {},
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 150,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.indigo[50]),
                                      width: 150,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20, top: 20),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    child: Image.asset(
                                                      'assets/setting.png',
                                                      width: 75,
                                                      height: 75,
                                                    ),
                                                  )),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 120, top: 5),
                                                  child:
                                                      Icon(Icons.more_horiz)),
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                          Padding(
                                            padding: EdgeInsets.only(left: 25),
                                            child: Text(
                                              "Reminder 3",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: EdgeInsets.only(left: 25),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  "Service on ",
                                                  style: TextStyle(
                                                      color: Colors.black26,
                                                      fontSize: 15),
                                                ),
                                                Text(
                                                  "26 Apr ",
                                                  style: TextStyle(
                                                      color: Colors.blue[800],
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 25),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    "₹24,000 ",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    "Last invoice amt ",
                                                    style: TextStyle(
                                                      color: Colors.black26,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, top: 20),
                                              child: SizedBox(
                                                width: 225,
                                                height: 50,
                                                child: RaisedButton(
                                                  child: Center(
                                                    child: Text(
                                                      "Subscribe",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  color: Colors.blue[300],
                                                  onPressed: () {},
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
