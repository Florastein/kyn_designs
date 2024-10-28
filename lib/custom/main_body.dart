/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 30, left: 80),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Elevate Your Brand \nwith KYN Designs",
                      style: GoogleFonts.poppins(
                          fontSize: 48, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 50),
                        child: Text(
                            "A journey fueled by passion since 2015, KYN Designs and Technologies began with a \nvision to transform ideas into stunning visuals, Our Founder, driven by creativity and \n and a commitment to quality, established a team that thrives on innovation\nand customer satisfaction, ensuring every project stands out."),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "Get Started",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Add submit functionality here
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: Text(
                        "Subscribe",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
*/

/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Elevate Your Brand \nwith KYN Designs",
                        style: GoogleFonts.poppins(
                            fontSize: 32, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "A journey fueled by passion since 2015, KYN Designs and Technologies began with a "
                        "vision to transform ideas into stunning visuals. Our Founder, driven by creativity "
                        "and a commitment to quality, established a team that thrives on innovation and customer "
                        "satisfaction, ensuring every project stands out.",
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "Get Started",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(width: 20),
                // Expanded(
                //   child: Column(
                //     children: [
                //       TextField(
                //         decoration: InputDecoration(
                //           labelText: "E-mail",
                //           border: OutlineInputBorder(),
                //         ),
                //       ),
                //       const SizedBox(height: 20),
                //       ElevatedButton(
                //         onPressed: () {
                //           // Add submit functionality here
                //         },
                //         style: ElevatedButton.styleFrom(
                //             backgroundColor: Colors.red),
                //         child: Text(
                //           "Subscribe",
                //           style: GoogleFonts.poppins(
                //               color: Colors.white,
                //               fontWeight: FontWeight.w600),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Elevate Your Brand \nwith KYN Designs",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth > 600 ? 48 : 32,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "A journey fueled by passion since 2015, KYN Designs and Technologies began with a "
                            "vision to transform ideas into stunning visuals. Our Founder, driven by creativity "
                            "and a commitment to quality, established a team that thrives on innovation and customer "
                            "satisfaction, ensuring every project stands out.",
                            style: GoogleFonts.poppins(
                                fontSize: screenWidth > 600 ? 18 : 14),
                          ),
                          const SizedBox(height: 30),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "Get Started",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (screenWidth >
                        600) // Show email field only on larger screens
                      const SizedBox(width: 20),
                    if (screenWidth > 600)
                      Expanded(
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: "E-mail",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Add submit functionality here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: Text(
                                "Subscribe",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
