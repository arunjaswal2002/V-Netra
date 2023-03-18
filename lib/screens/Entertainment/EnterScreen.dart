import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:v_netra/widgets/Mydrawer.dart';
import 'package:camera/camera.dart';
// import 'package:on_audio_query/on_audio_query.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class EnterScreen extends StatefulWidget {
  // const EnterScreen({super.key});
  List<CameraDescription> cameras = [];

  @override
  State<EnterScreen> createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen> {
  String img_cover_url =
      "https://i.pinimg.com/736x/a7/a9/cb/a7a9cbcefc58f5b677d8c480cf4ddc5d.jpg";

  bool isPlaying = false;
  double value = 0;
  final player = AudioPlayer();
  Duration? duration;

  void initPlayer() async {
    await player.setSource(AssetSource("music.mp3"));
    duration = await player.getDuration();
  }

  //init the player
  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Widget buildPage(String t) {
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          height: 300.0,
          width: 300.0,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //setting the music cover
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.asset(
                "assets/cover.jpeg",
                width: 250.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Jis Dil vich Sajjan Vas Jaave",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, letterSpacing: 2),
            ),
            //Setting the seekbar
            const SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${(value / 60).floor()}: ${(value % 60).floor()}",
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  width: 260.0,
                  child: Slider.adaptive(
                    onChangeEnd: (new_value) async {
                      setState(() {
                        value = new_value;
                        print(new_value);
                      });
                      await player.seek(Duration(seconds: new_value.toInt()));
                    },
                    min: 0.0,
                    value: value,
                    max: 214.0,
                    onChanged: (value) {},
                    activeColor: Colors.white,
                  ),
                ),
              ],
            ),
            //setting the player controller
            const SizedBox(
              height: 60.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    color: Colors.black87,
                    border: Border.all(color: Colors.white38),
                  ),
                  width: 50.0,
                  height: 50.0,
                  child: InkWell(
                    onTapDown: (details) {
                      player.setPlaybackRate(0.5);
                    },
                    onTapUp: (details) {
                      player.setPlaybackRate(1);
                    },
                    child: const Center(
                      child: Icon(
                        Icons.fast_rewind_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    color: Colors.black87,
                    border: Border.all(color: Colors.pink),
                  ),
                  width: 60.0,
                  height: 60.0,
                  child: InkWell(
                    onTap: () async {
                      //setting the play function
                      isPlaying ? await player.pause() : await player.resume();

                      isPlaying = !isPlaying;
                      player.onPositionChanged.listen(
                        (Duration d) {
                          setState(() {
                            value = d.inSeconds.toDouble();

                            print(value);
                          });
                        },
                      );
                      print(duration);
                    },
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    color: Colors.black87,
                    border: Border.all(color: Colors.white38),
                  ),
                  width: 50.0,
                  height: 50.0,
                  child: InkWell(
                    onTapDown: (details) {
                      player.setPlaybackRate(2);
                    },
                    onTapUp: (details) {
                      player.setPlaybackRate(1);
                    },
                    child: const Center(
                      child: Icon(
                        Icons.fast_forward_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget buildAudioBook(String t) {
    final List<String> titles = [
      "BUDH",
      "HIP-HOP",
      "PODCAST",
      "New Releases",
      "Made for You",
    ];
    final List<Widget> images = [
      Container(
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    ];

    return SafeArea(
      // child: Expanded(
      child: Container(
        child: VerticalCardPager(
          textStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          titles: titles,
          images: images,
          onPageChanged: (page) {},
          align: ALIGN.CENTER,
          onSelectedItem: (index) {},
        ),
      ),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Music Player'),
            centerTitle: true,
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.music_note),
                text: 'Songs',
              ),
              Tab(
                icon: Icon(Icons.book),
                text: 'Audio Book',
              ),
              Tab(icon: Icon(Icons.newspaper), text: 'News'),
            ]),
          ),
          drawer: MyDrawer(widget.cameras),
          body: TabBarView(
            children: [
              buildPage('Songs'),
              buildAudioBook('AudioBooks'),
              builde('News'),
            ],
          )),
    );
  }
}

Widget builde(String t) {
  return Center(child: Text(t));
}
