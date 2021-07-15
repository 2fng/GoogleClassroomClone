//
//  UIColorExtension.swift
//  GoogleClassroomClone
//
//  Created by Hua Son Tung on 15/07/2021.
//

import Foundation
import UIKit


public extension UIColor {
    
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    }
    
}
