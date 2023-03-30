//
//  PageControlView.swift
//
//  Created by Pankaj Kumhar on 18/11/22.
//

import SwiftUI

struct PageControlView: UIViewRepresentable {
    @Binding var currentPage: Int
    var numberOfPages: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIPageControl {
        let uiView = UIPageControl()
        uiView.backgroundStyle = .minimal
        uiView.currentPage = currentPage
        uiView.numberOfPages = numberOfPages
        uiView.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged), for: .valueChanged)
        return uiView
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
        uiView.numberOfPages = numberOfPages
    }
}

extension PageControlView {
    final class Coordinator: NSObject {
        var parent: PageControlView
        
        init(_ parent: PageControlView) {
            self.parent = parent
        }
        
        @objc func valueChanged(sender: UIPageControl) {
            withAnimation {
                parent.currentPage = sender.currentPage
            }
        }
    }
}
