/*import 'dart:ui';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/custom/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Navbar(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 50, right: 50),
              child: TopMan(),
            ),
          ],
        )
      ],
    );
  }
}

class Navbar extends StatefulWidget {
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final List<bool> _isHovered = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 90,
                  width: 90,
                ),
                Text(
                  "KYN DESIGNS & TECH",
                  style: GoogleFonts.poppins(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMenuItem(0, 'Home'),
                _buildMenuItem(1, 'Services'),
                _buildMenuItem(2, 'About Us'),
                _buildMenuItem(3, 'Contact'),
              ],
            ),
            Row(
              children: [
                CustomButton(
                  text: "LOG IN",
                  color: Colors.orange,
                  onPressed: () {},
                  textColor: Colors.white,
                ),
                TextButton(
                  onPressed: () {
                    // Create Account Action
                  },
                  child: Text('Create Account',
                      style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(int index, String title) {
    return MouseRegion(
      onEnter: (_) => _onHover(index, true),
      onExit: (_) => _onHover(index, false),
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(
            color: _isHovered[index] ? Colors.blue : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _onHover(int index, bool isHovered) {
    setState(() {
      _isHovered[index] = isHovered;
    });
  }
}

class TopMan extends StatelessWidget {
  TopMan({super.key});

  final List<String> items = [
    'images/general.png',
    'images/graphic.png',
    'images/large.png',
    'images/printing.png',
    'images/shirt.png',
  ];

  final List<String> itemsName = [
    'PRINTING SERVICES',
    'GRAPHIC DESIGN',
    'LARGE FORMAT PRINTING',
    'BRONCHURES',
    'SHIRT & MUGS'
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: MediaQuery.of(context).size.height * 45 / 100,
      width: MediaQuery.of(context).size.width * 85 / 100,
      child: CarouselSlider.builder(
        itemCount: items.length,
        itemBuilder: (context, index, realIndex) {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 80 / 100,
                height: MediaQuery.of(context).size.height * 40 / 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      itemsName[index],
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    Image.asset(
                      items[index],
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 45 / 100,
            enableInfiniteScroll: true,
            autoPlay: true,
            viewportFraction: 1.0,
            aspectRatio: 2.0,
            scrollDirection: Axis.horizontal,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800)),
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(items.length, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          width: _currentIndex == index ? 12.0 : 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: _currentIndex == index ? Colors.teal : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}*/

/*import 'dart:developer';
import 'dart:ui';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/custom/custom_button.dart';
import 'package:kyn_designs/custom/main_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
                padding: const EdgeInsets.only(top: 100, left: 50, right: 50),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [TopMan(), Services()],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class Navbar extends StatefulWidget {
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final List<bool> _isHovered = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 90,
                  width: 90,
                ),
                Text(
                  "KYN DESIGNS & TECH",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              children: [
                _buildMenuItem(0, 'Home'),
                _buildMenuItem(1, 'Services'),
                _buildMenuItem(2, 'About Us'),
                _buildMenuItem(3, 'Contact'),
              ],
            ),
            Row(
              children: [
                CustomButton(
                  text: "LOG IN",
                  color: Colors.orange,
                  onPressed: () {},
                  textColor: Colors.white,
                ),
                TextButton(
                  onPressed: () {
                    // Create Account Action
                  },
                  child: Text('Create Account',
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 16)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(int index, String title) {
    return MouseRegion(
      onEnter: (_) => _onHover(index, true),
      onExit: (_) => _onHover(index, false),
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(
              color: _isHovered[index] ? Colors.orange : Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
    );
  }

  void _onHover(int index, bool isHovered) {
    setState(() {
      _isHovered[index] = isHovered;
    });
  }
}

class TopMan extends StatefulWidget {
  const TopMan({super.key});

  @override
  State<TopMan> createState() => _TopManState();
}

class _TopManState extends State<TopMan> {
  final List<String> items = [
    'images/general.png',
    'images/graphic.png',
    'images/large.png',
    'images/printing.png',
    'images/shirt.png',
  ];

  final List<String> itemsName = [
    'PRINTING SERVICES',
    'GRAPHIC DESIGN',
    'LARGE FORMAT PRINTING',
    'BROCHURES',
    'SHIRT & MUGS'
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: MediaQuery.of(context).size.height * 0.34,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider.builder(
              itemCount: items.length,
              itemBuilder: (context, index, realIndex) {
                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            itemsName[index],
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 32),
                          ),
                          Image.asset(
                            items[index],
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.45,
                enableInfiniteScroll: true,
                autoPlay: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
              ),
            ),
          ),
          _buildIndicator(),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(items.length, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          width: _currentIndex == index ? 12.0 : 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: _currentIndex == index ? Colors.orange : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}*/

/*import 'dart:ui';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/custom/custom_button.dart';
import 'package:kyn_designs/custom/main_body.dart';
import 'package:kyn_designs/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopMan(),
                  Services(),
                  SizedBox(
                    height: 100,
                  ),
                  Footer(),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Hello World");
        },
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ), // Optional icon for the button
      ),
    );
  }
}

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final List<bool> _isHovered = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 95 / 100,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLogo(),
            _buildMenu(),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      children: [
        Image.asset(
          'images/logo.png',
          height: 90,
          width: 90,
        ),
        Text(
          "KYN DESIGNS & TECH",
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildMenu() {
    const menuItems = ['Home', 'Services', 'About Us', 'Contact'];
    return Row(
      children: List.generate(menuItems.length, (index) {
        return _buildMenuItem(index, menuItems[index]);
      }),
    );
  }

  Widget _buildMenuItem(int index, String title) {
    return MouseRegion(
      onEnter: (_) => _onHover(index, true),
      onExit: (_) => _onHover(index, false),
      child: TextButton(
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(
              color: _isHovered[index] ? Colors.orange : Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        CustomButton(
          text: "LOG IN",
          color: Colors.orange,
          onPressed: () {},
          textColor: Colors.white,
        ),
        TextButton(
          onPressed: () {
            // Create Account Action
          },
          child: Text(
            'Create Account',
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
          ),
        ),
      ],
    );
  }

  void _onHover(int index, bool isHovered) {
    setState(() {
      _isHovered[index] = isHovered;
    });
  }
}

class TopMan extends StatefulWidget {
  const TopMan({super.key});

  @override
  State<TopMan> createState() => _TopManState();
}

class _TopManState extends State<TopMan> {
  final List<String> items = [
    'images/general.png',
    'images/graphic.png',
    'images/large.png',
    'images/printing.png',
    'images/shirt.png',
  ];

  final List<String> itemsName = [
    'PRINTING SERVICES',
    'GRAPHIC DESIGN',
    'LARGE FORMAT PRINTING',
    'BROCHURES',
    'SHIRT & MUGS',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: MediaQuery.of(context).size.height * 0.34,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider.builder(
              itemCount: items.length,
              itemBuilder: (context, index, realIndex) {
                return _buildCarouselItem(index);
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.45,
                enableInfiniteScroll: true,
                autoPlay: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
              ),
            ),
          ),
          _buildIndicator(),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            itemsName[index],
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 32),
          ),
          Image.asset(
            items[index],
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(items.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          width: _currentIndex == index ? 12.0 : 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: _currentIndex == index ? Colors.orange : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}*/

/*import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyn_designs/custom/main_body.dart';
import 'package:kyn_designs/custom/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopMan(),
                  Services(),
                ],
              ),
            ),
          ),
          Footer()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Hello World");
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}

class TopMan extends StatefulWidget {
  const TopMan({super.key});

  @override
  State<TopMan> createState() => _TopManState();
}

class _TopManState extends State<TopMan> {
  final List<String> items = [
    'images/general.png',
    'images/graphic.png',
    'images/large.png',
    'images/printing.png',
    'images/shirt.png',
  ];

  final List<String> itemsName = [
    'PRINTING SERVICES',
    'GRAPHIC DESIGN',
    'LARGE FORMAT PRINTING',
    'BROCHURES',
    'SHIRT & MUGS',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Check if items list is empty
    if (items.isEmpty || items.length != itemsName.length) {
      return const Center(child: Text("No items available"));
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: MediaQuery.of(context).size.height * 0.34,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider.builder(
              itemCount: items.length,
              itemBuilder: (context, index, realIndex) {
                return _buildCarouselItem(index);
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.45,
                enableInfiniteScroll: true,
                autoPlay: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
              ),
            ),
          ),
          _buildIndicator(),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(int index) {
    // Ensure we have valid index access
    if (index < 0 || index >= items.length) return const SizedBox.shrink();

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            itemsName[index],
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 32),
          ),
          Image.asset(
            items[index],
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(items.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          width: _currentIndex == index ? 12.0 : 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: _currentIndex == index ? Colors.orange : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  fillColor: Colors.orange),
            )
          ],
        )
      ],
    );
  }
}*/

import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_icons/icon_icons.dart';
import 'package:kyn_designs/custom/logs_navbar.dart';
import 'package:kyn_designs/custom/main_body.dart';
import 'package:kyn_designs/custom/navbar.dart';
import 'package:unicons/unicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    TopMan(),
                    Services(),
                  ],
                ),
              ),
            ),
          ),
          const Footer(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Hello World");
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}

class TopMan extends StatefulWidget {
  const TopMan({super.key});

  @override
  State<TopMan> createState() => _TopManState();
}

class _TopManState extends State<TopMan> {
  final List<String> items = [
    'images/general.png',
    'images/graphic.png',
    'images/large.png',
    'images/printing.png',
    'images/shirt.png',
  ];

  final List<String> itemsName = [
    'PRINTING SERVICES',
    'GRAPHIC DESIGN',
    'LARGE FORMAT PRINTING',
    'BROCHURES',
    'SHIRT & MUGS',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty || items.length != itemsName.length) {
      return const Center(child: Text("No items available"));
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: MediaQuery.of(context).size.height * 0.34,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider.builder(
              itemCount: items.length,
              itemBuilder: (context, index, realIndex) {
                return _buildCarouselItem(index);
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.45,
                enableInfiniteScroll: true,
                autoPlay: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
              ),
            ),
          ),
          _buildIndicator(),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(int index) {
    if (index < 0 || index >= items.length) return const SizedBox.shrink();

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            itemsName[index],
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 32),
          ),
          Image.asset(
            items[index],
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(items.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          width: _currentIndex == index ? 12.0 : 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: _currentIndex == index ? Colors.orange : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 40,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Suscribe To Our NewsLetter',
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Suscribe",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(UniconsLine.whatsapp,
                      size: 24, color: Colors.white)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(UniconsLine.facebook_messenger_alt,
                      size: 24, color: Colors.white)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    UniconsLine.instagram,
                    size: 24,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    UniconsLine.twitter_alt,
                    color: Colors.white,
                    size: 24,
                  ))
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Location: Agbozume, Volta Region, Ghana",
              style: GoogleFonts.montserrat(color: Colors.white),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Telephone:  (+233) 024-5455-994, 020-767-3884, 024-4444-4353",
              style: GoogleFonts.montserrat(color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Email: kyndesigns@gmail.com",
              style: GoogleFonts.montserrat(color: Colors.white),
            ),
          ),
          Align(
            child: Text(
              "Copyright \u00A9 2024 Binstech LLC",
              style: GoogleFonts.montserrat(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
