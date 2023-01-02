//
//  LogViewController.swift
//  CustomAppLogger
//
//  Created by Sadık Çoban on 3.01.2023.
//

import UIKit

class LogViewController: UIViewController {
    
    lazy var textField: UITextView = {
        let field = UITextView()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.isEditable = false
        field.backgroundColor = .white
        field.textColor = .black
        field.font = .systemFont(ofSize: 12)
        return field
    }()
    
    init(with logs: NSMutableAttributedString){
        super.init(nibName: nil, bundle: nil)
        self.textField.attributedText = logs
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.backgroundColor = .white
        view.addSubview(textField)
        textField.frame = view.bounds
        
    }
    
}
