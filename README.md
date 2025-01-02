# iOS-Calculator

This is a simple iOS calculator app with support for basic arithmetic operations (addition, subtraction, multiplication, division) and trigonometric functions (sine, cosine, tangent). It uses a custom framework (`Calculate`) for performing the mathematical operations.

## Features

- **Basic Arithmetic Operations**: Add, subtract, multiply, and divide numbers.
- **Trigonometric Functions**: Support for sine, cosine, and tangent functions, all in degrees.
- **Clear & Delete**: Ability to clear the screen or delete the last input character.
- **Percentage & Sign Change**: Convert numbers to percentages and change their sign.
- **Decimal Support**: Support for decimal numbers.

## Requirements

- iOS 12.0 or later
- Xcode 12.0 or later
- Swift 5.0 or later

## Installation

### Step 1: Clone the repository

You can clone this repository to your local machine using Git:

```
bash


Copy code
git clone https://github.com/your-username/calculator-ios.git
```

### Step 2: Open the project in Xcode

After cloning, open the project folder and double-click the `.xcodeproj` or `.xcworkspace` file to open it in Xcode.

### Step 3: Run the project

You can now run the project in the Xcode simulator or on a connected iOS device by selecting the target device and pressing the "Run" button.

## Framework: Calculate

The `Calculate` framework is a custom framework used to perform mathematical operations. It includes the following methods:

### Mathematical Operations

- **Addition**: Adds two numbers.

  ```objective-c
  + (double)addition:(double)a with:(double)b;
  ```

- **Subtraction**: Subtracts the second number from the first.

  ```objective-c
  + (double)subtraction:(double)a with:(double)b;
  ```

- **Multiplication**: Multiplies two numbers.

  ```objective-c
  + (double)multiplication:(double)a with:(double)b;
  ```

- **Division**: Divides the first number by the second. Returns `nil` if the second number is 0.

  ```objective-c
  + (nullable NSNumber *)division:(double)a with:(double)b;
  ```

### Trigonometric Functions

- **Sine**: Returns the sine of the angle in degrees.

  ```objective-c
  + (double)sine:(double)angleInDegrees;
  ```

- **Cosine**: Returns the cosine of the angle in degrees.

  ```objective-c
  + (double)cosine:(double)angleInDegrees;
  ```

- **Tangent**: Returns the tangent of the angle in degrees.

  ```objective-c
  + (double)tangent:(double)angleInDegrees;
  ```

## App Functionality

### Buttons and Actions

- **Number Buttons**: Press number buttons (0-9) to input numbers.
- **Arithmetic Operators**: Use the `+`, `-`, `*`, and `:` buttons for addition, subtraction, multiplication, and division.
- **Trig Functions**: Use the `sin`, `cos`, and `tan` buttons for trigonometric operations on the input number (in degrees).
- **AC (Clear)**: Clears the current input and resets the calculator.
- **DEL (Delete)**: Deletes the last entered digit.
- **Percentage**: Converts the current number to a percentage.
- **Sign Change**: Changes the sign of the current number.

### Handling Edge Cases

- **Division by zero**: If the user attempts to divide by zero, the calculator will return a result of 0 and avoid a crash.
- **Decimal Input**: The app supports decimal numbers, preventing multiple decimal points in the same number.