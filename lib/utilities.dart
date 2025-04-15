import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget returnButton(image, color, height, width, context, page) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
    child: SizedBox(
      height: height,
      width: width,
      child: Image.asset(
        image,
        scale: 0.9,
      ),
    ),
  );
}

Widget nextButtonBox(text, width, height, context, page, onClick) {
  return GestureDetector(
      onTap: () {
        onClick;
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF946CC3),
                ),
              ]),
          height: height,
          width: width,
          child: Center(
              child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ))));
}

Widget applyButtonBox(String text, double width, double height,
    BuildContext context, Widget page) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFF946CC3),
        borderRadius: BorderRadius.circular(16),
      ),
      height: height,
      width: width,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            fontFamily: 'Poppins',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    ),
  );
}

Widget returnButton1(image, color, height, width, context, page) {
  return GestureDetector(
      onTap: () {
        showBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
          builder: (BuildContext context) {
            return Container(
                height: 300,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Column(children: [
                  Container(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      height: 15,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: Container(
                                  width: 101,
                                  height: 12,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF8F8F8F),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ))
                          ])),
                  Container(
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Refer',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                fontStyle: FontStyle.normal,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                width: 2,
                              ),
                              optionBox1(
                                  'assets/instagram.png', 80.0, 80.0, ''),
                              const SizedBox(
                                width: 2,
                              ),
                              optionBox1(
                                  'assets/instagram.png', 80.0, 80.0, ''),
                              const SizedBox(
                                width: 2,
                              ),
                              optionBox1(
                                  'assets/instagram.png', 80.0, 80.0, ''),
                              const SizedBox(
                                width: 2,
                              ),
                            ],
                          ))),
                  Container(
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                width: 2,
                              ),
                              optionBox1(
                                  'assets/instagram.png', 80.0, 80.0, ''),
                              const SizedBox(
                                width: 2,
                              ),
                              optionBox1(
                                  'assets/instagram.png', 80.0, 80.0, ''),
                              const SizedBox(
                                width: 2,
                              ),
                              optionBox1(
                                  'assets/instagram.png', 80.0, 80.0, ''),
                              const SizedBox(
                                width: 2,
                              ),
                            ],
                          ))),
                ]));
          },
        );
      },
      child: SizedBox(
        height: height,
        width: width,
        child: Image.asset(
          image,
          scale: 0.5,
        ),
      ));
}

Widget resumeBox(image, height, width, text1, text2) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            image,
            scale: 0.8,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 3, 0, 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text(
                    'Resume-$text1',
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    text2,
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: Color(0xFF18191E)),
                  )
                ]),
          )
        ],
      ),
    ),
  );
}

class SelectableBox extends StatefulWidget {
  final String image;
  final double height;
  final double width;
  final String text;

  const SelectableBox({
    Key? key,
    required this.image,
    required this.height,
    required this.width,
    required this.text,
  }) : super(key: key);

  @override
  _SelectableBoxState createState() => _SelectableBoxState();
}

class _SelectableBoxState extends State<SelectableBox> {
  bool isSelected = false;
  final List<String> myStringList = ['String 1', 'String 2', 'String 3'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
          // setState(() {
          //   isSelected = !isSelected;
          // },
          // );
          async {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        // Save list as a string
        prefs.setStringList('myKey', myStringList);
        setState(
          () {
            isSelected = !isSelected;
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: isSelected ? Colors.transparent : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color(0x59946CC3),
                blurRadius: 10,
                offset: Offset(-3, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.image,
                scale: 1.1,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 3, 0, 0),
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget perkBox(image, height, width, text) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
    child: SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            image,
            scale: 1.1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 3, 0, 0),
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppins'),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget requiredBox(width, height, text) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
    child: Container(
      height: height,
      width: width,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
              side: const BorderSide(
                width: 2,
                color: Color(0xFF946CC3),
              ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 3, 0, 0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'poppins',
                  color: Color(0xFF946CC3)),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget optionBox1(image, height, width, text) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            scale: 1.1,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget nextButton(
  context,
  page,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.deepPurpleAccent,
      ),
      height: 373,
      width: 56,
      child: const Center(
          child: Text(
        'Next',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 22,
          color: Colors.black,
        ),
      )),
    ),
  );
}

Widget showBox(image, height, width, text1, text2) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(9, 0, 12, 0),
      child: Row(children: [
        Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                scale: 0.2,
                width: 130.0,
              ),
            ],
          ),
        ),
        Container(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  text2,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ]),
        ))
      ]));
}

Widget textBox(height, width, width2, text1, text2) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 10, 0),
      child: Row(children: [
        SizedBox(
          height: height,
          width: width,
          child: Row(children: [
            Text(
              text1,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: width2,
            ),
            Text(
              text2,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ]),
        ),
      ]));
}

Widget shareBox(image, height, width, text) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
    child: SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            scale: 0.9,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 9, 0, 0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    ),
  );
}

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

Widget content_JobDis(BuildContext context) {
  return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 50,
          child: Center(child: Text('Entry ${entries[index]}')),
        );
      });
}

Widget jobDisBoxUi(
  context,
  image,
  double height,
  double width,
  text1,
  text2,
  text3,
  text4,
  text5,
  text6,
  text7,
) {
  final Size screenSize = MediaQuery.of(context).size;

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(45),
      color: const Color(0x19946CC3),
    ),
    height: height * screenSize.height * 0.0014,
    width: width * screenSize.width * 0.00257,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            scale: 0.9,
          ),
          const SizedBox(height: 7),
          Text(
            text1,
            style: TextStyle(
              fontSize: 20 * screenSize.width * 0.0027,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: const Color.fromARGB(252, 0, 0, 0),
            ),
          ),
          Text(
            text2,
            style: TextStyle(
              fontSize: 14 * screenSize.width * 0.0028,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: const Color(0xFF0A66C2),
            ),
          ),
          const Divider(),
          SizedBox(
            height: 4 * screenSize.height * 0.0018,
          ),
          Text(
            text3,
            style: TextStyle(
              fontSize: 14 * screenSize.width * 0.0028,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: const Color(0xD6595961),
            ),
          ),
          SizedBox(
            height: 4 * screenSize.height * 0.0018,
          ),
          Text(
            text4,
            style: TextStyle(
              fontSize: 15 * screenSize.width * 0.0027,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              color: const Color(0xFF946CC3),
            ),
          ),
          SizedBox(
            height: 15 * screenSize.height * 0.0018,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x63946CC3),
                    ),
                  ],
                ),
                height: 27 * screenSize.height * 0.0014,
                width: 90 * screenSize.width * 0.0026,
                child: Center(
                  child: Text(
                    text5,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12 * screenSize.width * 0.0028,
                      fontFamily: 'Poppins',
                      color: const Color(0xFF946CC3),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x63946CC3),
                    ),
                  ],
                ),
                height: 27 * screenSize.height * 0.0014,
                width: 90 * screenSize.width * 0.0026,
                child: Center(
                  child: Text(
                    text6,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12 * screenSize.width * 0.0028,
                      fontFamily: 'Poppins',
                      color: const Color(0xFF946CC3),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 37, 0, 0),
            child: Text(
              text7,
              style: TextStyle(
                fontSize: 12 * screenSize.width * 0.0028,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 35, 35, 35),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    ),
  );
}

class AnimatedLoadingDots extends StatefulWidget {
  const AnimatedLoadingDots({super.key});

  @override
  _AnimatedLoadingDotsState createState() => _AnimatedLoadingDotsState();
}

class _AnimatedLoadingDotsState extends State<AnimatedLoadingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = TweenSequence<Color?>(
      <TweenSequenceItem<Color?>>[
        TweenSequenceItem<Color?>(
          tween: ColorTween(
            begin: Colors.white,
            end: Colors.blue,
          ),
          weight: 1,
        ),
      ],
    ).animate(_controller);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 5; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    color: _animation.value,
                    shape: BoxShape.circle,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

class TextColorChangeWithLine extends StatefulWidget {
  const TextColorChangeWithLine({super.key});

  @override
  _TextColorChangeWithLineState createState() =>
      _TextColorChangeWithLineState();
}

class _TextColorChangeWithLineState extends State<TextColorChangeWithLine> {
  Color jobDescColor = const Color(0xFF0A66C2);
  Color minQualColor = Colors.black;

  void _changeColors(bool isJobDescTapped) {
    setState(() {
      if (isJobDescTapped) {
        jobDescColor = const Color(0xFF0A66C2);
        minQualColor = Colors.black;
      } else {
        jobDescColor = Colors.black;
        minQualColor = const Color(0xFF0A66C2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _changeColors(true);
              },
              child: Text(
                "Job Description      ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  color: jobDescColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _changeColors(false);
              },
              child: Text(
                "Minimum Qualification",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  color: minQualColor,
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 1,
          width: 330,
          color: jobDescColor == const Color(0xFF0A66C2)
              ? const Color(0xFF0A66C2)
              : const Color(0xFFD9D9D9),
          margin: const EdgeInsets.symmetric(vertical: 5),
        ),
      ],
    );
  }
}
