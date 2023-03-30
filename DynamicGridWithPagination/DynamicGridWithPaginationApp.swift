//
//  DynamicGridWithPaginationApp.swift
//  DynamicGridWithPagination
//
//  Created by Pankaj Kumhar on 30/03/23.
//

import SwiftUI

@main
struct DynamicGridWithPaginationApp: App {
    let arrItems = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]
    var body: some Scene {
        WindowGroup {
            GeometryReader {geo in
                let itemsInRow = Int((geo.size.width - Constants.Padding.horizontalPaddingForGrid) / Constants.gridItemWidth)
                GridView(gridItemList: arrItems, itemsInRow: itemsInRow)
            }
           
        }
    }
}
