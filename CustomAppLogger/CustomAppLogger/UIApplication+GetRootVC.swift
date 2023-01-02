//
//  UIApplication+GetRootVC.swift
//  CustomAppLogger
//
//  Created by Sadık Çoban on 3.01.2023.
//

import UIKit

extension UIApplication {
    
    static func getRootVC() -> UIViewController? {
        guard let window = self.shared.windows.max(by: { w1, w2 in
            return w1.windowLevel < w2.windowLevel
        }) else { return nil}
        guard let vc = window.rootViewController else { return nil}
        return vc
    }
}
