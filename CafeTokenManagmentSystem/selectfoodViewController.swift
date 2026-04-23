//
//  selectfoodViewController.swift
//  CafeTokenManagmentSystem
//
//  Created by Asad Khan on 10/04/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class selectfoodViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    var arrayname2 = [String]()
    var arrayprice2 = [String]()
    var arrayname = ["Baryani","Shwarma","Burger","Samosa","Coke"]
    
    var arrayprice = ["70","60","80","20","30"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mycell = tableView.dequeueReusableCell(withIdentifier: "foodselected", for: indexPath) as? selectfoodTableViewCell
        mycell?.name.text = arrayname[indexPath.row]
        mycell?.price.text = arrayprice[indexPath.row]
        mycell?.foodimg.image = UIImage(named: "food3")
        return mycell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if !( tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            arrayname2.append(arrayname[indexPath.row])
            arrayprice2.append(arrayprice[indexPath.row])
        }
        else{
             tableView.cellForRow(at: indexPath)?.accessoryType = .none
            var i = 0
            for it in arrayname2{
                if it == arrayname[indexPath.row]{
                    arrayname2.remove(at: i)
                    
                }
                i += 1
                
            }
            var j = 0
            for it in arrayprice2{
                if it == arrayprice[indexPath.row]{
                   arrayprice2.remove(at: j)
                    
                }
                j += 1
                
            }
        }
        
    }
   

    @IBAction func fooddone(_ sender: Any) {
        
        let view = self.storyboard?.instantiateViewController(withIdentifier: "forstudent") as? forstudentViewController
        view?.arrayname = arrayname2
        view?.arrayprice = arrayprice2
 //  self.navigationController?.pushViewController(view!, animated: true)
    present(view!, animated: true, completion: nil)
    }
}
