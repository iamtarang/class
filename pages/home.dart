import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/routes.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> _allClasses = [
    "Coaching Class",
    "Dance Class",
    "Painting Class",
    "Karate Class",
  ];

  List<String> _filteredClasses = [];
  TextEditingController _searchController = TextEditingController();
  int _currentIndex = 0;

  @override
  initState() {
    // Initially, no classes are shown
    _filteredClasses = [];
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<String> results = [];
    if (enteredKeyword.isNotEmpty) {
      results = _allClasses
          .where((className) =>
          className.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // We use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _filteredClasses = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Home",
            style: GoogleFonts.notoSerif(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 2.h,
                horizontal: 0.h,
              ),
            ),

            CarouselSlider(
              items: [

                //1st Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://images.indianexpress.com/2016/06/private-coaching-kota1200.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //2nd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://media.timeout.com/images/103592433/image.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //3rd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://i.pinimg.com/originals/c5/f9/6e/c5f96ee25e8a72d28f1ccb122229fc1b.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //4th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://i.ytimg.com/vi/800P5u2OwBU/maxresdefault.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 300.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 15 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 2.h,
                horizontal: 2.h,
              ),
            ),
            Column(
              children: [
                Container(
                  width: 330,
                  child: TextFormField(
                    controller: _searchController,
                    onChanged: _runFilter, // Call the filter function on text change
                    decoration: InputDecoration(
                      hintText: "eg: Painting Class",
                      labelStyle: GoogleFonts.baskervville(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFF6910a8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xFF6910a8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xFF6910a8),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _filteredClasses.isNotEmpty
                    ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: _filteredClasses.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(_filteredClasses[index]),
                  ),
                )
                    : SizedBox(), // Empty SizedBox when no options to show
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {

            // Handle bottom navigation item taps here
            setState(() {
              _currentIndex = index;
            });

            // Add actions for each item here
            if (index == 0) {
              Navigator.pushNamed(context,MyRoutes.homeRoute);
              // Handle Home item tap
              // You can navigate to the home screen or change content accordingly
            } else if (index == 1) {
              Navigator.pushNamed(context,MyRoutes.membershipRoute);
              // Handle Favorites item tap
              // You can navigate to the favorites screen or change content accordingly
            } else if (index == 2) {
             // Navigator.pushNamed(context,MyRoutes.profileRoute);
              // Handle Profile item tap
              // You can navigate to the profile screen or change content accordingly
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Membership',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),

      );
    });
  }

}