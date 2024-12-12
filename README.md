# barcode_example_ios

This is a sample application built with SwiftUI that generates and displays an EAN13 barcode when a 12-digit or 13-digit number is entered.


## Features

- **EAN13 Barcode Generation**
  Automatically generates an EAN13 barcode when a 12-digit or 13-digit number is entered.

- **Real-time Updates**
  The barcode updates immediately whenever the number in the input field is changed.

<img src="fig/demo.gif" alt="Screenshot" width="300"/>

## Used Libraries

This app uses the [zxing-cpp](https://github.com/zxing-cpp/zxing-cpp) library to generate barcodes.
zxing-cpp is a high-performance and versatile C++ library for barcode generation and decoding, supporting a wide range of barcode formats.

## Development Environment

- **Development Environment**: Xcode 15.4
- **Languages**: Swift, SwiftUI

