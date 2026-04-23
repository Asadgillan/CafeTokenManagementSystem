///
//  editfoodViewController.swift
//  CafeTokenManagmentSystem
//
//  Created by apple on 27/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
struct  foodinfo {
    var fname:String
    var price:Int
}


class editfoodViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var foods = [foodinfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let functionUrl = "\(MyURL.url)DisplayFood"
        print(functionUrl)
        self.Doo(uurl: functionUrl)
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var mytableview: UITableView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func Doo(uurl:String) {
        // let url="\(MyURL.url)DisplayStudent/"
        if let address = URL(string: uurl)
        {
            print(address)
            
            
            URLSession.shared.dataTask(with: address) { (data, response, error) in
                
                if (error != nil){
                    print("Error while getting data")
                    return
                }
                do{
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary{
                        
                        if let Array = json.value(forKey: "DisplayFoodResult") as? NSArray{
                            
                            
                            for R in Array{
                                
                                guard let mydic = R as? NSDictionary
                                    else{
                                        return
                                }
                                
                                let fname = mydic.value(forKey: "fname") as! String
                                let price  = mydic.value(forKey: "price") as! Int
                                self.foods.append(foodinfo.init(fname: fname, price: price))
                            }
                            
                            DispatchQueue.main.sync {
                                self.mytableview.reloadData()
                            }
                            
                        }
                        
                    }
                }
                catch{
                    
                    
                }
                }.resume()
            
            
    
    
    
}
}
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:editfoodTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "foodcell", for: indexPath) as? editfoodTableViewCell)!
        cell.myfood.text = foods[indexPath.row].fname
        
        cell.price.text = String(foods[indexPath.row].price )
        cell.myimage.image = #imageLiteral(resourceName: "images")
        return cell
        
    }
    
}
