import 'package:bookadda/Pages/trendingbooks_list.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'allbookListPage.dart';

// HOME PAGE

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Sizer(builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Book-Adda",
              style: TextStyle(
                fontFamily: 'DancingScript',
              ),
            ),
            backgroundColor: const Color(0xff645CBB),
          ),
          backgroundColor: const Color(0xffEBC7E6),
          drawer: Drawer(
            //SIDE DRAWER WITH LIST-VIEW
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xff645CBB),
                  ),
                  child: Center(
                    child: Text(
                      'Book-Adda',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Ubuntu',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.book),
                  title: const Text('Book'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BookList()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.shop),
                  title: const Text('Shop'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BookList()),
                    );
                  },
                ),
              ],
            ),
          ),
          // BODY
          body: Padding(
            padding: EdgeInsets.all(10.sp),
            child: SingleChildScrollView(
              //SINGLE CHILD SCROLL VIEW STARTS
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    // TOP BUTTONS ON THE PAGE
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.h, vertical: 0.5.h)),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        margin: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.5.w, color: const Color(0xff645CBB)),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: TextButton(
                          onPressed: () {
                            // ROUTE TO LIST OF BOOKS PAGE
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BookList()),
                            );
                          },
                          child: const Text(
                            "Generes",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.h, vertical: 0.5.h)),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.5.w, color: const Color(0xff645CBB)),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: TextButton(
                          // ROUTE TO LIST OF BOOKS PAGE

                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BookList()),
                            );
                          },
                          child: const Text(
                            "Top Selling",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.h, vertical: 0.5.h)),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.5.w, color: const Color(0xff645CBB)),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: TextButton(
                          onPressed: () {
                            // ROUTE TO LIST OF BOOKS PAGE

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BookList()),
                            );
                          },
                          child: const Text(
                            "New Release",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  const SizedBox(
                    child: CardView(),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
