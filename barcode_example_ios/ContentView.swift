//
//  ContentView.swift
//  barcode_example_ios
//
//  Created by h-nimrod on 2024/12/10.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String
    @State private var barcodeResult: BarcodeResult? = nil
    
    init(_ text: String = "123456789012") {
        self._text = State(initialValue: text)
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            if let barcodeImage = barcodeResult?.image {
                Image(uiImage: barcodeImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 150)
                if let label = barcodeResult?.text {
                    Text(label)
                }
            } else {
                Text("Generating Barcode...")
            }
            
            Spacer()
            
            TextField("barcode", text: $text)
                .padding()
                .keyboardType(.numberPad)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(UIColor.secondaryLabel), lineWidth: 1)
                )
                .onChange(of: text) { newValue in
                    barcodeResult = generateEAN13Barcode(text: newValue)
                }
        }
        .padding()
        .onAppear {
            barcodeResult = generateEAN13Barcode(text: text)
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        @State var text = "123456789012"
        ContentView(text)
    }
}
