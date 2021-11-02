import 'package:flutter/material.dart';
import 'package:retailer_app/widgets/SquareCard/prodcut_card.dart';

class RetailerDashboardScreen extends StatelessWidget {
  const RetailerDashboardScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Top Salers',
                    style: TextStyle(fontSize: 26),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        child: InkWell(
                          child: Image.asset(
                              'assets/images/kisspng-ooty-vegetable-fruit-pea-vegflow-vegetable-png-clipart-5a74d157c8de71.5013842015176052078228.png'),
                        ),
                        radius: 45,
                        backgroundColor: Theme.of(context).backgroundColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Best Selling',
                    style: TextStyle(fontSize: 26),
                  ),
                  Container(
                    child: ProductCard(
                      imageUrl:
                          'https://5.imimg.com/data5/NM/II/MY-3020503/ladies-hand-bags1-500x500.jpg',
                      price: 150,
                      title: 'Test title',
                      subtitle: 'subtitle',
                      onTap: null,
                      size: 150,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(fontSize: 26),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
