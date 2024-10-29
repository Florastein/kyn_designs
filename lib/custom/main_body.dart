import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 50),
            child: Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Elevate Your Brand \n with KYN Designs",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800, fontSize: 42),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 95),
                    child: Text(
                      "A journey fueled by passion since 2015, KYN Designs and Technologies began with a \nvision to transform ideas into stunning visuals. Our founder, driven by creativity and \na commitment to quality, established a team that thrives on innovation and \ncustomer satisfaction, ensuring every project stands out.",
                      style: GoogleFonts.abel(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.30,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: const Offset(0, 3),
                        spreadRadius: 5,
                        blurRadius: 7)
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Get Started",
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
*/

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Elevate Your Brand \n with KYN Designs",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w800,
                    fontSize: 42,
                  ),
                ),
                const SizedBox(height: 10), // Added vertical spacing
                Padding(
                  padding: const EdgeInsets.only(left: 95),
                  child: Text(
                    "A journey fueled by passion since 2015, KYN Designs and Technologies began \nwith a vision to transform ideas into stunning visuals. Our founder, driven by \ncreativity and a commitment to quality, established a team that thrives on \ninnovation and customer satisfaction, ensuring every project stands out.",
                    style: GoogleFonts.abel(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              width:
                  MediaQuery.of(context).size.width * 0.10), // Adjusted spacing
          GestureDetector(
            onTap: () {},
            child: Card(
              color: Colors.orange,
              shadowColor: Colors.grey.withOpacity(0.4),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Get Started",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
