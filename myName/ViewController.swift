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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isKeyPresentInUserDefaults(key: "name") {
            if let name = UserDefaults.standard.string(forKey: "name") {
                nameLabel.text = "Hello: \(name)"
            }
            
        } else {
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
            UserDefaults.standard.set(nameToSave, forKey: "name")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    @IBAction func deleteNameButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "Are you sure you watn to delete?", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: .destructive) { [unowned self] action in
            self.nameLabel.text = "Your name"
            let prefs = UserDefaults.standard
            prefs.removeObject(forKey: "name")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    @IBAction func addNameButtonPressed(_ sender: Any) {
        if isKeyPresentInUserDefaults(key: "name") {
            let alert = UIAlertController(title: "Alert", message: "You already have a name.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        } else {
            setupAlert()
        }
        
    }
    
}

