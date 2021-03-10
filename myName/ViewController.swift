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
        
    }
}

