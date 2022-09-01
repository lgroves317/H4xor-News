//
//  WebView.swift
//  H4xor News
//
//  Created by Leonard Groves on 9/1/22.
//

import Foundation
import WebKit
import SwiftUI

// A WebView is not currently supported in SwiftUI. In order to get one, we need to use some of the tools in UIKit. The UIKit component that allows a webview to be constructed in an app is called WKWebView. In order to use the tools in UIKit in SwiftUI, we need to conform to the protocol UIViewRepresentable.
// UIViewRepreentable: A wrapper for a UIKit view that you use to integrate that view into your SwiftUI view hierarchy.
struct WebView: UIViewRepresentable {

    let urlString: String?
    // In order to conform to UIViewRepresentable we need to implement two functions:
    //      1. makeUIView
    //      2. updateUIView
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}
