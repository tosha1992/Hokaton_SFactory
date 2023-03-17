//
//  ViewController.swift
//  Bank_app_SF
//
//  Created by Anton Medovnik on 08.03.2023.
//

import UIKit




class ViewController: UIViewController, UITextFieldDelegate {
   
  
  
   
    
    let secondVC = SecondViewController()

    @objc let mybalanceButton = CustomButton ()
    @objc let cashMoneyButton = CustomButton ()
    let paybalanceBtn = CustomButton ()
    
    var startBalance: UInt64 = 1000
    
    var labelBalance = SecondViewController()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        view.backgroundColor = .systemBlue
        navigationItem.title = "My banking app"
        setupButtonConstraints()
        
        //Кнопка "Показать баланс"
        mybalanceButton.setTitle("Show the balance", for: .normal)
        mybalanceButton.addTarget(self, action: #selector(showMyBalance), for: .touchUpInside)
        
        //Кнопка "Пополнить баланс"
        cashMoneyButton.setTitle("Top up balance", for: .normal)
        cashMoneyButton.addTarget(self, action: #selector(topUpBalance), for: .touchUpInside)
        
        
        paybalanceBtn.setTitle("Cash balance", for: .normal)
        paybalanceBtn.addTarget(self, action: #selector(cashMoney), for: .touchUpInside)
     
    }
    

    
    
    func setupButtonConstraints () {
        mybalanceButton.backgroundColor = .white
        cashMoneyButton.backgroundColor = .white
        paybalanceBtn.backgroundColor = .white
        view.addSubview(mybalanceButton)
        view.addSubview(cashMoneyButton)
        view.addSubview(paybalanceBtn)
        
    
        mybalanceButton.translatesAutoresizingMaskIntoConstraints = false
        mybalanceButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -500).isActive = true
        mybalanceButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 90).isActive = true
        mybalanceButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -90).isActive = true
        
        cashMoneyButton.translatesAutoresizingMaskIntoConstraints = false
        cashMoneyButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -450).isActive = true
        cashMoneyButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 90).isActive = true
        cashMoneyButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -90).isActive = true
        
        paybalanceBtn.translatesAutoresizingMaskIntoConstraints = false
        paybalanceBtn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -400).isActive = true
        paybalanceBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 90).isActive = true
        paybalanceBtn.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -90).isActive = true
   }
    
    
    @objc func showMyBalance () {
        mybalanceButton.addTarget(self, action: #selector(getter: self.mybalanceButton), for: .touchUpInside)
        let showBalanceController = SecondViewController ()
        
        showBalanceController.balanceCount.text = "\(startBalance)"  
        
        navigationController?.pushViewController(showBalanceController, animated: true)
        
    }

    @objc func topUpBalance () {
        
      
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
                return false
            }
            return true
        }
        
        mybalanceButton.addTarget(self, action: #selector(getter: cashMoneyButton), for: .touchUpInside)
        
       
        let alert = UIAlertController (title: "My Bank app", message: "Enter amount", preferredStyle: .alert)
        
        
        
        alert.addTextField(configurationHandler: {(summ) in
            summ.placeholder = "USD"
            summ.keyboardType = .numberPad
            summ.delegate = self
        
    
        }
        )
        
        
   
        
        
        alert.addAction(UIAlertAction(title: "Top app", style: .default, handler: { [self](_) in
            if let field:UITextField = alert.textFields?.first { 
               
               
               
                
                if let text = field.text, !text.isEmpty  {
                    
                    startBalance += UInt64 (text)!  // а тут в алерте присваеваем то что ввели в текстфилд плюс изначальный баланс
                    
    
                    
                    }
            
                }
                
            }))
        
        present(alert, animated: true, completion: nil)
        
        
        }
    enum countErrors: Error {
        case negativeBalanse
    }


    @objc func cashMoney () {
        
      
       
        mybalanceButton.addTarget(self, action: #selector(getter: cashMoneyButton), for: .touchUpInside)
        let alert = UIAlertController (title: "My Bank app", message: "Enter amount", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: {(summ) in
            summ.placeholder = "USD"
            summ.keyboardType = .numberPad
            summ.delegate = self
        }
        )
        
        
        alert.addAction(UIAlertAction(title: "Cash your money", style: .default, handler: { [self](_) in
            if let field:UITextField = alert.textFields?.first  {
               
                if let text = field.text, !text.isEmpty, startBalance >= UInt64 (text)!  {
                                       
                
                    startBalance -= UInt64 (text)!
                }
                
                else {
                    let alertController = UIAlertController(title: "Warning!", message: "You have no money!", preferredStyle: .alert)
                
                let action = UIAlertAction (title: "Return", style: .default, handler:  { (action) in})
                    alertController.addAction(action)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            
        }
            ))
             
        
        present(alert, animated: true, completion: nil)
        
    }
        
        
        
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
            return false
        }
        return true
    }

}
