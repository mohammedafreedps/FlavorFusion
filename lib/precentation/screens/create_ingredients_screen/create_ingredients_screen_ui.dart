import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_event.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_state.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateIngredientsScreenUI extends StatefulWidget {
  CreateIngredientsScreenUI({super.key});

  @override
  State<CreateIngredientsScreenUI> createState() =>
      _CreateIngredientsScreenUIState();
}

class _CreateIngredientsScreenUIState extends State<CreateIngredientsScreenUI> {
  final _ingredientController = TextEditingController();
  final _quantityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(title: ''),
      body: Padding(
        padding: EdgeInsets.only(
            left: _screenSize.width * 0.1, right: _screenSize.width * 0.1),
        child: SizedBox(
          height: _screenSize.height,
          child: Column(
            children: [
              Center(
                child: Text(
                  'Ingredients',
                  style: titleMidiumTextStyle(_screenSize.width)
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: _screenSize.width * 0.1,
              ),
              ingredientsAdd(context, _screenSize.width, _ingredientController,
                  _quantityController),
              const Divider(),
              Expanded(child: BlocBuilder<CreateIngredientsCountBloc,
                  CreateIngredientsCountState>(
                builder: (context, state) {
                  if (state is ShowIngredientAndQuantityState) {
                    return ListView.builder(
                        itemCount: state.ingredients.length,
                        itemBuilder: ((context, index) {
                          return enteredIngredientsAndQuantity(
                              context,
                              index,
                              state.ingredients[index],
                              state.quantitys[index],
                              _screenSize.width);
                        }));
                  }
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, intex) {
                        return Center(
                            child: Text(
                          'Nothing added',
                          style: titleSmallTextStyle(_screenSize.width),
                        ));
                      });
                },
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {},
        child: Icon(
          Icons.check,
          color: secondaryColor,
        ),
      ),
    );
  }
}

Widget ingredientTextField(TextEditingController controller) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.phone,
    style: TextStyle(color: secondaryColor),
    cursorColor: acsentColor,
    decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: secondaryColor)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: secondaryColor))),
  );
}

Widget ingredientsAdd(
    BuildContext context,
    double screenWidth,
    TextEditingController ingredientController,
    TextEditingController quantityController) {
  return Column(
    children: [
      AspectRatio(
        aspectRatio: 1 / 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(screenWidth * 0.1),
          child: Container(
            color: baseColor,
            width: screenWidth * 0.3,
            height: screenWidth * 0.6,
            child: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.1, right: screenWidth * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Ingredient',
                        style: titleSmallTextStyle(screenWidth),
                      ),
                      TextField(
                        controller: ingredientController,
                        style: TextStyle(color: primaryColor),
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor))),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Quantity',
                        style: titleSmallTextStyle(screenWidth),
                      ),
                      TextField(
                        controller: quantityController,
                        style: TextStyle(color: primaryColor),
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor))),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (ingredientController.text.isNotEmpty &&
                                quantityController.text.isNotEmpty) {
                              context.read<CreateIngredientsCountBloc>().add(
                                  AddIngredientAndQuantityButtonClickedEvent(
                                      ingredients: ingredientController.text,
                                      quantity: quantityController.text));
                              ingredientController.text = '';
                              quantityController.text = '';
                            }
                          },
                          icon: Icon(color: secondaryColor, Icons.check)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: screenWidth * 0.04,
      )
    ],
  );
}

Widget enteredIngredientsAndQuantity(BuildContext context, int index,
    String ing, String qan, double screenWidth) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ing,
            style: titleSmallTextStyle(screenWidth),
          ),
          Text(
            qan,
            style: titleSmallTextStyle(screenWidth),
          ),
          IconButton(
              onPressed: () {
                context
                    .read<CreateIngredientsCountBloc>()
                    .add(DeleteIngredientButtonClickedEvent(index: index));
              },
              icon: Icon(
                Icons.delete,
                color: secondaryColor,
              ))
        ],
      ),
      const Divider()
    ],
  );
}
