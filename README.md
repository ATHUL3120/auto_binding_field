
# AutoBindingField

[![pub package](https://img.shields.io/pub/v/like_button.svg)](https://pub.dartlang.org/packages/like_button) [![GitHub license](https://img.shields.io/github/license/fluttercandies/like_button)](https://github.com/fluttercandies/like_button/blob/master/LICENSE)

A AutoBindingField package that automatically updates input field state based on bound variable changes, and vice versa.

[Demo](https://github.com/ChegzDev/auto_binding_field/blob/master/example/lib/main.dart)




## Usage

Simply import the package and use the `AutoBindingField` widget in your Flutter app. Here is an example:

```dart    
    int? age;
    AutoBindingNumField(
       value: age,
       type: NumberType.onlyPositiveInt,
       onChanged: (value) {
          setState(() {
            age=value as int?;
          });
       },
       decoration: const InputDecoration(labelText: 'Age'),
    ),
```  

## Example

[click here](https://github.com/ChegzDev/gradient_elevated_button/blob/master/example/lib/main.dart) for example


## Issues and feedback

Please file issues and feedback using the Github issues page for this repository.

If you have any suggestions or feedback, please send an email to __chegz.dev@gmail.com__ and we'll be happy to hear from you!