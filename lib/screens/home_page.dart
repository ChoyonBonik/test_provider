// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// //
// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});
// //
// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }
// //
// // class _HomePageState extends State<HomePage> {
// //
// //   @override
// //   void initState() {
// //     final provider = Provider.of<MenuProvider>(context, listen: false);
// //     provider.getDataFromAPI();
// //     super.initState();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Placeholder();
// //   }
// // }
//
// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:provider/provider.dart';
//
// import '../providers/menu_provider.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     final provider = Provider.of<MenuProvider>(context, listen: false);
//     provider.getDataFromAPI();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     log('build called');
//     final provider = Provider.of<MenuProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Provider API Call'),
//         centerTitle: true,
//       ),
//       body: provider.isLoading
//           ? getLoadingUI()
//           : provider.error.isNotEmpty
//           ? getErrorUI(provider.error)
//           : getBodyUI(),
//     );
//   }
//
//   Widget getLoadingUI() {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: const [
//           SpinKitFadingCircle(
//             color: Colors.blue,
//             size: 80,
//           ),
//           Text(
//             'Loading...',
//             style: TextStyle(fontSize: 20, color: Colors.blue),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget getErrorUI(String error) {
//     return Center(
//       child: Text(
//         error,
//         style: const TextStyle(color: Colors.red, fontSize: 22),
//       ),
//     );
//   }
//
//   Widget getBodyUI() {
//     final provider = Provider.of<MenuProvider>(context, listen: false);
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             onChanged: (value) {
//               // provider.search(value);
//             },
//             decoration: InputDecoration(
//               hintText: 'Search',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               suffixIcon: const Icon(Icons.search),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Consumer(
//             builder: (context, MenuProvider menuProvider, child) =>
//                 ListView.builder(
//                   itemCount: menuProvider.menus.data.length,
//                   itemBuilder: (context, index) => ListTile(
//                     leading: CircleAvatar(
//                       radius: 22,
//                       // backgroundImage: NetworkImage(
//                       //     petsProvider.serachedPets.data[index].petImage),
//                       backgroundColor: Colors.white,
//                     ),
//                     title: Text(menuProvider.menus.data[index].header),
//                     trailing: menuProvider.menus.data[index].child
//                         ? const SizedBox()
//                         : const Icon(
//                       Icons.pets,
//                       color: Colors.red,
//                     ),
//                   ),
//                 ),
//           ),
//         ),
//       ],
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../models/menus.dart';
// import '../providers/menu_provider.dart';
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Menu App'),
//       ),
//       body: Consumer<MenuProvider>(
//         builder: (context, menuProvider, child) {
//           if (menuProvider.isLoading) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (menuProvider.error.isNotEmpty) {
//             return Center(
//               child: Text('Error: ${menuProvider.error}'),
//             );
//           } else {
//             return Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextField(
//                     onChanged: (value) {
//                       menuProvider.search(value.toLowerCase());
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'Search by Header',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: menuProvider.serachedMenus.data.length,
//                     itemBuilder: (context, index) {
//                       Datum menu = menuProvider.serachedMenus.data[index];
//                       return ListTile(
//                         title: Text(menu.header),
//                         // Add more details or customize as needed
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Page'),
      ),
      body: FutureBuilder(
        future: Provider.of<MenuProvider>(context).fetchMenuData('http://192.168.0.143:8080/main/menus'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError) {
            return Center(child: Text('Error fetching data: ${snapshot.error}'));
          }
          else {
            return ListView.builder(
              itemCount: Provider.of<MenuProvider>(context).menu?.data.length ?? 0,
              itemBuilder: (context, index) {
                final menu = Provider.of<MenuProvider>(context).menu!.data[index];
                return ListTile(
                  title: Text(menu.header),
                  // Add more UI elements as needed
                );
              },
            );
          }
        },
      ),
    );
  }
}