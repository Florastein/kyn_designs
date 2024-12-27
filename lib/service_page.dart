/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/custom/logs_navbar.dart';
import 'package:kyn_designs/custom/navbar.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCE792C),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              //user logged in
              if (snapshot.hasData) {
                return Navbars();
              } else {
                return Navbar();
              }
            },
          ),
          Text(
            "Innovative Design Services",
            style: GoogleFonts.lexend(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 52),
          ),
          Text(
            "At KYN Designs and Technologies, we transform ideas into stunning visuals, Our dedicated team crafts\ntailor-made designs that captivate and inspire. Discover our range of high quality printing solutions that\nelevates your brand's presence.",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 22,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Text(
                  "We Offer: ",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Row(
            children: [
              BulletText("Graphic Design"),
            ],
          )
        ],
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

class BulletText extends StatelessWidget {
  final String text;

  BulletText(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Black dot bullet
        Container(
          margin: EdgeInsets.only(right: 8.0), // Spacing between dot and text
          child: Icon(
            Icons.circle, // Using a circle icon for the bullet
            size: 8.0, // Size of the bullet
            color: Colors.white, // Bullet color
          ),
        ),
        // The text itself
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.lexend(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/custom/logs_navbar.dart';
import 'package:kyn_designs/custom/navbar.dart';

class ServicePage extends StatelessWidget {
  ServicePage({super.key});

  final List<String> services = [
    "Graphics Design",
    "Result Checking",
    "Branding",
    "Business Cards",
    "Sign post / Boards",
    "Type & Printing",
    "Online Registrations",
    "Large Format Printing",
    "Brochures",
    "Indentures",
    "Photocopy",
    "Lamination",
    "PVC ID Card Printing",
    "Posters / Flyers",
    "Land Registration",
    "Mug Printing",
    "Scanning",
    "Book Binding",
    "Banners / Flexy",
    "Silk Screen Development",
    "T-Shirt Printing",
    "Certificates",
    "Receipt / Invoice",
    "Picture Enlargement",
    "Instant Picture",
    "Picture Printing",
    "Labels",
    "Invitation Cards",
    "Logo Design",
    "Etc...",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFCE792C),
      body: SingleChildScrollView(
        child: Stack(children: [
          // Padding(
          //   padding: const EdgeInsets.only(top: 30),
          //   child: Expanded(
          //     flex: 2,
          //     child: Align(
          //       alignment: Alignment.bottomRight,
          //       child: SizedBox(
          //         height: MediaQuery.of(context).size.width * 95 / 100,
          //         child: Image.asset(
          //           'gallery/size.jpg',
          //           fit: BoxFit.cover,
          //           //width: MediaQuery.of(context).size.width * 20 / 100,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    // Display Navbars based on authentication state
                    return snapshot.hasData ? Navbars() : Navbar();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.asset('gallery/3d.png'),
                      Text(
                        "Innovative Design Services",
                        style: GoogleFonts.lexend(
                          color: Colors.black26,
                          fontWeight: FontWeight.w600,
                          fontSize: 52,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "At KYN Designs and Technologies, we transform ideas into stunning visuals. Our dedicated team crafts\ntailor-made designs that captivate and inspire. Discover our range of high quality printing solutions that\n elevate your brand's presence.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Our Services",
                          style: GoogleFonts.montserrat(
                              color: Colors.black26, fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

/*class BulletText extends StatelessWidget {
  final String text;

  BulletText(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 8.0), // Spacing between dot and text
          child: Icon(
            Icons.circle,
            size: 8.0,
            color: Colors.white, // Bullet color matches background contrast
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.lexend(
              fontWeight: FontWeight.bold,
              color: Colors.black, // Adjusted to white for better contrast
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class ServiceItem extends StatelessWidget {
  final String text;
  const ServiceItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.circle,
          size: 8.0,
          color: Colors.white,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              color: text == "Etc..." ? Colors.red : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class ServicesGridList extends StatelessWidget {
  final List<String> services;
  const ServicesGridList({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // Number of columns
        childAspectRatio: 8.3, // Adjust for better text fitting
        crossAxisSpacing: 10,
        mainAxisSpacing: 40,
      ),
      itemBuilder: (context, index) {
        return ServiceItem(text: services[index]);
      },
    );
  }
}*/
