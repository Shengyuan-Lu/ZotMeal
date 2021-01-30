//
//  ViewController.swift
//  ZotMeal
//
//  Created by Shengyuan Lu on 1/29/21.
//

import UIKit

class BrandyVC: UIViewController {
    
    // IBOutlet
    @IBOutlet weak var foodTableView: UITableView!
    
    // DataStructure
    var categoryArray:[Category] = []
    let model = JsonModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryArray = model.loadLocalJSON(filename: "Brandy") ?? []
        
        // print(categoryArray)

        foodTableView.dataSource = self
        foodTableView.delegate = self
        view.addSubview(foodTableView)
    }

}

extension BrandyVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray[section].menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell") as! FoodCell
        cell.nameLabel.text = categoryArray[indexPath.section].menu[indexPath.row].name
        cell.desLabel.text = categoryArray[indexPath.section].menu[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryArray.count
   }
    
    
    
}

