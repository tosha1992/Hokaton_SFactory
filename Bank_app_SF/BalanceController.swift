//
//  SecondViewController.swift
//  Bank_app_SF
//
//  Created by Anton Medovnik on 08.03.2023.
//

import Foundation
import UIKit

let newValue = ViewController ()

class SecondViewController: UIViewController {
    
    
    var balanceCount = UILabel(frame: CGRect (x: 50, y: 50, width: 50, height: 50))
    var textBalance = UILabel (frame: CGRect (x: 50, y: 50, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = . green
        view.addSubview(balanceCount)
        view.addSubview(textBalance)
        
        textBalance.font = UIFont(name: "Arial", size: 20)
        balanceCount.font = UIFont(name: "Arial", size: 40)
        balanceCount.textAlignment = .center
        balanceCount.textColor = .black
        balanceCount.backgroundColor = .white
       
        textBalance.text = "Your balance is:"
        
        textBalance.translatesAutoresizingMaskIntoConstraints = false
        textBalance.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -550).isActive = true
        textBalance.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 130).isActive = true
        textBalance.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -130).isActive = true
        
        balanceCount.translatesAutoresizingMaskIntoConstraints = false
        balanceCount.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -500).isActive = true
        balanceCount.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 130).isActive = true
        balanceCount.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -130).isActive = true
    }
}


    
    

