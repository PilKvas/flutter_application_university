import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_university/app_colors.dart';
import 'package:flutter_application_university/widgets/custom_textfield_widget.dart';
import 'package:flutter_application_university/widgets/topic_element.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Item {
  final int id;
  final String title;
  final String content;
  final List<String> tag;
  final int timeToRead;

  final DateTime upload;

  Item(
      {required this.upload,
      required this.id,
      required this.title,
      required this.content,
      required this.tag,
      required this.timeToRead});
}

enum SortCheck {
  withoutSort,
  byTheNameAZ,
  byTheNameZA,
  ascending,
  descending,
  byDateAscending,
  byDateDescending
}

List<Item> items = [
  Item(
    title: "Как оптимизировать производительность веб-приложения",
    id: 1,
    content:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    tag: ["IT"],
    timeToRead: 3,
    upload: DateTime.parse("2022-12-22"),
  ),
  Item(
      title: "Защита конфиденциальной информации на Android",
      id: 2,
      content: "content",
      tag: ["IT"],
      timeToRead: 2,
      upload: DateTime.parse("2020-09-12")),
  Item(
      title:
          "Как создать анимированные переходы между экранами с помощью Flutter",
      id: 3,
      content: "content",
      tag: ["IT"],
      timeToRead: 10,
      upload: DateTime.parse("2019-05-14")),
  Item(
      title: "Искусство работы с Promises в JavaScript",
      id: 4,
      content: "content",
      tag: ["IT"],
      timeToRead: 4,
      upload: DateTime.parse("2018-03-17")),
  Item(
      title:
          "10 технологий, которые обязательно изучить разработчику в 2021 году",
      id: 5,
      content: "content",
      tag: ["IT"],
      timeToRead: 6,
      upload: DateTime.parse("2021-01-10")),
 
  Item(
    title: "CRISPR-Cas: обезьяны-клонирующие эксперты",
    id: 6,
    content: "content",
    tag: ["Biology"],
    timeToRead: 15,
    upload: DateTime.parse("2020-07-19"),
  ),
  Item(
    title:
        "Открытие нового безопасного подхода к передаче трансгенных генов в мышьях, используя AAV-сядущие векторы",
    id: 7,
    content: "content",
    tag: ["Biology"],
    timeToRead: 4,
    upload: DateTime.parse("2023-02-01"),
  ),
  Item(
    title: "Эль Ниньо может привести к глохнущим анемонам",
    id: 6,
    content: "content",
    tag: ["Biology"],
    timeToRead: 2,
    upload: DateTime.parse("2018-03-05"),
  ),
  Item(
    title:
        "Изучение динамики геномных изменений у пациентов с диабетом 2-го типа, используя одноядерный полиморфизм",
    id: 6,
    content: "content",
    tag: ["Biology"],
    timeToRead: 7,
    upload: DateTime.parse("2018-10-11"),
  ),
  Item(
    title: "Морские игрушки",
    id: 6,
    content: "content",
    tag: ["Biology"],
    timeToRead: 5,
    upload: DateTime.parse("2018-05-12"),
  ),
];

class ListViewTab extends StatefulWidget {
  const ListViewTab({super.key});

  @override
  State<ListViewTab> createState() => _ListViewTabState();
}

class _ListViewTabState extends State<ListViewTab> {
  String filterIcon = 'assets/filterOff.svg';
  SortCheck? _sort = SortCheck.withoutSort;

  final _serchCotroller = TextEditingController();

  List<Item> originalItems = [];

  void _searchingList() {
    if (_serchCotroller.text.isNotEmpty) {
      originalItems = items.where((Item item) {
        return item.title.toLowerCase().contains(_serchCotroller.text);
      }).toList();
    } else {
      originalItems = items;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    originalItems = List.from(items);
    _serchCotroller.addListener(_searchingList);
  }

  void _showBottomNavigation() {
    showModalBottomSheet(
      backgroundColor: const Color.fromRGBO(136, 77, 231, 1),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      context: context,
      builder: (context) => StatefulBuilder(builder:
          (BuildContext context, void Function(void Function()) setState) {
        return FractionallySizedBox(
            heightFactor: 0.9,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Сортировка',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close)),
                    ],
                  ),
                  ListTile(
                    title: const Text(
                      "Без сортировки",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    leading: Radio<SortCheck>(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      value: SortCheck.withoutSort,
                      groupValue: _sort,
                      onChanged: (SortCheck? value) {
                        setState(() {
                          _sort = value;
                        });
                      },
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 226, 225, 225),
                  ),
                  const ListTile(
                    title: Text(
                      "По названию",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "В алфавитном порядке",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    leading: Radio<SortCheck>(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      value: SortCheck.byTheNameAZ,
                      groupValue: _sort,
                      onChanged: (SortCheck? value) {
                        setState(() {
                          _sort = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "В обратном порядке",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    leading: Radio<SortCheck>(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      value: SortCheck.byTheNameZA,
                      groupValue: _sort,
                      onChanged: (SortCheck? value) {
                        setState(() {
                          _sort = value;
                        });
                      },
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 226, 225, 225),
                  ),
                  const ListTile(
                    title: Text(
                      "По времени прочтения",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "По возрастанию",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    leading: Radio<SortCheck>(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      value: SortCheck.ascending,
                      groupValue: _sort,
                      onChanged: (SortCheck? value) {
                        setState(() {
                          _sort = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "По убыванию",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    leading: Radio<SortCheck>(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      value: SortCheck.descending,
                      groupValue: _sort,
                      onChanged: (SortCheck? value) {
                        setState(() {
                          _sort = value;
                        });
                      },
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 226, 225, 225),
                  ),
                  const ListTile(
                    title: Text(
                      "По году публикации",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "По Возрастанию",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    leading: Radio<SortCheck>(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      value: SortCheck.byDateAscending,
                      groupValue: _sort,
                      onChanged: (SortCheck? value) {
                        setState(() {
                          _sort = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "По убыванию",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    leading: Radio<SortCheck>(
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      value: SortCheck.byDateDescending,
                      groupValue: _sort,
                      onChanged: (SortCheck? value) {
                        setState(() {
                          _sort = value;
                        });
                      },
                    ),
                  ),
                  MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: Colors.white,
                      child: const Text("Применить",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700)),
                      onPressed: () {
                        setState(() {
                          if (_sort != SortCheck.withoutSort) {
                            filterIcon = "assets/filterOn.svg";
                          } else {
                            filterIcon = "assets/filterOff.svg";
                          }
                        });
                        _sortItems();
                        Navigator.pop(context);
                      })
                ],
              ),
            ));
      }),
    );
  }

  void _sortItems() {
    setState(() {
      switch (_sort) {
        case SortCheck.byTheNameAZ:
          originalItems.sort(
              (a, b) => a.title.toUpperCase().compareTo(b.title.toUpperCase()));
          break;
        case SortCheck.byTheNameZA:
          originalItems.sort(
              (a, b) => b.title.toUpperCase().compareTo(a.title.toUpperCase()));
          break;
        case SortCheck.withoutSort:
          originalItems = List.from(items);
          break;
        case SortCheck.ascending:
          originalItems.sort((a, b) => a.timeToRead.compareTo(b.timeToRead));
          break;
        case SortCheck.descending:
          originalItems.sort((a, b) => b.timeToRead.compareTo(a.timeToRead));
          break;
        case SortCheck.byDateAscending:
          originalItems.sort((a, b) => a.upload.year.compareTo(b.upload.year));
          break;
        case SortCheck.byDateDescending:
          originalItems.sort((a, b) => b.upload.year.compareTo(a.upload.year));
          break;
        case null:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                  hintText: "Поиск",
                  controller: _serchCotroller,
                  suffixIcon: IconButton(
                    onPressed: () {
                      _showBottomNavigation();
                    },
                    icon: SvgPicture.asset(filterIcon),
                  ),
                  obscureText: false,
                )),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: originalItems.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 160,
                      maxWidth: double.infinity,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(139, 41, 244, 1)
                                .withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                              0,
                              3,
                            ), // changes position of shadow
                          ),
                        ],
                        color: const Color.fromARGB(0, 121, 70, 175),
                        border: Border.all(
                          color: AppColors.backgroundColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10.0),
                          splashColor: AppColors.textFieldColor,
                          onTap: (){
                             Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TopicScreen(item: originalItems[index],),
            ),
          );
                          },
                          onLongPress: () {
                            HapticFeedback.vibrate();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  actionsAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {},
                                      color: AppColors.textFieldColor,
                                      child: const Text("Читать статью"),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      color: AppColors.textFieldColor,
                                      child: const Text("Закрыть"),
                                    ),
                                  ],
                                  backgroundColor: AppColors.backgroundColor,
                                  title: Text(
                                    originalItems[index].title,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(originalItems[index].content,
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      Text(
                                        textAlign: TextAlign.left,
                                        "Среднее время прочтения: ${originalItems[index].timeToRead.toString()} минут",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Дата публикации: ${originalItems[index].upload.year}.${originalItems[index].upload.month}.${originalItems[index].upload.day}",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${originalItems[index].upload.year}.${originalItems[index].upload.month}.${originalItems[index].upload.day}",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: Hero(
                                                      tag: 'hero-tag-${originalItems[index].title}',
                                                      child: Text(
                                                        originalItems[index].title,
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors.white),
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Среднее время прочтения: ${originalItems[index].timeToRead.toString()} минуты",
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                originalItems[index]
                                                    .tag
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
