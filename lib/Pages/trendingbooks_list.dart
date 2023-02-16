import 'dart:math';

import 'package:bookadda/Pages/individualbookdetails.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'allbookListPage.dart';

// THIS WIDGET CONTAINS FETCHED DATA FROM THE GOOGLE BOOKS API
// THAT IS INHIBITED IN THE LISTVIEW

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  //GET REQUEST

  Future<List> getRequest() async {
    //replace your restFull API here.

    String url =
        "https://www.googleapis.com/books/v1/volumes?q=apps&maxResults=20";

    final response = await http.get(Uri.parse(url)); // PARSING

    var responseData =
        json.decode(response.body); // IT LIKE MAPPING BY DECODING JSON

    //Creating a list to store input data;
    responseData = responseData["items"];

    return responseData;
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();

    // FUTURE BUILDER
    return FutureBuilder(
      future: getRequest(),
      builder: (BuildContext ctx, AsyncSnapshot snapshot) {
        // print(snapshot.data);
        if (snapshot.data == null) {
          return Container(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Column(
            children: [
              // USING 3-LISTVIEW IN HORIZONTAL
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text(
                        "Recommended for You",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xff645CBB),
                        ),
                      ),
                      Text(
                        "Based On your Reading History",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xff645CBB),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Color(0xff645CBB),
                    ),
                    onPressed: () {
                      // ROUTE TO LIST OF BOOKS PAGE
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookList()),
                      );
                    },
                  ),
                ],
              ),
              // LISTVIEW IN HORIZONTAL
              SizedBox(
                height: 45.h,
                width: double.infinity,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (ctx, index) => Card(
                    elevation: 50,
                    shadowColor: Colors.blue,
                    color: const Color(0xff645CBB),
                    child: Column(
                      children: [
                        //FETCHING FROM THE API USING SNAPSHOT.DATA

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: const Color(0xffA084DC),
                            radius: 80,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(snapshot.data[index]
                                          ["volumeInfo"]["imageLinks"]
                                      ["thumbnail"] ??
                                  "https://www.heyuguys.com/images/2012/08/Life-of-Pi-Poster.jpg"), //NetworkImage
                              radius: 75,
                            ), //CircleAvatar
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          // snapshot.data[index]["volumeInfo"]["title"],
                          snapshot.data[index]["volumeInfo"]["title"].length >
                                  15
                              ? snapshot.data[index]["volumeInfo"]["title"]
                                      .substring(0, 15) +
                                  '...'
                              : snapshot.data[index]["volumeInfo"]["title"],
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffEBC7E6),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          // ignore: prefer_interpolation_to_compose_strings
                          "Rs." + (100 + random.nextInt(500)).toString(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xffEBC7E6),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookDetails(
                                        details: snapshot.data[index]
                                            ["volumeInfo"],
                                      )),
                            );
                          },
                          // ignore: sort_child_properties_last
                          child: const Center(child: Text("Read Now !")),
                          style: TextButton.styleFrom(
                              foregroundColor: const Color(0xff645CBB),
                              elevation: 2,
                              backgroundColor: const Color(0xffEBC7E6)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text(
                        "New Releases !!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xff645CBB),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Color(0xff645CBB),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookList()),
                      );
                    },
                  ),
                ],
              ),
              Container(
                height: 45.h,
                width: double.infinity,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (ctx, index) => Card(
                    elevation: 50,
                    shadowColor: const Color(0xffEBC7E6),
                    color: const Color(0xff645CBB),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: const Color(0xffEBC7E6),
                            radius: 80,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(snapshot
                                          .data[index + 6]["volumeInfo"]
                                      ["imageLinks"]["thumbnail"] ??
                                  "https://www.heyuguys.com/images/2012/08/Life-of-Pi-Poster.jpg"), //NetworkImage
                              radius: 75,
                            ), //CircleAvatar
                          ),
                        ),
                        Text(
                          snapshot.data[index + 6]["volumeInfo"]["title"]
                                      .length >
                                  15
                              ? snapshot.data[index + 6]["volumeInfo"]["title"]
                                      .substring(0, 15) +
                                  '...'
                              : snapshot.data[index + 6]["volumeInfo"]["title"],
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffEBC7E6),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          // ignore: prefer_interpolation_to_compose_strings
                          "Rs." + (100 + random.nextInt(500)).toString(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xffEBC7E6),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookDetails(
                                        details: snapshot.data[index + 6]
                                            ["volumeInfo"],
                                      )),
                            );
                          },
                          // ignore: sort_child_properties_last
                          child: const Center(child: Text("Read Now !")),
                          style: TextButton.styleFrom(
                              foregroundColor: const Color(0xff645CBB),
                              elevation: 2,
                              backgroundColor: const Color(0xffEBC7E6)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text(
                        "Top Selling !!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xff645CBB),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Color(0xff645CBB),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookList()),
                      );
                    },
                  ),
                ],
              ),
              Container(
                height: 45.h,
                width: double.infinity,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (ctx, index) => Card(
                    elevation: 50,
                    shadowColor: const Color(0xffEBC7E6),
                    color: const Color(0xff645CBB),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: const Color(0xffEBC7E6),
                            radius: 80,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  // if image is null
                                  snapshot.data[index + 11]["volumeInfo"]
                                          ["imageLinks"]["thumbnail"] ??
                                      "https://www.heyuguys.com/images/2012/08/Life-of-Pi-Poster.jpg"), //NetworkImage
                              radius: 75,
                            ), //CircleAvatar
                          ),
                        ),
                        Text(
                          // snapshot.data[index + 6]["volumeInfo"]["title"],
                          snapshot.data[index + 11]["volumeInfo"]["title"]
                                      .length >
                                  15
                              ? snapshot.data[index + 11]["volumeInfo"]["title"]
                                      .substring(0, 15) +
                                  '...'
                              : snapshot.data[index + 11]["volumeInfo"]
                                  ["title"],
                          // snapshot.data[index].title,

                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffEBC7E6),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        // SizedBox(
                        //   height: 1.h,
                        // ),
                        Text(
                          "Rs." + (100 + random.nextInt(500)).toString(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xffEBC7E6),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookDetails(
                                        details: snapshot.data[index + 11]
                                            ["volumeInfo"],
                                      )),
                            );
                          },
                          child: const Center(child: Text("Read Now !")),
                          style: TextButton.styleFrom(
                              foregroundColor: const Color(0xff645CBB),
                              elevation: 2,
                              backgroundColor: const Color(0xffEBC7E6)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
