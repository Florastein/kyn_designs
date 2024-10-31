import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/custom/navbar.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(255, 248, 193, 1.0),
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Navbar(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Text(
                      "OUR SERVICES",
                      style: GoogleFonts.rubikWetPaint(
                          fontSize: 28, color: Colors.red),
                    ),
                  ),
                  ServiceList(),
                ],
              ),
              Text(
                "Gallery",
                style: GoogleFonts.poppins(color: Colors.red),
              )
            ],
          ),
          Align(
            alignment: AlignmentDirectional(0.98, 0.63),
            child: Image.asset(
              "gallery/size.jpg",
              width: MediaQuery.of(context).size.width * 20 / 100,
              height: MediaQuery.of(context).size.width * 90 / 100,
              fit: BoxFit.contain,
            ),
          ),
        ]),
      ),
    );
  }
}

class ServiceList extends StatelessWidget {
  const ServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Expanded(
          child: Flexible(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "T-Shirt Printing",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Picture Printing",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Result Checking",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Online Registration",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rubber Stamp",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                Text(
                  "Picture Enlargement",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                Text(
                  "Instant Passport Picture",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                Text(
                  "Sign Post / Board",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bussiness Card",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Bronchures",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Posters / Flyers",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Banners / Flexy",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PVC ID Card Printing",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                Text(
                  "Book Binding",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                Text(
                  "Receipt / Invoice",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                Text(
                  "Invitation cards",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lamination",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Scanning",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Label",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Branding",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Graphic Design",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                Text(
                  "Type & Printing",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                Text(
                  "Photocopy",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                Text(
                  "Mug Printing",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Certificates",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Large Format Printing",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Indenture",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Silk  Screen Development",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Etc...",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

/*class MyDropRegion extends StatelessWidget {
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
*/
