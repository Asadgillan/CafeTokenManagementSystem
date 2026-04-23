//
//  forstudentViewController.swift
//  CafeTokenManagmentSystem
//
//  Created by Asad Khan on 07/04/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
struct  foodinfoo {
    var fname:String
    var price:Int
}


class forstudentViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var arrayname = [String]()
    var arrayprice = [String]()
   
    
    
    var foods = [foodinfoo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in arrayname{
            print(i)
        }
    /*    let functionUrl = "\(MyURL.url)DisplayFood"
        print(functionUrl)
        self.Doo(uurl: functionUrl)
        */
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var mytableview: UITableView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
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
                                self.foods.append(foodinfoo.init(fname: fname, price: price))
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
 */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return foods.count
        return arrayname.count
    }
    var cellss:[forstuTableViewCell]=[]
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:forstuTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? forstuTableViewCell)!
        cell.name.text = arrayname[indexPath.row] //foods[indexPath.row].fname
       // cell.quantity = foods[indexPath.row].quantuty//
        cell.price.text = arrayprice[indexPath.row]  //String(foods[indexPath.row].price )
        cell.myimage.image = #imageLiteral(resourceName: "images")
        cell.addbtn.tag = indexPath.row
        cell.subbtn.tag = indexPath.row
        cell.quantity.tag = indexPath.row
        cell.addbtn.addTarget(self, action: #selector(addbuttonclick ), for: .touchUpInside)
        cell.subbtn.addTarget(self, action: #selector(minus), for: .touchUpInside)
        cellss.append(cell)
        return cell
        
    }
    
    @objc func addbuttonclick(sender:UIButton) {
        
      print("plus pressed")
       cellss[sender.tag].quantity.text = String(Int(cellss[sender.tag].quantity.text!)! + 1)
        // mytableview.reloadData()
        
    }
    
    @objc func minus(sender:UIButton) {
        cellss[sender.tag].quantity.text = String(Int(cellss[sender.tag].quantity.text!)! - 1)
     //   mytableview.reloadData()
      print("minus pressed")
    }
    
    @IBAction func order(_ sender: UIBarButtonItem) {
    
        for i in cellss {
            if(i.quantity != nil)
            {
                
                
                
            }
            
        }
        
        
        
    }
    
}
