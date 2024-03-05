import 'package:flavorfusion/constants/colors.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/bloc/create_ingredients_state.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/widgets/entered_ingredients_and_quantity.dart';
import 'package:flavorfusion/precentation/screens/create_ingredients_screen/widgets/ingredients_add.dart';
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






