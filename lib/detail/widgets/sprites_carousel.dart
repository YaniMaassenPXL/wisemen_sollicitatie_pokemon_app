import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:photo_view/photo_view.dart';

class SpritesCarousel extends StatelessWidget {
  SpritesCarousel({Key? key, required this.sprites}) : super(key: key);

  final Sprites sprites;
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      sprites.front_default,
      sprites.back_default ?? 'null',
      sprites.front_female ?? 'null',
      sprites.back_female ?? 'null',
      sprites.front_shiny ?? 'null',
      sprites.back_shiny ?? 'null',
      sprites.front_shiny_female ?? 'null',
      sprites.back_shiny_female ?? 'null'
    ];
    imageUrls.removeWhere((string) => string.contains('null'));
    return Row(
      children: [
        IconButton(
          onPressed: () => buttonCarouselController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.linear),
            icon: Icon(Icons.arrow_back_ios, color: Colors.white.withOpacity(0.7), size: 16)
        ),
        Expanded(
          child: CarouselSlider.builder(
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              pageSnapping: true,
              enlargeCenterPage: true
            ),
            itemCount: imageUrls.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              return PhotoView(
                backgroundDecoration: BoxDecoration(
                  color: Colors.transparent
                ),
                enablePanAlways: true,
                imageProvider: NetworkImage(imageUrls[itemIndex])
              );
            }
          ),
        ),
        IconButton(
            onPressed: () => buttonCarouselController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear),
            icon: Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.7), size: 16)
        ),
      ],
    );
  }
}
