import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/custom/navbar.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 248, 193, 1.0),
        body: Column(
          children: [
            Navbar(),
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'images/servicebg.jpg',
                    width: MediaQuery.of(context).size.height * 80 / 100,
                  ),
                ),
                Align(alignment: Alignment.centerLeft, child: Former())
              ],
            )
          ],
        ));
  }
}

class Former extends StatefulWidget {
  const Former({super.key});

  @override
  State<Former> createState() => _FormerState();
}

/*class _FormerState extends State<Former> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(40),
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Job Description",
              style: GoogleFonts.montserrat(),
            ),
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.orange, style: BorderStyle.solid)),
                hintText: "Describe Your Order"),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Number of Copies:",
                style: GoogleFonts.montserrat(),
              ),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              )
            ],
          )
        ],
      ),
    );
  }
}*/

class _FormerState extends State<Former> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(40),
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Job Description",
            style: GoogleFonts.montserrat(),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.orange,
                  style: BorderStyle.solid,
                ),
              ),
              hintText: "Describe Your Order",
            ),
            maxLines: 3,
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Number of Copies:",
                style: GoogleFonts.montserrat(),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
          MyDropRegion()
        ],
      ),
    );
  }
}

class MyDropRegion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropRegion(
      // Formats this region can accept.
      formats: Formats.standardFormats,
      hitTestBehavior: HitTestBehavior.opaque,
      onDropOver: (event) {
        // You can inspect local data here, as well as formats of each item.
        // However on certain platforms (mobile / web) the actual data is
        // only available when the drop is accepted (onPerformDrop).
        final item = event.session.items.first;
        if (item.localData is Map) {
          // This is a drag within the app and has custom local data set.
        }
        if (item.canProvide(Formats.plainText)) {
          // this item contains plain text.
        }
        // This drop region only supports copy operation.
        if (event.session.allowedOperations.contains(DropOperation.copy)) {
          return DropOperation.copy;
        } else {
          return DropOperation.none;
        }
      },
      onDropEnter: (event) {
        // This is called when region first accepts a drag. You can use this
        // to display a visual indicator that the drop is allowed.
      },
      onDropLeave: (event) {
        // Called when drag leaves the region. Will also be called after
        // drag completion.
        // This is a good place to remove any visual indicators.
      },
      onPerformDrop: (event) async {
        // Called when user dropped the item. You can now request the data.
        // Note that data must be requested before the performDrop callback
        // is over.
        final item = event.session.items.first;

        // data reader is available now
        final reader = item.dataReader!;
        if (reader.canProvide(Formats.plainText)) {
          reader.getValue<String>(Formats.plainText, (value) {
            if (value != null) {
              // You can access values through the `value` property.
              print('Dropped text: ${value}');
            }
          }, onError: (error) {
            print('Error reading value $error');
          });
        }

        if (reader.canProvide(Formats.png)) {
          reader.getFile(Formats.png, (file) {
            // Binary files may be too large to be loaded in memory and thus
            // are exposed as stream.
            final stream = file.getStream();

            // Alternatively, if you know that that the value is small enough,
            // you can read the entire value into memory:
            // (note that readAll is mutually exclusive with getStream(), you
            // can only use one of them)
            // final data = file.readAll();
          }, onError: (error) {
            print('Error reading value $error');
          });
        }
      },
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Text('Drop items here'),
      ),
    );
  }
}
