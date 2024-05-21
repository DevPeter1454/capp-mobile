import 'package:flutter/material.dart';

import '../../../core/utils/util.dart';


class CheckoutAddChoreWidget extends StatefulWidget {
  const CheckoutAddChoreWidget({
    super.key, this.title, this.amount, this.time,
  });
  final String? title, time;
  final String? amount;

  @override
  State<CheckoutAddChoreWidget> createState() => _CheckoutAddChoreWidgetState();
}

class _CheckoutAddChoreWidgetState extends State<CheckoutAddChoreWidget> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 7,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title ?? 'Clothes ironing & Folding',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(Util.formatMoney(widget.amount ?? '0'),
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),),
                        const Padding(
                          padding: EdgeInsets.only(left: 5, right: 3),
                          child: Icon(Icons.circle, color: Colors.black,size: 5,),
                        ),
                        Text(widget.time??'30mins',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                          ),),

                      ],
                    ),

                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(Util.formatMoney((double.parse(widget.amount ?? '0') * quantity).toString()),
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500
                    ),),
                ],
              ),
              const SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                        color: Theme.of(context).highlightColor,
                        width: .5
                    )
                ),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          quantity= quantity+1;
                        });
                      },
                      child:  Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Icon(Icons.add,
                          color: Theme.of(context).highlightColor, size: 15,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Text(quantity.toString(),
                        maxLines: 1,
                        style: const TextStyle(fontWeight: FontWeight.w500,
                            fontSize: 14),),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          if(quantity!=1){
                            quantity= quantity-1;
                          }else{
                            // showAddBtn = !showAddBtn;
                          }
                        });
                      },
                      child:  Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Icon(Icons.remove,
                          color: Theme.of(context).highlightColor, size: 15,),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}