//
//  SwiftUIViewBuilder.swift
//
//  Created by Pankaj Kumhar on 14/11/22.
//

import SwiftUI

extension View {
    @ViewBuilder func hidden(_ hidden: Bool) -> some View {
        if !hidden {
            self
        }
    }
}
