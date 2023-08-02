//
//  FirstViewController.swift
//  Test123
//
//  Created by shivam kumar on 02/08/23.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Ennter a Number"
        textField.font = .systemFont(ofSize: 20.0)
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor =  UIColor.black.cgColor
        textField.delegate = self
        return textField
    }()
    
    lazy var navigateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Navigate to Next Screen", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "Login/Signup", size: 25.0)
        button.layer.cornerRadius = 10.0
        button.addTarget(self, action: #selector(navigateToNextScreen), for: .touchUpInside)
        button.backgroundColor = UIColor.blue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setup()
    }
    
    private func setup() {
        self.addView()
        self.addConstraints()
    }
    
    private func addView() {
        self.view.addSubview(textField)
        self.view.addSubview(self.navigateButton)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: 200),
            
            navigateButton.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 50),
            navigateButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            navigateButton.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    @objc func navigateToNextScreen(_ sender: UIButton) {
        let vc = GridController()
        let text = textField.text ?? ""
        let number = Int(text)
        vc.numberOfGrid = number ?? 0
        self.navigationController!.pushViewController(vc, animated: true)
    }
}
