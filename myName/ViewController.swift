//
//  ViewController.swift
//  myName
//
//  Created by Anattapong Suktep on 10/3/2564 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Name"
        
        if nameLabel.text != "" {
            setupAlert()
        }
        
    }
    
    func setupAlert() {
        let alert = UIAlertController(title: "New Name", message: "Add a new name", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
            
            guard let textField = alert.textFields?.first,
                  let nameToSave = textField.text else {
                return
            }
            self.nameLabel.text = "Hello: \(nameToSave)"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    @IBAction func deleteNameButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "Are you sure you watn to delete?", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: .destructive) { [unowned self] action in
            self.nameLabel.text = "Your name"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    @IBAction func addNameButtonPressed(_ sender: Any) {
        
    }
    
}

