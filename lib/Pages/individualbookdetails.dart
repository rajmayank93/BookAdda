import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  Map details;
  BookDetails({super.key, required this.details});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}
// DETAILS OF THE INDIVIDUAL BOOKS
// FETCHING DATA FROM THE API

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.details["title"] ?? "",
        ),
        backgroundColor: const Color(0xff645CBB),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffEBC7E6),
        ),
        child: Padding(
          // FETCHING THE DATA FROM THE API
          // DISPLAYING THE DETAILS ON THE WEBPAGE
          padding: const EdgeInsets.all(8.0),
          child: ListView(scrollDirection: Axis.vertical, children: [
            //  widget.details["imageLinks"]["thumbnail"]
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xff645CBB),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: const Color(0xffEBC7E6),
                  radius: 100,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(widget.details["imageLinks"]
                        ["thumbnail"]), //NetworkImage
                    radius: 90,
                  ), //CircleAvatar
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                widget.details["title"],
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff645CBB)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                // ignore: prefer_interpolation_to_compose_strings
                "Author : " + widget.details["authors"][0],
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff645CBB)),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Center(
              child: Text(
                // ignore: prefer_interpolation_to_compose_strings
                "Categories : " + widget.details["categories"][0],
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff645CBB)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                // ignore: prefer_interpolation_to_compose_strings
                "DESCRIPTION",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff674188),
                    height: 1.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                // ignore: prefer_interpolation_to_compose_strings
                widget.details["description"],
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff674188),
                    height: 1.5),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Text(widget.details["title"]),
          ]),
        ),
      ),
    );
  }
}
