import '/common/empty_photos/empty_photos_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'images_carousel_model.dart';
export 'images_carousel_model.dart';

class ImagesCarouselWidget extends StatefulWidget {
  const ImagesCarouselWidget({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String>? images;

  @override
  _ImagesCarouselWidgetState createState() => _ImagesCarouselWidgetState();
}

class _ImagesCarouselWidgetState extends State<ImagesCarouselWidget> {
  late ImagesCarouselModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImagesCarouselModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      child: Builder(
        builder: (context) {
          final images = widget.images!.toList();
          if (images.isEmpty) {
            return EmptyPhotosWidget();
          }
          return Container(
            height: 180.0,
            child: CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, imagesIndex, _) {
                final imagesItem = images[imagesIndex];
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: FlutterFlowExpandedImageView(
                          image: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 400),
                            fadeOutDuration: Duration(milliseconds: 400),
                            imageUrl: imagesItem,
                            fit: BoxFit.contain,
                          ),
                          allowRotation: true,
                          tag: imagesItem,
                          useHeroAnimation: true,
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: imagesItem,
                    transitionOnUserGestures: true,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 400),
                        fadeOutDuration: Duration(milliseconds: 400),
                        imageUrl: imagesItem,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
              carouselController: _model.carouselController ??=
                  CarouselController(),
              options: CarouselOptions(
                initialPage: min(0, images.length - 1),
                viewportFraction: 0.5,
                disableCenter: true,
                enlargeCenterPage: true,
                enlargeFactor: 0.25,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                autoPlay: false,
                onPageChanged: (index, _) =>
                    _model.carouselCurrentIndex = index,
              ),
            ),
          );
        },
      ),
    );
  }
}
