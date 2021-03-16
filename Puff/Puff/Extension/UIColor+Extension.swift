//
//  UIColor+Extension.swift
//  Puff
//
//  Created by 唐紹桓 on 2021/2/8.
//

import UIKit

extension UIColor {

    private enum PFColor: String {

        case main = "Main"

        case background = "Background"

        case text = "Text"

        case brown = "Brown"

        case backgroundGreen = "BackgroundGreen"

        case openGreen = "OpenGreen"

        case closeRed = "CloseRed"

        case lateBackground = "LateBackground"
        
        case textGray = "TextGray"
    }

    static let main = getColor(.main)

    static let background = getColor(.background)

    static let text = getColor(.text)

    static let brown = getColor(.brown)

    static let backgroundGreen = getColor(.backgroundGreen)

    static let closeRed = getColor(.closeRed)

    static let openGreen = getColor(.openGreen)

    static let lateBackground = getColor(.lateBackground)

    static let textGray = getColor(.textGray)


    private static func getColor(_ color: PFColor) -> UIColor {

        return UIColor(named: color.rawValue)!
    }
}
