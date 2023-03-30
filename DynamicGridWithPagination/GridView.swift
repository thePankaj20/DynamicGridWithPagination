//
//  GridView.swift
//  DynamicGridWithPagination
//
//  Created by Pankaj Kumhar on 30/03/23.
//

import SwiftUI

struct GridView: View {
    
    let gridItemList: [String]
    let numOfRows = 3
    let itemsInRow: Int
        
    var body: some View {
        VStack(spacing: 0) {
            let itemInGrid = itemsInRow * numOfRows
            let noOfPages = ceil(Double(gridItemList.count)/Double(itemInGrid))
            GridPageView(gridItemList: gridItemList, noOfPages: Int(noOfPages), itemInGrid: itemInGrid)
            .padding(.top, Constants.Padding.gridPadding)
        }
        
    }
}
