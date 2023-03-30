//
//  GridPageView.swift
//  DynamicGridWithPagination
//
//  Created by Pankaj Kumhar on 30/03/23.
//

import SwiftUI

struct GridPageView: View {
    
    @State private var selection: Int = 0
    @State private var rect: CGRect = .zero
    
    let columns = [
        GridItem(.adaptive(minimum: Constants.gridItemWidth), spacing: Constants.gridColumnSpacing, alignment: .top)
    ] //Here column width is fixed to accomodate maximum number of items in one row based on screen width
    let gridItemList: [String]
    let noOfPages: Int
    let itemInGrid: Int
        
    var body: some View {
        TabView(selection: $selection) {
            ForEach(0..<noOfPages, id: \.self) { i in
                createGridItem(i: i, itemInGrid: itemInGrid).tag(i)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: rect.size.height
               + Constants.Padding.offsetForPageIndicator /* just to avoid page indicator overlap */)
        .onPreferenceChange(ViewRectKey.self) { rects in
            withAnimation {
                self.rect = rects.first ?? .zero
           }
        }
        PageControlView(currentPage: $selection, numberOfPages: noOfPages)
            .hidden(noOfPages == 1)
            .padding(.bottom, Constants.Padding.gridPadding)
    }
    
    private func createGridItem(i: Int, itemInGrid: Int) -> some View {
        let startIndex = i * itemInGrid
        let pageGridCount = (gridItemList.count - startIndex)
        let temp = pageGridCount < itemInGrid ? (pageGridCount + startIndex) : (itemInGrid + startIndex)
        
        return LazyVGrid(columns: columns, spacing: 5) {
            ForEach(startIndex..<temp, id: \.self) { j in
                createAssetView(index: j)
            }
        }.frame(maxWidth: .infinity)
            .background(GeometryReader {
                Color.clear.preference(key: ViewRectKey.self,
                                       value: [$0.frame(in: .local)])
            })
            .tag(i)
    }
    
    private func createAssetView(index: Int) -> some View {
        return GridPageItemView(gridItem: gridItemList[index])
        .frame(width: Constants.gridItemWidth)
        .frame(maxHeight: Constants.gridItemHeight)
        .background(Color.blue)
    }
}
