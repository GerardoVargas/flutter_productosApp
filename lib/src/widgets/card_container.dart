import 'package:flutter/material.dart';
import 'package:productosapp/src/utils/size_responsive.dart';

class CardContainer extends StatelessWidget {
  
  final Widget child;

  const CardContainer({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive responsive = Responsive(context);
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        //height: responsive.hp(40), //temp
        decoration: _createCardShape(), 
        child: child,
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0,5)
      )
    ]
  );
}