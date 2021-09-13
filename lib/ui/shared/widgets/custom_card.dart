import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? imageUrl;

  const CustomCard({Key? key, this.title, this.subTitle, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: ListTile(
        title: Text(this.title!),
        subtitle: Text(this.subTitle!),
        trailing: imagePlace,
      ),
    );
  }

  Widget get imagePlace {
    return imageUrl!.isEmpty
        ? Container(
            height: 100,
            width: 100,
            child: Placeholder(),
          )
        : Image.network(this.imageUrl!);
  }
}
