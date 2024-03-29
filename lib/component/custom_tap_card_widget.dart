import 'package:flutter/material.dart';

class CustomTapCardWidget extends StatefulWidget {
  const CustomTapCardWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<CustomTapCardWidget> createState() => _CustomTapCardWidgetState();
}

class _CustomTapCardWidgetState extends State<CustomTapCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: Colors.amber,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.text,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget newCard(BuildContext context) {
    return Card(
      color: Colors.amber,
      borderOnForeground: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: Center(
          child: Text(
            "Deneme",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}

Widget oldCard(BuildContext context) {
  return Card(
    color: Colors.amber,
    borderOnForeground: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Center(
        child: Text(
          "Deneme",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    ),
  );
}
