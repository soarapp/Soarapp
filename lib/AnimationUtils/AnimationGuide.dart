// General code for an animation:

// Steps to using the animation controller:

// 1. Ensure you are using a stateful widget

// 2. Uncomment the following code

// 3. Copy and paste the code in your class right above the "Widget build(BuildContext)

// 4. Append the following to your class name: with SingleTickerProviderStateMixin

// For example: class CreateAcctCardState extends State<CreateAcctCard>
//     with SingleTickerProviderStateMixin {

// 5. Customize the time you want to the animation to run (change the values after the
// the word milliseconds below

// 6. Wrap the widget you want to animate with some sort of transition (Reference the example
// after line 37 (Don't copy and paste the code because it will not work. The container is
// the widget I want to animate so I wrapped it with the slide transition and some parameters)


// Other tips:
// A (+) offset means you want the animation to animate the widget from above the
// screen to below the screen and a (-) animation means the opposite

// The offset refers to where you want the animation to start
// the smaller the value, the closer it will start to the screen


// On the other hand, a large offset will make the widget move from way under the screen
// (or above the screen, if a positive offset value is given)
// to a position where it comes into view

// offset is represented as Offset(x, y)


// AnimationController animationController;
//
// @override
// void initState() {
//   animationController =
//       AnimationController(vsync: this, duration: Duration(milliseconds: 500));
//   Timer(Duration(milliseconds: 300), () => animationController.forward());
//
//   super.initState();
// }
//
// @override
// void dispose() {
//   animationController.dispose();
//   super.dispose();
// }



// Widget build(BuildContext context) {
//     return Expanded(
//       flex: 3,
//       child: SlideTransition(
//         position: Tween<Offset>(
//           begin: Offset(0, 0.20),
//           end: Offset.zero,
//         ).animate(animationController),
//         child: Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(40.0),
//                 topLeft: Radius.circular(40.0)),
//             color: Colors.white,
//