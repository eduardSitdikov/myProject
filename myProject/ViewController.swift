//
//  ViewController.swift
//  myProject
//
//  Created by Eduard on 29/06/2019.
//  Copyright © 2019 Eduard Sitdykov. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tasksListTableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    var arrTasks = [String?]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return arrTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cellidentificator", for: indexPath)
        cell.textLabel?.text = arrTasks[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        arrTasks.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func addButton(_ sender: Any) {
        
        self.add(title: "Новая задача", message: "Введите новую задачу", style: .alert)
        
    }
    
    func add(title: String, message: String, style: UIAlertController.Style) {
        
        let alertAddController = UIAlertController(title: title, message: message, preferredStyle: style)
        let addAction = UIAlertAction(title: "Добавить", style: .default) { (addAction) in
            let task = alertAddController.textFields?.first
            self.arrTasks.append(task?.text!)
            self.tableView.reloadData()
        }
        
        
        
        alertAddController.addTextField { (textField) in
            
        }
        
        alertAddController.addAction(addAction)
        self.present(alertAddController, animated: true, completion: nil)
    }
}

