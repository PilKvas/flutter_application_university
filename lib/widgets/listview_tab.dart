import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_university/app_colors.dart';
import 'package:flutter_application_university/screens/topic_list_screen.dart';
import 'package:flutter_application_university/widgets/custom_textfield_widget.dart';
import 'package:flutter_application_university/widgets/topic_element.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Item {
  final int id;
  final String synopsis;
  final String title;
  final String content;
  final List<String> tag;
  final int timeToRead;
  final String author;

  final DateTime upload;

  Item( 

      {required this.upload,
      required this.id,
      required this.title,
      required this.content,
      required this.tag,
      required this.timeToRead,
      required this.synopsis,
      required this.author,});
}

// class User {

//     final String title;
//   final String description;

//   User(this.title, this.description);

// static User fromJson(Map<String, dynamic> json) => User(
//       description: json["desctiption"],
//       title: json['title'],
//     );
// }

// Stream<List<User>> readUsers() => FirebaseFirestore.instance
//     .collection("test")
//     .snapshots()
//     .map((event) => event.docs.map((e) => User.fromJson(e.data())).toList());

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   final CollectionReference _collectionReference =
//       FirebaseFirestore.instance.collection('test');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sorted Data'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _collectionReference.orderBy('title').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           final dataList = snapshot.data!.docs
//               .map((doc) => MyModel.fromFirestore(doc))
//               .toList();
//           return ListView.builder(
//             itemCount: dataList.length,
//             itemBuilder: (context, index) {
//               final item = dataList[index];
//               return ListTile(
//                 title: Text(item.title),
//                 subtitle: Text(item.description),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class MyModel {
//   final String title;
//   final String description;

//   MyModel({
//     required this.title,
//     required this.description,
//   });

//   factory MyModel.fromFirestore(DocumentSnapshot doc) {
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//     return MyModel(
//       description: data['description'] ?? '',
//       title: data['title'] ?? '',
//     );
//   }
// }

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
    author: "Markaty",
    title: "Сокращения штата в Meta",
    id: 1,
    content:
        "Недавние увольнения в Meta* затронули команды обслуживания клиентов и оставили сообщества и пользователей в Facebook** и Instagram** без надлежащей поддержки. Meta впервые объявила о планах сократить более 11 тыс. сотрудников в ноябре прошлого года. В марте 2023 стало известно об увольнении ещё 10 тыс. человек. Таким образом корпорация осуществляла свою программу сокращения расходов. Сейчас CNBC и Insider пишут о типичных проблемах, которые всё чаще стали появляться у пользователей соцсетей.  Например, владелица популярного аккаунта в Instagram с 250 тыс. подписчиков пожаловалась CNBC на рост числа мошенников, которые крадут её фотографии, создают поддельные аккаунты и пытаются зарабатывать от её имени. Все обращения героини публикации в поддержку соцсети, по её словам, «уходили в пустоту». Проблемы начали решаться только после того, как она смогла выйти на людей в Meta, благодаря личным связям.  Ещё одна героиня статьи, сертифицированный менеджер сообщества Meta, курировала в Facebook группу на 420 тыс. человек. В феврале этого года система, которая использовалась для отслеживания аналитики на платформе, стала показывать нулевую активность пользователей, в то время как она продолжала оставаться на прежнем уровне. Когда модератор попыталась связаться со службой поддержки, её обращение проигнорировали. Раньше у менеджера сообщества был прямой доступ к Groups Support, команде поддержки для решения технических проблем Facebook, но она была расформирована в январе. Проблема, как и в первом случае, решилась после обращения к друзьям со связями в Meta.  Insider пообщался с одной из представительниц клиентской службы Meta: она работает в Португалии, зарабатывает чуть больше минимальной оплаты и получает проклятья и угрозы от разгневанных клиентов. Из-за того, что компания сосредоточена на метавселенной, «кажется, что их приоритеты находятся в другом месте,» — прокомментировала она положение дел.   Издания вспоминают, что недавно корпорация запустила Meta Verified, платную верификацию, которая за деньги пользователей должна обеспечить им дополнительную безопасность. Но говорить о результатах внедрения Meta Verified ещё рано.    Ранее Марк Цукерберг объяснял, что увольнения были частью «Года эффективности» Meta, в течение которого компания сократит расходы после «разочаровывающих» результатов четвёртого квартала 2022 года. В своём комментарии Insider напомнил, что подразделение Reality Lab, занимающееся метавселенной, потеряло \$13,7 млрд в прошлом году.",

    tag: ["IT"],
    timeToRead: 3,
    upload: DateTime.parse("2022-12-22"),
    synopsis: "Недавние увольнения в Meta* затронули команды обслуживания клиентов и оставили сообщества и пользователей в Facebook** и Instagram** без надлежащей поддержки. Meta впервые объявила о планах сократить более 11 тыс. сотрудников в ноябре прошлого года. В марте 2023 стало известно об увольнении ещё 10 тыс. человек. Таким образом корпорация осуществляла свою программу сокращения расходов. Сейчас CNBC и Insider пишут о типичных проблемах, которые всё чаще стали появляться у пользователей соцсетей.  ",
  ),
  Item(
     author: "Тимофей Захаров",
      title: "Про импортозамещение",
      id: 2,
      content: "В субботу вечером я, как всегда, сидел и снифил трафик со своего телефона. Внезапно, открыв приложение «Ситимобил» я увидел, что один интересный запрос выполняется без какой-либо аутентификации.  Это был запрос на получение информации о ближайших машинах. Выполнив этот запрос несколько раз с разными параметрами я понял, что можно выгружать данные о таксистах практически в реалтайме. Вы только представьте, сколько интересного можно теперь узнать!С чего все началось?  Да, я действительно сидел и смотрел трафик с телефона. Дело в том, что я инженер, и постоянно изучаю, как работают технологии и разные вещи вокруг меня. Так было и в этот раз.  Я использовал mitmproxy (Man In The Middle Proxy) — программа для атаки «человек посередине». Есть много инструкций по её установке и настройке, а общий принцип такой:  Подключаешься к домашнему WiFi с телефона и компьютера Запускаешь mitmproxy на компьютере В телефоне прописываешь локальный адрес компьютера как основной прокси (уже можно смотреть внутрь http) Скачиваешь и подтверждаешь сертификат на телефоне (позволяет заглядывать внутрь https)  Теперь, грубо говоря, весь трафик с телефона идет сначала на компьютер, расшифровывается, показывается на экране, зашифровывается и идет дальше. И наоборот.  Таким способом я изучаю, как сделаны разные приложения, а иногда нахожу очень интересные вещи. Например, в этот раз я увидел запрос от приложения «Ситимобил» на получение информации о ближайших водителях, который не требовал аутентификации.  Bug bounty Mail.ru  Я оформил всю информацию на hackerone и отправил на рассмотрение. После опыта взаимодействия с баг баунти Яндекса, я не рассчитывал на быстрый ответ, однако уже через 3 минуты некто «3apa3a» закрыл мой репорт. Отличная скорость, Mail.ru!  В ответе написали, что данные показываются пользователю в приложении, а значит не являются чувствительными и защищать их не надо.    Ну что ж. Раз это публичные данные, давайте развлекаться!  Как получить данные?  Информацию о 10 ближайших водителях к геопозиции можно получить, отправив POST запрос на следующий адрес: ",
      tag: ["IT"],
      timeToRead: 2,
      upload: DateTime.parse("2020-09-12"),
      synopsis: "Давно хотел написать статью на такую интересную и больную тему как импортозамещение. А именно, как это все выглядит и чем пахнет в той сфере, где я работаю – разработка и производство электронной техники, а конкретно – аппаратуры связи. У меня накопилось множество мыслей, занимательных историй, ознакомиться с которыми будет наверняка небезынтересно даже тем людям, кто далек от этой сферы.  ",
  ),
  Item(
    author: "densss2",
      title:
          "Клавиатура, идея, две руки",
      id: 3,
      content: "Случалось ли в твоей жизни, %username%, такое, когда тебе продолжительное время хотелось странного? Неважно чего — ведь у каждого разные вкусы и предпочтения. Моя страсть сидела во мне долго, но однажды всё-таки вырвалась наружу. Мне нравится делать необычные вещи, и мне всегда нравился моддинг как средство самовыражения. Несколько лет назад я вдохновился изделиями моддеров из разных стран и начал обдумывать несколько своих проектов. В частности, мне очень хотелось сделать стилизованную под девятнадцатый век клавиатуру.Изучив работы таких известных моддеров как Filimon и Datamancer, я приступил к работе. Сразу хочу сказать, что хотя я и не жалуюсь на полное отсутствие воображения, но люблю получать предсказуемый результат. Поэтому, перед тем как взяться за инструмент, я постарался смоделировать то что хочу получить в итоге. Ещё одной особенностью данного проекта является то, что всё программное обеспечение, которое я использовал в работе, является открытым и свободным: ОС — Debian testing, софт — Blender, LibreCAD, Inkscape.  Так как мой замысел состоял в том чтобы сделать клавиатуру в деревянном корпусе, прежде всего мне необходимо было знать сечения деревянных заготовок, которые мне понадобятся. Тщательно измерив клавиатуру-донор, я засел за черчение и моделирование. ",
      tag: ["IT"],
      timeToRead: 10,
      upload: DateTime.parse("2019-05-14"),
      synopsis: "Случалось ли в твоей жизни, %username%, такое, когда тебе продолжительное время хотелось странного? Неважно чего — ведь у каждого разные вкусы и предпочтения. Моя страсть сидела во мне долго, но однажды всё-таки вырвалась наружу. Мне нравится делать необычные вещи, и мне всегда нравился моддинг как средство самовыражения. Несколько лет назад я вдохновился изделиями моддеров из разных стран и начал обдумывать несколько своих проектов. В частности, мне очень хотелось сделать стилизованную под девятнадцатый век клавиатуру.",
      ),
  Item(
      author: 'Сергей Крупник',
      title: "Нашел всех водителей",
      id: 4,
      content: "В субботу вечером я, как всегда, сидел и снифил трафик со своего телефона. Внезапно, открыв приложение «Ситимобил» я увидел, что один интересный запрос выполняется без какой-либо аутентификации.  Это был запрос на получение информации о ближайших машинах. Выполнив этот запрос несколько раз с разными параметрами я понял, что можно выгружать данные о таксистах практически в реалтайме. Вы только представьте, сколько интересного можно теперь узнать!С чего все началось?  Да, я действительно сидел и смотрел трафик с телефона. Дело в том, что я инженер, и постоянно изучаю, как работают технологии и разные вещи вокруг меня. Так было и в этот раз.  Я использовал mitmproxy (Man In The Middle Proxy) — программа для атаки «человек посередине». Есть много инструкций по её установке и настройке, а общий принцип такой:  Подключаешься к домашнему WiFi с телефона и компьютера Запускаешь mitmproxy на компьютере В телефоне прописываешь локальный адрес компьютера как основной прокси (уже можно смотреть внутрь http) Скачиваешь и подтверждаешь сертификат на телефоне (позволяет заглядывать внутрь https)  Теперь, грубо говоря, весь трафик с телефона идет сначала на компьютер, расшифровывается, показывается на экране, зашифровывается и идет дальше. И наоборот.  Таким способом я изучаю, как сделаны разные приложения, а иногда нахожу очень интересные вещи. Например, в этот раз я увидел запрос от приложения «Ситимобил» на получение информации о ближайших водителях, который не требовал аутентификации.  Bug bounty Mail.ru  Я оформил всю информацию на hackerone и отправил на рассмотрение. После опыта взаимодействия с баг баунти Яндекса, я не рассчитывал на быстрый ответ, однако уже через 3 минуты некто «3apa3a» закрыл мой репорт. Отличная скорость, Mail.ru!  В ответе написали, что данные показываются пользователю в приложении, а значит не являются чувствительными и защищать их не надо.    Ну что ж. Раз это публичные данные, давайте развлекаться!  Как получить данные?  Информацию о 10 ближайших водителях к геопозиции можно получить, отправив POST запрос на следующий адрес: ",
      tag: ["IT"],
      timeToRead: 4,
      upload: DateTime.parse("2018-03-17"),
      synopsis: "В субботу вечером я, как всегда, сидел и снифил трафик со своего телефона. Внезапно, открыв приложение «Ситимобил» я увидел, что один интересный запрос выполняется без какой-либо аутентификации.  Это был запрос на получение информации о ближайших машинах. Выполнив этот запрос несколько раз с разными параметрами я понял, что можно выгружать данные о таксистах практически в реалтайме. Вы только представьте, сколько интересного можно теперь узнать! ",
      ),
  Item(
     author: 'Сергей Крупник',
      title:
          "10 технологий, которые обязательно изучить разработчику в 2021 году",
      id: 5,
       content: "Случалось ли в твоей жизни, %username%, такое, когда тебе продолжительное время хотелось странного? Неважно чего — ведь у каждого разные вкусы и предпочтения. Моя страсть сидела во мне долго, но однажды всё-таки вырвалась наружу. Мне нравится делать необычные вещи, и мне всегда нравился моддинг как средство самовыражения. Несколько лет назад я вдохновился изделиями моддеров из разных стран и начал обдумывать несколько своих проектов. В частности, мне очень хотелось сделать стилизованную под девятнадцатый век клавиатуру.Изучив работы таких известных моддеров как Filimon и Datamancer, я приступил к работе. Сразу хочу сказать, что хотя я и не жалуюсь на полное отсутствие воображения, но люблю получать предсказуемый результат. Поэтому, перед тем как взяться за инструмент, я постарался смоделировать то что хочу получить в итоге. Ещё одной особенностью данного проекта является то, что всё программное обеспечение, которое я использовал в работе, является открытым и свободным: ОС — Debian testing, софт — Blender, LibreCAD, Inkscape.  Так как мой замысел состоял в том чтобы сделать клавиатуру в деревянном корпусе, прежде всего мне необходимо было знать сечения деревянных заготовок, которые мне понадобятся. Тщательно измерив клавиатуру-донор, я засел за черчение и моделирование. ",
      tag: ["IT"],
      timeToRead: 6,
      upload: DateTime.parse("2021-01-10"),
      synopsis: "content",
      ),
  Item(
     author: 'Сергей Крупник',
    title: "CRISPR-Cas: обезьяны-клонирующие эксперты",
    id: 6,
     content: "Случалось ли в твоей жизни, %username%, такое, когда тебе продолжительное время хотелось странного? Неважно чего — ведь у каждого разные вкусы и предпочтения. Моя страсть сидела во мне долго, но однажды всё-таки вырвалась наружу. Мне нравится делать необычные вещи, и мне всегда нравился моддинг как средство самовыражения. Несколько лет назад я вдохновился изделиями моддеров из разных стран и начал обдумывать несколько своих проектов. В частности, мне очень хотелось сделать стилизованную под девятнадцатый век клавиатуру.Изучив работы таких известных моддеров как Filimon и Datamancer, я приступил к работе. Сразу хочу сказать, что хотя я и не жалуюсь на полное отсутствие воображения, но люблю получать предсказуемый результат. Поэтому, перед тем как взяться за инструмент, я постарался смоделировать то что хочу получить в итоге. Ещё одной особенностью данного проекта является то, что всё программное обеспечение, которое я использовал в работе, является открытым и свободным: ОС — Debian testing, софт — Blender, LibreCAD, Inkscape.  Так как мой замысел состоял в том чтобы сделать клавиатуру в деревянном корпусе, прежде всего мне необходимо было знать сечения деревянных заготовок, которые мне понадобятся. Тщательно измерив клавиатуру-донор, я засел за черчение и моделирование. ",
    tag: ["Biology"],
    timeToRead: 15,
    upload: DateTime.parse("2020-07-19"),
    synopsis: 'content',
  ),
  Item(
     author: 'Сергей Крупник',
    title:
        "Открытие нового безопасного подхода к передаче трансгенных генов в мышьях, используя AAV-сядущие векторы",
    id: 7,
     content: "Случалось ли в твоей жизни, %username%, такое, когда тебе продолжительное время хотелось странного? Неважно чего — ведь у каждого разные вкусы и предпочтения. Моя страсть сидела во мне долго, но однажды всё-таки вырвалась наружу. Мне нравится делать необычные вещи, и мне всегда нравился моддинг как средство самовыражения. Несколько лет назад я вдохновился изделиями моддеров из разных стран и начал обдумывать несколько своих проектов. В частности, мне очень хотелось сделать стилизованную под девятнадцатый век клавиатуру.Изучив работы таких известных моддеров как Filimon и Datamancer, я приступил к работе. Сразу хочу сказать, что хотя я и не жалуюсь на полное отсутствие воображения, но люблю получать предсказуемый результат. Поэтому, перед тем как взяться за инструмент, я постарался смоделировать то что хочу получить в итоге. Ещё одной особенностью данного проекта является то, что всё программное обеспечение, которое я использовал в работе, является открытым и свободным: ОС — Debian testing, софт — Blender, LibreCAD, Inkscape.  Так как мой замысел состоял в том чтобы сделать клавиатуру в деревянном корпусе, прежде всего мне необходимо было знать сечения деревянных заготовок, которые мне понадобятся. Тщательно измерив клавиатуру-донор, я засел за черчение и моделирование. ",
    tag: ["Biology"],
    timeToRead: 4,
    upload: DateTime.parse("2023-02-01"),
    synopsis: 'content',
  ),
  Item(
     author: 'Сергей Крупник',
    title: "Эль Ниньо может привести к глохнущим анемонам",
    id: 6,
     content: "Случалось ли в твоей жизни, %username%, такое, когда тебе продолжительное время хотелось странного? Неважно чего — ведь у каждого разные вкусы и предпочтения. Моя страсть сидела во мне долго, но однажды всё-таки вырвалась наружу. Мне нравится делать необычные вещи, и мне всегда нравился моддинг как средство самовыражения. Несколько лет назад я вдохновился изделиями моддеров из разных стран и начал обдумывать несколько своих проектов. В частности, мне очень хотелось сделать стилизованную под девятнадцатый век клавиатуру.Изучив работы таких известных моддеров как Filimon и Datamancer, я приступил к работе. Сразу хочу сказать, что хотя я и не жалуюсь на полное отсутствие воображения, но люблю получать предсказуемый результат. Поэтому, перед тем как взяться за инструмент, я постарался смоделировать то что хочу получить в итоге. Ещё одной особенностью данного проекта является то, что всё программное обеспечение, которое я использовал в работе, является открытым и свободным: ОС — Debian testing, софт — Blender, LibreCAD, Inkscape.  Так как мой замысел состоял в том чтобы сделать клавиатуру в деревянном корпусе, прежде всего мне необходимо было знать сечения деревянных заготовок, которые мне понадобятся. Тщательно измерив клавиатуру-донор, я засел за черчение и моделирование. ",
    tag: ["Biology"],
    timeToRead: 2,
    upload: DateTime.parse("2018-03-05"),
    synopsis: "synopsis:",
  ),
  Item(
     author: 'Сергей Крупник',
    title:
        "Изучение динамики геномных изменений у пациентов с диабетом 2-го типа, используя одноядерный полиморфизм",
    id: 6,
     content: "Случалось ли в твоей жизни, %username%, такое, когда тебе продолжительное время хотелось странного? Неважно чего — ведь у каждого разные вкусы и предпочтения. Моя страсть сидела во мне долго, но однажды всё-таки вырвалась наружу. Мне нравится делать необычные вещи, и мне всегда нравился моддинг как средство самовыражения. Несколько лет назад я вдохновился изделиями моддеров из разных стран и начал обдумывать несколько своих проектов. В частности, мне очень хотелось сделать стилизованную под девятнадцатый век клавиатуру.Изучив работы таких известных моддеров как Filimon и Datamancer, я приступил к работе. Сразу хочу сказать, что хотя я и не жалуюсь на полное отсутствие воображения, но люблю получать предсказуемый результат. Поэтому, перед тем как взяться за инструмент, я постарался смоделировать то что хочу получить в итоге. Ещё одной особенностью данного проекта является то, что всё программное обеспечение, которое я использовал в работе, является открытым и свободным: ОС — Debian testing, софт — Blender, LibreCAD, Inkscape.  Так как мой замысел состоял в том чтобы сделать клавиатуру в деревянном корпусе, прежде всего мне необходимо было знать сечения деревянных заготовок, которые мне понадобятся. Тщательно измерив клавиатуру-донор, я засел за черчение и моделирование. ",
    tag: ["Biology"],
    timeToRead: 7,
    upload: DateTime.parse("2018-10-11"),
    synopsis: 'content',
  ),
  Item(
     author: 'Сергей Крупник',
    title: "Морские игрушки",
    id: 6,
     content: "Случалось ли в твоей жизни, %username%, такое, когда тебе продолжительное время хотелось странного? Неважно чего — ведь у каждого разные вкусы и предпочтения. Моя страсть сидела во мне долго, но однажды всё-таки вырвалась наружу. Мне нравится делать необычные вещи, и мне всегда нравился моддинг как средство самовыражения. Несколько лет назад я вдохновился изделиями моддеров из разных стран и начал обдумывать несколько своих проектов. В частности, мне очень хотелось сделать стилизованную под девятнадцатый век клавиатуру.Изучив работы таких известных моддеров как Filimon и Datamancer, я приступил к работе. Сразу хочу сказать, что хотя я и не жалуюсь на полное отсутствие воображения, но люблю получать предсказуемый результат. Поэтому, перед тем как взяться за инструмент, я постарался смоделировать то что хочу получить в итоге. Ещё одной особенностью данного проекта является то, что всё программное обеспечение, которое я использовал в работе, является открытым и свободным: ОС — Debian testing, софт — Blender, LibreCAD, Inkscape.  Так как мой замысел состоял в том чтобы сделать клавиатуру в деревянном корпусе, прежде всего мне необходимо было знать сечения деревянных заготовок, которые мне понадобятся. Тщательно измерив клавиатуру-донор, я засел за черчение и моделирование. ",
    tag: ["Biology"],
    timeToRead: 5,
    upload: DateTime.parse("2018-05-12"),
    synopsis: 'contetent',
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
        return item.title.toLowerCase().contains(_serchCotroller.text.toLowerCase());
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyWidget1(
                                  item: originalItems[index],
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
                                      Text(originalItems[index].synopsis,
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
                                                  tag:
                                                      'hero-tag-${originalItems[index].title}',
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
