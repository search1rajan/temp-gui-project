// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:logogui/Main_Navigate_pages/android_info.dart';
import 'package:logogui/Main_Navigate_pages/assembly.dart';
import 'package:logogui/Main_Navigate_pages/c_logo.dart';
import 'package:logogui/Main_Navigate_pages/c_s_logo.dart';
import 'package:logogui/Main_Navigate_pages/dart_info.dart';
import 'package:logogui/Main_Navigate_pages/flutter_logo.dart';
import 'package:logogui/Main_Navigate_pages/go_info.dart';
import 'package:logogui/Main_Navigate_pages/java_logo.dart';
import 'package:logogui/Main_Navigate_pages/kotlin_info.dart';
import 'package:logogui/Main_Navigate_pages/MATLAB_info.dart';
import 'package:logogui/Main_Navigate_pages/PHP.dart';
import 'package:logogui/Main_Navigate_pages/perl_info.dart';
import 'package:logogui/Main_Navigate_pages/Python.dart';
import 'package:logogui/Main_Navigate_pages/Rlogo.dart';
import 'package:logogui/Main_Navigate_pages/Rubyinfo.dart';
import 'package:logogui/Main_Navigate_pages/Rust.dart';
import 'package:logogui/Main_Navigate_pages/Swiftinfo.dart';
import 'package:logogui/Main_Navigate_pages/cssinfo.dart';
import 'package:logogui/Main_Navigate_pages/html_info.dart';
import 'package:logogui/Main_Navigate_pages/java_script.dart';

class Navigatepage extends StatelessWidget {
  const Navigatepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.language, size: 20, fontWeight: FontWeight.bold),
            Text(
              ' Programing Languages',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Times New Roman",
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FlutterCourse()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    FlutterLogo(size: 50),

                    Text(
                      'Learn Flutter and Build Powerful\n'
                      'Responsive Apps with Flutter and Dart Language',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Javalogo()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://icon.icepanel.io/Technology/png-shadow-512/Java.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Learn Java and Build Powerful\n'
                      'Applications with Java Spring Framework',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RLogo()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/1b/R_logo.svg/960px-R_logo.svg.png?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=thumbnail',
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'Learn R Programming and Work with Data\n'
                      'for Data Analysis, Statistics and Visualization',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Clogo()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://thumb.wikimedia.org/wikipedia/commons/thumb/1/18/C_Programming_Language.svg/1920px-C_Programming_Language.svg.png?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=thumbnail',
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Learn C Programming and Understand the Basics\n'
                      'of Programming, Memory Management and Systems',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CSLogo()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/4/4f/Csharp_Logo.png?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=original',
                      height: 70,
                      width: 70,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Learn C# Programming and Build Powerful\n'
                      'Applications with C# and .NET Framework',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Androidinfo()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Android_Logo_2014_-_2019.svg/1280px-Android_Logo_2014_-_2019.svg.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Learn Android Development and Build Powerful\n'
                      'Mobile Applications using Android and Kotlin',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cssinfo()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://banner2.cleanpng.com/20201022/zse/transparent-software-development-logos-icon-css-icon-1713858161405.webp',
                      height: 70,
                      width: 70,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Learn CSS and Design Beautiful Web Pages\n'
                      'with Styling, Layout and Responsive Design',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Htmlinfo()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://cdn.pixabay.com/photo/2017/08/05/11/16/logo-2582748_1280.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Learn HTML and Create the Structure of Web Pages\n'
                      'using Headings, Images, Links, Forms and Tables',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Javascript()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://static.vecteezy.com/system/resources/previews/047/247/648/non_2x/3d-javascript-icon-symbols-of-software-language-png.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'JavaScript',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      'Learn JavaScript and Make Web Pages Interactive\n'
                      'with Dynamic Features, Events and User Interaction',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Python()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://files.prepinsta.com/2020/07/python-removebg-preview-300x300.webp',
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Learn Python and Build Powerful Applications\n'
                      'for Web Development, AI, Data Science and Automation',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Goinfo()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://go.dev/blog/go-brand/Go-Logo/PNG/Go-Logo_Blue.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Learn Go Programming and Build Fast Applications\n'
                      'for Backend, APIs, Cloud and Distributed Systems',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Rust()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Rust_programming_language_black_logo.svg/1280px-Rust_programming_language_black_logo.svg.png?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=thumbnail',
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Learn Rust Programming and Build Fast, Reliable\n'
                      'Applications with Performance and Memory Safety',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Php()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://www.php.net/images/logos/new-php-logo.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Learn PHP and Build Dynamic Web Applications\n'
                      'with Backend Development and Database Integration',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Swiftinfo()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://www.pngitem.com/pimgs/m/31-312171_swift-programming-language-logo-hd-png-download.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Learn Swift and Build Powerful Applications\n'
                      'for iOS, macOS and Other Apple Platforms',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Rubyinfo()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://thumb.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1280px-Ruby_logo.svg.png?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=thumbnail',
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Learn Ruby and Build Powerful Web Applications\n'
                      'with Ruby Programming and Ruby on Rails',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Kotlininfo()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://static.vecteezy.com/system/resources/previews/051/336/362/non_2x/kotlin-transparent-logo-free-png.png',
                      height: 80,
                      width: 80,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Learn Kotlin and Build Powerful Applications\n'
                      'for Android, Backend and Modern Software Development',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dartinfo()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/dart-programming-language-icon.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Learn Dart and Build Cross-Platform Applications\n'
                      'using Dart Programming Language with Flutter',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Matlabinfo()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=original',
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Learn MATLAB and Work with Mathematical Computing\n'
                      'for Data Analysis, Visualization, Engineering and Simulation',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Assembly()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/512/9748/9748677.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Learn Assembly Language and Understand Low-Level\n'
                      'Programming, Computer Hardware and Memory Management',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Perlinfo()),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Perl-logo.svg/1280px-Perl-logo.svg.png?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=thumbnail',
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Learn Perl and Build Powerful Applications\n'
                      'for Scripting, Text Processing and Automation',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
