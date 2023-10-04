import 'package:maidapps2/screens/home/profile2.dart';
import 'package:maidapps2/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:maidapps2/screens/home/booking.dart';
import 'package:maidapps2/screens/home/profile.dart';
import 'package:maidapps2/database/page/listpage.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Homepage();
  }
}

class _Homepage extends State<Homepage> {
  final AuthService _auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    final SignOut = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          await _auth.signOut();
        },
        child: Text(
          "Log out",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );

    final maidlist = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Color.fromRGBO(255, 198, 211, 1),
        width: double.infinity,
        height: 100.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            //color: Colors.green,
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 100,
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    image: DecorationImage(
                        image: AssetImage('assets/images/face.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Container(
                    //color: Colors.yellow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Kapoor',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '30 years old',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '5 years experience',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'rating: 3.6',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Book',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    final maidlist2 = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.grey,
        width: double.infinity,
        height: 100.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            //color: Colors.green,
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 100,
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    image: DecorationImage(
                        image: AssetImage('assets/images/face2.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Container(
                    //color: Colors.yellow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Kapoor',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '30 years old',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '5 years experience',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'rating: 3.6',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Book',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    final searchbar = Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Meido'),
          backgroundColor: Colors.pink,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.pink,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
              ),
              IconButton(
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListPage()),

                        (route) => false);
                  },
                  icon: Icon(Icons.book))
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              searchbar,
              Maidlist('Surianti', '56', '3.0', 'RM11/hr','assets/images/face.jpg', Profile()),
              Maidlist('Jessica. C', '102', '3.7', 'RM200-RM300','assets/images/face2.jpg', Profile2()),
              Maidlist('Christine. J', '102', '3.7', 'RM200-RM300','assets/images/face3.jpg', Profile()),
              Maidlist('Lisa. T', '102', '3.7', 'RM200-RM300', 'assets/images/face4.jpg',Profile()),


              SignOut,
            ],
          ),
        ));
  }
}

class Maidlist extends StatelessWidget {
  String name;
  String jobs;
  String rating;
  String price;
  String image;
  Widget page;

  Maidlist(this.name, this.jobs, this.rating, this.price, this.image, this.page,  {super.key});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)

            ),
            color: Color.fromRGBO(255, 198, 211, 1),
          ),

          width: double.infinity,
          height: 100.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //color: Colors.green,
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                      ),
                      // color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Jobs',
                                  ),
                                  Text(
                                      jobs,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'rating',
                                  ),
                                  Text(
                                      rating,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'price',
                                  ),
                                  Text(
                                      price,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class Maidlist2 extends StatelessWidget {
//   String name;
//   String books;
//   String rating;
//   String price;
//
//   Maidlist2(this.name, this.books, this.rating, this.price, {super.key})
//
//   Widget build(BuildContext context){
//     return Padding(
//         padding: padding)
//
//     )
//   }
// }

// class Maidlistbutton extends StatelessWidget {
//   String name;
//   String age;
//   String numberofbook;
//   String rating;
//
//   Maidlistbutton(this.name, this.age, this.numberofbook, this.rating,{super.key})
//
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.all(8.0),
//             child: ElevatedButton(
//         onPressed: ,
//     ),
//     );
//   }
// }
