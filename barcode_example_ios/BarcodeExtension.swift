//
//  BarcodeExtension.swift
//  barcode_example_ios
//
//  Created by h-nimrod on 2024/12/10.
//

import ZXingCpp
import UIKit

func generateEAN13Barcode(text: String) -> BarcodeResult? {
    let options = ZXIWriterOptions()
    options.format = .EAN_13
    options.width = 500
    options.height = 200
    options.margin = 10
    
    do {
        let writer = ZXIBarcodeWriter(options: options)
        let cgImage = try writer.write(text)
        
        let label = decodeEAN13Barcode(from: cgImage.takeUnretainedValue())!
        let image = UIImage(cgImage: cgImage.takeRetainedValue())
        return BarcodeResult(image: image, text: label)
    } catch {
        print("Error generating barcode: \(error)")
        return nil
    }
}

func decodeEAN13Barcode(from cgImage: CGImage) -> String? {
    do {
        let options = ZXIReaderOptions()
        let reader = ZXIBarcodeReader(options: options)
        let ret = try reader.read(cgImage)
        if ret.isEmpty {
            return nil
        } else {
            return ret.first?.text
        }
    } catch {
        return nil
    }
}
