import 'package:flutter/material.dart';



class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                ''' 
                LotusMind - это приложение для чтения, поиска и фильтрации статей. С помощью LotusMind пользователи могут находить интересные статьи о различных темах и сохранять их для чтения позже. 
                Приложение предоставляет профессионально написанный контент в различных областях, таких как наука, технологии, бизнес, здоровье, искусство и культура и др.В LotusMind пользователи имеют возможность использовать мощный инструмент поиска, чтобы найти статьи по ключевым словам или фразам, а также фильтровать результаты по авторам, темам и датам публикаций.LotusMind имеет удобный интерфейс с легко настраиваемыми настройками чтения, включая размер шрифта, цвет фона и режим ночного чтения.Пользователи также могут создавать закладки и делиться своими любимыми статьями со своими друзьями через социальные сети или другие мессенджеры.Статьи в LotusMind обновляются ежедневно, и каждая из них проходит качественную проверку перед публикацией.
                Пользователи могут быть уверены в содержании, и узнавать новости раньше, чем они станут общедоступными в интернете.В целом, LotusMind - это полезное приложение для людей, которые хотят быть в курсе последних тенденций и развивать свои знания в различных областях.''', style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          ],
        ),
      ],
    );
  }
}