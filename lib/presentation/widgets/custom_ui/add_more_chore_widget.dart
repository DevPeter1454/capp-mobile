import 'package:flutter/material.dart';
import 'package:capp/presentation/widgets/custom_ui/custom_uis.dart';


class AddMoreChoreWidget extends StatefulWidget {
  const AddMoreChoreWidget({
    super.key, this.title, required this.onQuantityUpdated,  this.selectedItems = const {},
  });
  final String? title;
  final ValueChanged<int> onQuantityUpdated;
  final Map<String, int> selectedItems;


  @override
  State<AddMoreChoreWidget> createState() => _AddMoreChoreWidgetState();
}

class _AddMoreChoreWidgetState extends State<AddMoreChoreWidget> {
  int quantity = 0;

  @override
  void initState() {
    quantity = widget.selectedItems.containsKey(widget.title) ? widget.selectedItems[widget.title]! : 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
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

                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('\$20.00',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 3),
                          child: Icon(Icons.circle, color: Colors.black,size: 5,),
                        ),
                        Text('30mins',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                          ),),

                      ],
                    ),

                  ],
                ),
              ),
              quantity==0 ? CappCustomButton(
                isActive: true,
                onPress: () {
                  setState(() {
                    quantity = quantity+1;
                  });
                  widget.onQuantityUpdated(quantity);
                },
                color: Colors.transparent,
                hasBorder: true,
                width: size.width * .2,
                borderRadius: 8,
                paddingVertical: 7,
                borderColor: Colors.grey.withOpacity(.2),
                isSolidColor: true,
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ):
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                        color: Colors.deepPurple,
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
                        widget.onQuantityUpdated(quantity);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Icon(Icons.add,
                          color: Colors.deepPurple, size: 15,),
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
                          if(quantity!=0){
                            quantity= quantity-1;
                          }
                        });
                        widget.onQuantityUpdated(quantity);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Icon(Icons.remove,
                          color: Colors.deepPurple, size: 15,),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Divider(
              color: Colors.grey.withOpacity(.35),
              thickness: .5,
              height: .5,
            ),
          ),
        ],
      ),
    );
  }
}