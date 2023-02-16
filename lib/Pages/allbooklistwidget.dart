import 'package:bookadda/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'individualbookdetails.dart';

class BookListWidget extends StatefulWidget {
  const BookListWidget({super.key});

  @override
  State<BookListWidget> createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<BookListWidget> {
  Future<List> getRequest() async {
    String url =
        "https://www.googleapis.com/books/v1/volumes?q=dogs&maxResults=20";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    responseData = responseData["items"];

    return responseData;
  }

  @override
  Widget build(BuildContext context) {
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
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 6 / 10,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 5),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                          color: Color.fromARGB(255, 113, 87, 170),
                          blurRadius: 15.0, // soften the shadow
                          // spreadRadius: 5.0, //extend the shadow
                          offset: Offset(
                            5.0, // Move to right 5  horizontally
                            5.0, // Move to bottom 5 Vertically
                          ),
                        )
                      ],
                      color: Colors.purple[50],
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(0xffEBC7E6),
                          radius: 60,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data[index]
                                    ["volumeInfo"]["imageLinks"]["thumbnail"] ??
                                "https://www.heyuguys.com/images/2012/08/Life-of-Pi-Poster.jpg"), //NetworkImage
                            radius: 58,
                          ), //CircleAvatar
                        ),
                        Text(
                          // snapshot.data[index]["volumeInfo"]["title"],
                          snapshot.data[index]["volumeInfo"]["title"].length >
                                  20
                              ? snapshot.data[index]["volumeInfo"]["title"]
                                      .substring(0, 20) +
                                  '...'
                              : snapshot.data[index]["volumeInfo"]["title"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff645CBB),
                          ),
                        ),
                        Text(
                          // INCASE TITLE IS TOO LONG

                          snapshot.data[index]["volumeInfo"]["authors"][0]
                                      .length >
                                  20
                              // ignore: prefer_interpolation_to_compose_strings
                              ? "Author :" +
                                  snapshot.data[index]["volumeInfo"]["authors"]
                                          [0]
                                      .substring(0, 20) +
                                  '...'
                              // ignore: prefer_interpolation_to_compose_strings
                              : "Author :" +
                                  snapshot.data[index]["volumeInfo"]["authors"]
                                      [0],
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff645CBB),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 5.h,
                            width: 25.w,
                            child: TextButton(
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
                              child: const Text("Read Now"),
                              style: TextButton.styleFrom(
                                  foregroundColor: const Color(0xffEBC7E6),
                                  elevation: 2,
                                  backgroundColor: const Color(0xff645CBB)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        }
      },
    );
  }
}
