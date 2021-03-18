import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/ReuseableCard.dart';
import '../components/ReuseWidget.dart';
import '../constant.dart';
import 'results_page.dart';
import '../components/Round_icon_button.dart';
import '../components/Bottombutton.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 10;

  //Color maleCardColor=inactivefieldcolor;
  //Color femaleCardColor=inactivefieldcolor;

  // void updateColor(Gender selectedGender){
  // if (selectedGender==Gender.Male){
  //   if (maleCardColor==inactivefieldcolor){
  //     maleCardColor=field_color;
  //     femaleCardColor=inactivefieldcolor;
  //   }
  //   else{
  //     maleCardColor=inactivefieldcolor;
  //   }
  //   }
  //
  // if (selectedGender==Gender.Female) {
  //   if (femaleCardColor==inactivefieldcolor){
  //     femaleCardColor=field_color;
  //     maleCardColor=inactivefieldcolor;
  //   }
  //   else{
  //     femaleCardColor=inactivefieldcolor;
  // }
  // }
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(children: [
            Expanded(
              child: ReusableCard(
                  onpress: () {
                    setState(() {
                      selectedGender = Gender.Male;
                    });
                  },
                  colour: selectedGender == Gender.Male
                      ? KActiveCardColour
                      : KInactivefieldcolor,
                  cardchild: ReuseWidget(
                    Iconn: Icon(
                      FontAwesomeIcons.mars,
                      size: 80.0,
                    ),
                    gender: 'MALE',
                  )),
            ),
            Expanded(
              child: ReusableCard(
                onpress: () {
                  setState(() {
                    selectedGender = Gender.Female;
                  });
                },
                colour: selectedGender == Gender.Female
                    ? KActiveCardColour
                    : KInactivefieldcolor,
                cardchild: ReuseWidget(
                  Iconn: Icon(
                    FontAwesomeIcons.venus,
                    size: 80.0,
                  ),
                  gender: 'FEMALE',
                ),
              ),
            )
          ])),
          Expanded(
            child: ReusableCard(
                colour: KActiveCardColour,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: KLabelTextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // this is for along the length of the row
                      crossAxisAlignment: CrossAxisAlignment
                          .baseline, // ''  ''   ''     ''  '' breadth of the row
                      children: [
                        Text(
                          height.toString(),
                          style: KNumberTextstyle,
                        ),
                        Text(
                          'cm',
                          style: KLabelTextstyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(
                            overlayRadius:
                                30.0), //this is used for when click overlaycomes
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        inactiveTrackColor: Color(0xFF8D8E98),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                        min: 120.0,
                        max: 250.0,
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: KActiveCardColour,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: KLabelTextstyle,
                      ),
                      Text(
                        weight.toString(),
                        style: KNumberTextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onpressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onpressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: KActiveCardColour,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: KLabelTextstyle,
                      ),
                      Text(
                        age.toString(),
                        style: KNumberTextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Results_page(
                      bmi_res: calc.calclulate_bmi(),
                      result: calc.getresult(),
                      interpretation: calc.getInterpretation(),
                    );
                  },
                ),
              );
            },
            buttontitle: 'CALCULATE',
          )
        ],
      ),
    );
  }
}
