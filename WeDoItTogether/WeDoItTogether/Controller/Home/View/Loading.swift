//
//  Loading.swift
//  WeDoItTogether
//
//  Created by 최하늘 on 2023/08/07.
//

import Foundation
import UIKit

class Loading {
    static func showLoading() {
        DispatchQueue.main.async {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.last {
                let loadingIndicatorView: UIActivityIndicatorView
                if let existedView = window.subviews.first(where: {
                    $0 is UIActivityIndicatorView
                }) as? UIActivityIndicatorView {
                    loadingIndicatorView = existedView
                } else {
                    loadingIndicatorView = UIActivityIndicatorView(style: .large)
                    loadingIndicatorView.frame = window.frame
                    loadingIndicatorView.color = .black
                    window.addSubview(loadingIndicatorView)
                }
                loadingIndicatorView.startAnimating()
            }
        }
    }
    
    static func hideLoading() {
        DispatchQueue.main.async {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.last {
                window.subviews.filter({
                    $0 is UIActivityIndicatorView
                }).forEach { $0.removeFromSuperview() }
            }
        }
    }
}
