//
//  Custom Button.swift
//  Bank_app_SF
//
//  Created by Anton Medovnik on 08.03.2023.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    override init (frame: CGRect) {
        super .init(frame: frame)
        setupButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    func setupButton() {
     backgroundColor = .white
     setTitleColor(.black, for: .normal)
     layer.cornerRadius = 10
     translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 10
    }

}

