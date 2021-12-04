//
//  ViewController.swift
//  DemoUIKit
//
//  Created by Diego Bustamante on 12/3/21.
//

import UIKit

class ViewController: UIViewController {
    let containerOne : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    let navPushButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Nav Push", for: .normal)
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(navPush), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let navPresentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Nav Present", for: .normal)
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(navPresent), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    @objc func navPresent() {
        let view = TableViewController()
        let strings = ["One", "Two", "Three", "Four", "Five", "Six"]
        view.numberStrings = strings
        view.view.backgroundColor = .white
        navigationController?.present(view, animated: true)
    }
    
    @objc func navPush() {
        let view = ContainersViewController()
        view.view.backgroundColor = .white
        navigationController?.pushViewController(view, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        navigationItem.title = "Title"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let stackView = UIStackView(arrangedSubviews: [navPresentButton, navPushButton])
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.axis = .horizontal
        
        // 1) Add subview to view
        view.addSubview(containerOne)
        containerOne.addSubview(stackView)
        
        // 2) Set translatesAutoresizingMaskIntoConstraints to false
        containerOne.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // 3) Constraint subview
        NSLayoutConstraint.activate([
            containerOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            containerOne.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            containerOne.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            containerOne.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            stackView.centerXAnchor.constraint(equalTo: containerOne.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: containerOne.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: view.frame.width-20),
            stackView.heightAnchor.constraint(equalToConstant: 108),
        ])
    }
}

