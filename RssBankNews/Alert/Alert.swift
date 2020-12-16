//
//  Alert.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 10.12.2020.
//

import UIKit

class Alert {
    
    func showAlert(vc: UIViewController) {
        let alert = UIAlertController(title: "Error", message: "Wrong URL", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    func addUrl(vc: TableNewsController, errorAlert: Alert) {
        let alert = UIAlertController(title: "Do you want to add new source?", message: "Paste new URL", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addTextField { (newTextField) in
            newTextField.placeholder = "Enter URL of source"
        }
        alert.addAction(UIAlertAction(title: "Add", style: .default) { (action) in
            guard let txt = alert.textFields?.first?.text else { return }
            if txt.isEmpty || txt.verifyUrl(urlString: txt) == false {
                errorAlert.showAlert(vc: vc)
            } else {
                vc.defaultUrl = txt
                vc.fetchData(newUrl: vc.defaultUrl )
            }
        })
        vc.present(alert, animated: true, completion: nil)
    }
    
}
