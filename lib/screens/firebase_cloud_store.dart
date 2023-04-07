import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_university/app_colors.dart';
import 'package:flutter_application_university/widgets/custom_textfield_widget.dart';

import 'package:flutter_application_university/widgets/topic_element.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mysql_client/mysql_client.dart';





class ReadAllPage extends StatefulWidget {
const ReadAllPage({Key? key}) : super(key: key);
@override
State createState() => _ReadAllPageState();
}

class _ReadAllPageState extends State<ReadAllPage> {
  String? _sortCriteria = "id"; // default sort criteria
  List<Map<String, String>> displayList = [];
  List<Map<String, String>> filtered = [];
   String filterIcon = 'assets/filterOff.svg';
   String? sortOrder = "ASC"; 

     final _serchCotroller = TextEditingController();
  // Update the display list based on the selected sort criteria
  void _updateDisplayList() async {
    final conn = await MySQLConnection.createConnection(
      host: "localhost",
      port: 3306,
      userName: "root",
      password: "Artem1999",
      databaseName: "LotusMindDb",
    );

    await conn.connect();

    var result = await conn.execute("SELECT * FROM items1 ORDER BY $_sortCriteria $sortOrder");

    List<Map<String, String>> list = [];
    for (final row in result.rows) {
      final data = {
        'id': row.colAt(0)!,
        'title': row.colAt(1)!,
        'content': row.colAt(2)!,
        'author': row.colAt(3)!,
        'timeToRead': row.colAt(4)!,
        'uploadDate': row.colAt(5)!,
        'synopsis': row.colAt(6)!,
        'views': row.colAt(7)!,
        'tag': row.colAt(8)!,
      };
      list.add(data);
    }

    setState(() {
      displayList = list;
    });

    await conn.close();
  }

void _searchingList() {
    if (_serchCotroller.text.isNotEmpty) {
      filtered  = displayList.where(( Map<String, String> data) {
        return data['title']!.toLowerCase().contains(_serchCotroller.text.toLowerCase());
      }).toList();
    } else {
      filtered = displayList;
    }

    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    _updateDisplayList();

    filtered = List.from(displayList);
   
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
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Сортировка',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
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
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  leading: Radio<String>(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromARGB(255, 0, 0, 0)),
                    value: 'id',
                    groupValue: _sortCriteria,
                    onChanged: (value) {
                      setState(() {
                        _sortCriteria = value;
                        _updateDisplayList();
                      });
                    },
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 226, 225, 225),
                ),
                ListTile(
                  title: const Text(
                    "По возрастанию",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  leading: Radio<String>(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromARGB(255, 255, 255, 255)),
                    value: 'ASC',
                    groupValue: sortOrder,
                    onChanged: (value) {
                      setState(() {
                        sortOrder = value;
                        _updateDisplayList();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text(
                    "По Убыванию",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.white),
                  ),
                  leading: Radio<String>(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromARGB(255, 255, 255, 255)),
                    value: 'DESC',
                    groupValue: sortOrder,
                    onChanged: (value) {
                      setState(() {
                        sortOrder = value;
                        _updateDisplayList();
                      });
                    },
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 226, 225, 225),
                ),
                
                ListTile(
                  title: const Text(
                    "По названию",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white ),
                  ),
                  leading: Radio<String>(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromARGB(255, 0, 0, 0)),
                    value: 'title',
                    groupValue: _sortCriteria,
                    onChanged: (value) {
                      setState(() {
                        _sortCriteria = value;
                        _updateDisplayList();
                      });
                    },
                  ),
                ),
                
                const Divider(
                  color: Color.fromARGB(255, 226, 225, 225),
                ),
                
                ListTile(
                  title: const Text(
                    "По времени прочтения",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  leading: Radio<String>(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromARGB(255, 0, 0, 0)),
                    value: 'timeToRead',
                    groupValue: _sortCriteria,
                    onChanged: (value) {
                      setState(() {
                        _sortCriteria = value;
                        _updateDisplayList();
                      });
                    },
                  ),
                ),
                
                const Divider(
                  color: Color.fromARGB(255, 226, 225, 225),
                ),
                
                ListTile(
                  title: const Text(
                    "По времени публикации",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  leading: Radio<String>(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromARGB(255, 0, 0, 0)),
                    value: 'uploadDate',
                    groupValue: _sortCriteria,
                    onChanged: (value) {
                      setState(() {
                        _sortCriteria = value;
                        _updateDisplayList();
                      });
                    },
                  ),
                ),
                 const Divider(
                  color: Color.fromARGB(255, 226, 225, 225),
                ),
                
                ListTile(
                  title: const Text(
                    "По автору",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  leading: Radio<String>(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Color.fromARGB(255, 0, 0, 0)),
                    value: 'uploadDate',
                    groupValue: _sortCriteria,
                    onChanged: (value) {
                      setState(() {
                        _sortCriteria = value;
                        _updateDisplayList();
                      });
                    },
                  ),
                ),
                SizedBox(height: 80,),
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
                        if (_sortCriteria != 'id') {
                          filterIcon = "assets/filterOn.svg";
                        } else {
                          filterIcon = "assets/filterOff.svg";
                        }
                      });
                      _updateDisplayList();
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        );
      }),
    );
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
                       controller: _serchCotroller,
                  hintText: "Поиск",
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
              itemCount: filtered.length,
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TopicScreen(
                                  item: filtered[index],
                                ),
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
                                    filtered[index]['title'] ?? "",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(filtered[index]['synopsis'] ?? "",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              textAlign: TextAlign.left,
                                              "Среднее время прочтения: ${filtered[index]['timeToRead'].toString()} минут",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                          "Дата публикации: ${filtered[index]['uploadDate']}.",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        )
                                          ],
                                        ),
                                      ),
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
                                  "${filtered[index]['uploadDate']}.",
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
                                                child: Text(
                                                  filtered[index]['title'] ?? "",
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white),
                                                  maxLines: 2,
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
                                                "Среднее время прочтения: ${filtered[index]['timeToRead'].toString()} минуты",
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                filtered[index]['author']
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

// class User {
//   dynamic id;
//   String name;
//   dynamic price;

//   User({required this.id, required this.name, required this.price});

//   factory User.fromRow(Map<String, dynamic> row) {
//     return User(
//       id: row['id'],
//       name: row['name'],
//       price: row['email'],
//     );
//   }
// }
// class ReadAllPage extends StatefulWidget {
//   const ReadAllPage({Key? key,}) : super(key: key);


//   @override
//   State<ReadAllPage> createState() => _ReadAllPageState();
// }

// class _ReadAllPageState extends State<ReadAllPage> {


// // List<Map<String, dynamic>> list = [];
// List<User> user = [];
//   Future<List<Map<String, dynamic>>> readAll() async {
//     print("Connecting to mysql server...");
//     List<Map<String, dynamic>> list = [];
//     // create connection
//     final conn = await MySQLConnection.createConnection(
//       host: "localhost",   //when you use simulator
//       //host: "10.0.2.2",   when you use emulator
//       //host: "localhost"
//       port: 3306,
//       userName: "root",
//       password: "Artem1999", // you need to replace with your password
//       databaseName: "LotusMind", // you need to replace with your db name
//     );

//     await conn.connect();

//     print("Connected");

//     // make query
//     var result = await conn.execute("SELECT * FROM items");

//     // print some result data
//     //print(result.numOfColumns);
//     //print(result.numOfRows);
//     //print(result.lastInsertID);
//     //print(result.affectedRows);


//     // print query result


//     for (final row in result.rows) {
//       final data = {
//         'id': row.colAt(0)!,
//         'name': row.colAt(1)!,
//         'price': row.colAt(2)!,
//       };
//       list.add(data);
//     }
//     print('je suis la');

//     print(list);

//     setState(() {
//       user = list.map((userData) => User(
//         id: userData['id'],
//         name: userData['name'],
//         price: userData['price']
//       ) ).toList();
//     });

  
//     // close all connections
//     await conn.close();

//      return list;

//   }


// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     readAll();

//   }

  
//   @override
//   Widget build(BuildContext context) {
    
//     return SafeArea(
//     child: ListView.builder(itemCount: user.length, itemBuilder: (context, index){
//         print(user);
//         return SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   child: ConstrainedBox(
//                     constraints: const BoxConstraints(
//                       maxHeight: 160,
//                       maxWidth: double.infinity,
//                     ),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: const Color.fromRGBO(139, 41, 244, 1)
//                                 .withOpacity(0.5),
//                             spreadRadius: 2,
//                             blurRadius: 5,
//                             offset: const Offset(
//                               0,
//                               3,
//                             ), // changes position of shadow
//                           ),
//                         ],
//                         color: const Color.fromARGB(0, 121, 70, 175),
//                         border: Border.all(
//                           color: AppColors.backgroundColor,
//                           width: 1,
//                         ),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 15),
//                       child: Material(
//                         color: Colors.transparent,
//                         child: InkWell(
//                           borderRadius: BorderRadius.circular(10.0),
//                           splashColor: AppColors.textFieldColor,
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => TopicScreen(
//                                   item: user[index],
//                                 ),
//                               ),
//                             );
//                           },
//                           onLongPress: () {
//                             HapticFeedback.vibrate();
//                             showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   actionsAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                   actions: [
//                                     MaterialButton(
//                                       onPressed: () {},
//                                       color: AppColors.textFieldColor,
//                                       child: const Text("Читать статью"),
//                                     ),
//                                     MaterialButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       color: AppColors.textFieldColor,
//                                       child: const Text("Закрыть"),
//                                     ),
//                                   ],
//                                   backgroundColor: AppColors.backgroundColor,
//                                   title: Text(
//                                     user[index].name,
//                                     style: const TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w700,
//                                         color: Colors.white),
//                                   ),
//                                   content: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(user[index].id,
//                                           style: const TextStyle(
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w700,
//                                               color: Colors.white)),
//                                       const SizedBox(
//                                         height: 50,
//                                       ),
//                                       Text(
//                                         textAlign: TextAlign.left,
//                                         "Среднее время прочтения: ${user[index].name} минут",
//                                         style: const TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w700,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       Text(
//                                         "Дата публикации: ${user[index].name}",
//                                         style: const TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w700,
//                                           color: Colors.white,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "${user[index].name}",
//                                   style: const TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w700,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             children: [
//                                               Expanded(
//                                                   child: Material(
//                                                 color: Colors.transparent,
//                                                 child: Text(
//                                                   user[index].price.toString(),
//                                                   style: const TextStyle(
//                                                       fontSize: 15,
//                                                       fontWeight:
//                                                           FontWeight.w700,
//                                                       color: Colors.white),
//                                                   maxLines: 2,
//                                                 ),
//                                               )),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 20,
//                                           ),
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 "Среднее время прочтения: ${ user[index].price} минуты",
//                                                 style: const TextStyle(
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w700,
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                               Text(
//                                                  user[index].price,
                                                  
//                                                 style: const TextStyle(
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w700,
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//       }
//       ),

//     );
//   }
// }


// class Product {
//   final int id;
//   final String name;
//   final double price;

//   Product({required this.id, required this.name, required this.price});

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       name: json['name'],
//       price: json['price'],
//     );
//   }
// }

// class ProductList extends StatefulWidget {
//   @override
//   _ProductListState createState() => _ProductListState();
// }

// class _ProductListState extends State<ProductList> {
//   List<Product> _products = [];

//   Future<void> _fetchProducts() async {
//     final conn = await MySqlConnection.connect(ConnectionSettings(
//      host: 'localhost',
//       port: 3306,
//       user: 'root',
//       password: 'Artem1999',
//       db: 'LotusMind',
//     ));

//     final results = await conn.query('SELECT * FROM items');

//     setState(() {
//       _products = results.map((row) {
//         return Product.fromJson({
//           'id': row[0],
//           'name': row[1],
//           'price': row[2],
//         });
//       }).toList();
//     });
//     print(_products);
//     await conn.close();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _fetchProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product List'),
//       ),
//       body: _products.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: _products.length,
//               itemBuilder: (context, index) {
//                 final product = _products[index];
//                 return ListTile(
//                   title: Text(product.name),
//                   trailing: Text('\$${product.price}'),
//                 );
//               },
//             ),
//     );
//   }
// }


// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
  
//   // создаем список для хранения данных из БД
//   List<mysql.ResultRow> _data = [];

//   // переопределяем метод initState(), чтобы получить данные в момент запуска приложения
//   @override
//   void initState() {
//     super.initState();
//     _getData();
//   }

//   Future<void> _getData() async {
//     // Создаем соединение к базе данных MySQL
//     final conn = await mysql.MySqlConnection.connect(mysql.ConnectionSettings(
//       host: 'localhost',
//       port: 3306,
//       user: 'root',
//       password: 'Artem1999',
//       db: 'LotusMind',
//     ));

//     // Делаем запрос, чтобы получить данные
//     final results = await conn.query('SELECT 1');
//      var results2 = await conn.query(
//       'select name from items');
//     // Закрываем соединение с базой данных после получения данных
//     await conn.close();
//     // print(results.toList());
//   for (var row in results2) {
//     print('Name: ${row[0]}');
//   }
//     // Сохраняем полученные данные в состоянии
//     setState(() {
//       _data = results.toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('MySQL ListView'),
//         ),
//         body: Column(
//           children: <Widget>[
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _data.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_data[index]['name']),
//                     subtitle: Text(_data[index]['price']),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }