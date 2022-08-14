import 'package:flutter/material.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_app_wisemen/utils/functions.dart';

class HexStatGraph extends StatelessWidget {
  const HexStatGraph({Key? key, required this.stats, required this.type}) : super(key: key);

  final List<Stat> stats;
  final String type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(stats[0].stat.name.toUpperCase()),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: constraints.maxHeight * .25, left: constraints.maxWidth * .1),
                  child: Text('Sp. Atk'),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: constraints.maxHeight * .25, left: constraints.maxWidth * .1),
                  child: Text('Sp. Def'),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(stats[5].stat.name.capitalize()),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(bottom: constraints.maxHeight * .25, right: constraints.maxWidth * .1),
                  child: Text(stats[2].stat.name.capitalize()),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: constraints.maxHeight * .25, right: constraints.maxWidth * .1),
                  child: Text(stats[1].stat.name.capitalize()),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.height * .3,
                  child: CustomPaint(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .3,
                      width: MediaQuery.of(context).size.height * .3,
                      child: CustomPaint(
                        painter: StatsPainter(stats: stats, type: type),
                      ),
                    ),
                    painter: RPSCustomPainter(),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromRGBO(172, 178, 193, 0.2)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;


    Path path0 = Path();
    path0.moveTo(size.width*0.5,0);
    path0.lineTo(size.width*0.025,size.height*0.25);
    path0.lineTo(size.width*0.025,size.height*0.75);
    path0.lineTo(size.width*0.5,size.height);
    path0.lineTo(size.width,size.height*0.75);
    path0.lineTo(size.width,size.height*0.25);
    path0.lineTo(size.width*0.5,0);
    path0.close();

    canvas.drawPath(path0, paint0);


    Paint paint1 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;


    Path path1 = Path();
    path1.moveTo(size.width*0.5,0);
    path1.lineTo(size.width*0.5,size.height);
    path1.lineTo(size.width*0.025,size.height*0.75);
    path1.lineTo(size.width,size.height*0.25);
    path1.lineTo(size.width,size.height*0.75);
    path1.lineTo(0,size.height*0.25);
    path1.lineTo(size.width*0.5,0);
    path1.close();

    canvas.drawPath(path1, paint1);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class StatsPainter extends CustomPainter{
  StatsPainter({required this.stats, required this.type});

  final List<Stat> stats;
  final String type;
  static int max = 160;

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = getColorFromType(type).withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.5,size.height*(0.5 - stats[0].base_stat / max / 2));
    path0.lineTo(size.width*(0.5 + (110.054 /97.389) * stats[1].base_stat / max / 2 - 0.025),size.height*(.5 - (51.257 / 110.054) * stats[1].base_stat / max / 2));
    path0.lineTo(size.width*(0.5 + (110.054 /97.389) *  stats[2].base_stat / max / 2 - 0.025),size.height*(.5 + (51.257 / 110.054) *  stats[2].base_stat / max / 2));
    path0.lineTo(size.width*0.5,size.height*(0.5 + stats[5].base_stat / max / 2));
    path0.lineTo(size.width*(.5 - (97.389 / 110.054) * (stats[4].base_stat / max / 2) + 0.025),size.height*(.5 + (51.257 / 110.054) * stats[4].base_stat / max / 2));
    path0.lineTo(size.width*(0.5 - (97.389 / 110.054) *  stats[3].base_stat / max / 2 + 0.025),size.height*(.5 - (51.257 / 110.054) * stats[3].base_stat / max / 2));
    path0.lineTo(size.width*0.5,size.height*(0.5 - stats[0].base_stat / max / 2));
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}