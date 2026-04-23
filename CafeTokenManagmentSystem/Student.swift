//
//  Student.swift
//  CafeTokenManagmentSystem
//
//  Created by apple on 24/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class Student: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let arr = ["Student","Guardien","FoodItems","Token"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = (tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell)!
        cell.smelbl.text = arr[indexPath.row]
        return cell
        
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            
            
            print("Student")
            
            
            let studentcell: UITabBarController  = (self.storyboard?.instantiateViewController(withIdentifier: "studentinfo") as? UITabBarController)!
           // present(studentcell, animated: true, completion: nil)
            self.navigationController?.pushViewController(studentcell, animated: true)
            
        }
        else if indexPath.row == 2
        {
            
            print("Foods")
            
            let food:UITabBarController = (self.storyboard?.instantiateViewController(withIdentifier: "foodinfo") as? UITabBarController)!
               // present(food, animated: true, completion: nil)
            self.navigationController?.pushViewController(food, animated: true)
            
        }
        else if indexPath.row == 1
        {
            let guardien:GuardienViewController = (self.storyboard?.instantiateViewController(withIdentifier: "guardieninfo") as? GuardienViewController)!
            // present(food, animated: true, completion: nil)
            self.navigationController?.pushViewController(guardien, animated: true)
           
            
        }
        else if indexPath.row == 3
        {
            let token:tokenViewController = (self.storyboard?.instantiateViewController(withIdentifier: "tokeninfo") as? tokenViewController)!
            // present(food, animated: true, completion: nil)
            self.navigationController?.pushViewController(token, animated: true)
            
            
        }
        }
    }
