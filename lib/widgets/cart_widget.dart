// import 'dart:js';
//
// import 'package:flutter/material.dart';
// import 'package:pas_ecommerce/models/BarangResponseModel.dart';
// import 'package:pas_ecommerce/provider/api/ControllerListProduct.dart';
// import 'package:provider/provider.dart';
//
// class CartItemCard extends StatelessWidget {
//
//   final int quantity;
//   final VoidCallback onDelete;
//   final product = Provider.of(context,listen: false);
//
//   const CartItemCard({
//     Key? key,
//     required this.product,
//     required this.quantity,
//     required this.onDelete,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
//       child: Row(
//         children: [
//           Expanded(
//             child: Card(
//               child: ListTile(
//                 leading: Image.network(
//                   product.products.,
//                   width: 60,
//                   height: 60,
//                   fit: BoxFit.cover,
//                 ),
//                 title: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       product.namaBarang,
//                       style: const TextStyle(
//                           fontSize: 10,
//                           color: Color.fromARGB(255, 81, 80, 112),
//                           fontWeight: FontWeight.w600),
//                     ),
//                     const SizedBox(height: 5,),
//                     Row(
//                       children: [
//                         const Icon(Icons.download,
//                           color: Color.fromARGB(255, 255, 142, 110), size: 20,),
//                         const SizedBox(width: 6,),
//                         Text(
//                           'Jumlah Barang: $quantity',
//                           style: const TextStyle(
//                               fontSize: 10,
//                               color: Color.fromARGB(255, 81, 80, 112),
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.1,
//             width: 50,
//             decoration: const BoxDecoration(
//               color: Color.fromARGB(255, 230, 112, 104),
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//             child: IconButton(
//               icon: const Icon(Icons.delete, color: Colors.white),
//               onPressed: onDelete,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }