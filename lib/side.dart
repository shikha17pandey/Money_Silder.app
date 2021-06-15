import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Slide {
  final String skip;
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.skip,
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    skip: 'skip',
    imageUrl: 'images/asaa1.jpg',
    title: 'Money Tracking',
    description:
        'Many desktop publishing packages and web page editors now usedefault model text',
  ),
  Slide(
    skip: 'skip',
    imageUrl: 'images/asaa.jpg',
    title: 'Money Tracking',
    description:
        'Many desktop publishing packages and web page editors now usedefault model text',
  ),
  Slide(
    skip: 'skip',
    imageUrl: 'images/ssa.jpg',
    title: 'Money Tracking',
    description:
        'Many desktop publishing packages and web page editors now usedefault model text',
  ),
];
