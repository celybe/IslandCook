@_private(sourceFile: "launch.swift") import IslandCook
import SwiftUI
import SwiftUI

extension launch_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/user209640/Documents/GitHub/IslandCook/IslandCook/IslandCook/UseCases/Launch/launch.swift", line: 18)
        __designTimeSelection(launch(), "#3678.[2].[0].property.[0].[0]")
    #sourceLocation()
    }
}

extension launch {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/user209640/Documents/GitHub/IslandCook/IslandCook/IslandCook/UseCases/Launch/launch.swift", line: 12)
        __designTimeSelection(Text(/*@START_MENU_TOKEN@*/__designTimeString("#3678.[1].[0].property.[0].[0].arg[0].value", fallback: "Hello, World!")/*@END_MENU_TOKEN@*/), "#3678.[1].[0].property.[0].[0]")
    #sourceLocation()
    }
}

import struct IslandCook.launch
import struct IslandCook.launch_Previews