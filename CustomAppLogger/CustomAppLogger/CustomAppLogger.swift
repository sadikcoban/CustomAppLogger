//
//  Loggger.swift
//  CustomAppLogger
//
//  Created by Sadık Çoban on 3.01.2023.
//

import Foundation

import UIKit
open class CustomAppLogger {
    
    public init(){
        
    }

    private static var logMessages: NSMutableAttributedString = .init(string: "")
    
    private lazy var gearView: UIButton = {
        let view = UIButton()
        let image = UIImage(systemName: "gear")?.withRenderingMode(.alwaysTemplate)
        view.setBackgroundImage(image, for: .normal)
        view.tintColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.imageView?.contentMode = .scaleAspectFit
        return view
    }()
    
    public func setup(){
        guard let rootVC = UIApplication.getRootVC() else { return }
        
        rootVC.view.addSubview(gearView)
        gearView.bottomAnchor.constraint(equalTo: rootVC.view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        gearView.trailingAnchor.constraint(equalTo: rootVC.view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        gearView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        gearView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        gearView.addAction(UIAction(handler: { _ in
            let nav = UINavigationController(rootViewController: LogViewController(with: Self.logMessages))
            nav.modalPresentationStyle = .pageSheet
            if let sheet = nav.sheetPresentationController {
                sheet.detents = [.medium()]
            }
            rootVC.present(nav, animated: true, completion: nil)
        }), for: .touchUpInside)
        
    }
    
    public enum LogType {
        case info
        case warn
        case error
    }
    
    public static func log(_ msg: String, type: LogType = .info, functionName: String = #function, fileName: String = #fileID, lineNumber: Int = #line){
        let newMessage = "[\(Date())-\(fileName)-\(functionName) line: \(lineNumber)]: \(msg)\n"
        let attributedString = NSMutableAttributedString.init(string: newMessage)
        attributedString.addAttributes([NSMutableAttributedString.Key.foregroundColor: getColorForLog(type: type)], range: (newMessage as NSString).range(of: newMessage))
    
        logMessages.append(attributedString)
        print(newMessage)
    }
    
    private static func getColorForLog(type: LogType) -> UIColor {
        switch type {
        case .info:
            return .systemBlue
        case .warn:
            return .systemYellow
        case .error:
            return .red
        }
    }
    
}



