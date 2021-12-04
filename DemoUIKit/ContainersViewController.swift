//
//  ContainersViewController.swift
//  DemoUIKit
//
//  Created by Diego Bustamante on 12/3/21.
//

import UIKit

class ContainersViewController: UIViewController {
    let containerOne: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let containerTwo: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Containers"
        view.addSubview(containerOne)
        view.addSubview(containerTwo)
        containerOne.translatesAutoresizingMaskIntoConstraints = false
        containerTwo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            containerOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            containerOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            containerOne.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/4),
            
            containerTwo.topAnchor.constraint(equalTo: containerOne.bottomAnchor, constant: 0),
            containerTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            containerTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            containerTwo.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
