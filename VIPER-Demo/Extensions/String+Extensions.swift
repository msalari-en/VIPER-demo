//
//  String+Extensions.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07.04.2021.
//

import UIKit

extension String {
    func toEmoji(height: CGFloat = UIFont.systemFontSize) -> UIImage? {
        let nsString = self as NSString
        let font = UIFont.systemFont(ofSize: height)

        let size = nsString.size(withAttributes: [.font: font])
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let rect = CGRect(origin: .zero, size: size)
        nsString.draw(in: rect, withAttributes: [.font: font])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
