//
//  Color.swift
//  IslandCook
//
//  Created by user209640 on 2/9/22.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = colorTheme()
}

struct colorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let error = Color("Error")
    let primary1 = Color("Primary 1")
    let primary2 = Color("Primary 2")
    let primary3 = Color("Primary 3")
    let primary4 = Color("Primary 4")
    let secondary1 = Color("Secondary 1")
    let secondary2 = Color("Secondary 2")
    let secondary3 = Color("Secondary 3")
    let secondary4 = Color("Secondary 4")
    let tertiary1 = Color("Tertiary 1")
    let tertiary2 = Color("Tertiary 2")
    let tertiary3 = Color("Tertiary 3")
    let tertiary4 = Color("Tertiary 4")
    let surfaceVariant = Color("Surface Variant")
}
