import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  final List<String>? tagList;
  const Tags({super.key, required this.tagList});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: tagList != null
          ? Wrap(
              runAlignment: WrapAlignment.start,
              spacing: 10,
              children: List.generate(
                tagList!.length,
                (index) => Chip(
                  backgroundColor: Theme.of(context).backgroundColor,
                  label: Text(
                    '# ${tagList![index]}',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .labelMedium!
                        .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
                  ),
                ),
              ),
            )
          : IntrinsicWidth(
              child: Chip(
                backgroundColor: Theme.of(context).backgroundColor,
                label: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '새로운 태그 생성',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .labelMedium!
                            .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
