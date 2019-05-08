//
//  HistoryViewController.swift
//  Conversions
//
//  Created by Mario Fernando Paucar Gutierrez on 5/7/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var conversions: [Conversion] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do  {
            conversions = try context.fetch(Conversion.fetchRequest())
            tableView.reloadData()
        }
        catch{}
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let conversion = conversions[indexPath.row]
        let history = "\(String(describing: conversion.number!)) \(String(describing: conversion.medida1!)) a \(String(describing: conversion.result!)) \(String(describing: conversion.medida2!))"
        cell.textLabel?.text = history
        
        return cell
    }

}
