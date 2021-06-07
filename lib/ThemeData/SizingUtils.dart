// Sizing multiplier constants for various text and widgets
// Used to create a responsive layout that dynamically changes with
// different device sizes

// One Hundreth Scaler:
// Use cases:
// 1. SizedBox
final double HUNDRETH_SCALER = 0.01;

// Multiplier for progress bar:
final double PROG_BAR_SCALER =  HUNDRETH_SCALER * 1.4;

// Multiplier for large text
final double LARGE_TXT_SCALER = HUNDRETH_SCALER * 7;


// Tiny Text Scaler:
// Use cases:
// 1. small text under widgets to provide context
final double TINY_TXT_SCALER = HUNDRETH_SCALER * 1.5;

// Small Text scaler:
// Use cases:
// 1. above text input fields
final double SMALL_TXT_SCALER = HUNDRETH_SCALER * 2;

// Semi-Med Text scaler:
final double SEM_MED_TXT_SCALER = HUNDRETH_SCALER * 3.5;

// Medium Text scaler:
final double MED_TXT_SCALER = HUNDRETH_SCALER * 5;


// Field Size Multipler:
final double FIELD_SIZE_SCALER = HUNDRETH_SCALER * 6;

// Button Size Multiplier:
final double BUTTON_SCALER = HUNDRETH_SCALER * 6;

// Large Button Size Multplier:
// Use Cases:
// 1. The Splash Screen
final double LG_BUTTON_SCALER = BUTTON_SCALER * 1.2;

// Border Radius Size:
final double BORDER_RADIUS = 7.0;

// Larger Border Radius to make something more circular:
final double MED_BORDER_RADIUS = 14.0;

// Largest Border Radius to make something even more circular: 
final double LG_BORDER_RADIUS = 20.0;