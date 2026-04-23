//
//  editstuViewController.swift
//  CafeTokenManagmentSystem
//
//  Created by apple on 27/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
struct  studentinfo {
    var aridno:String
    var name:String
}
class editstuViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource {
    
   // let array = ["1"]
    var students = [studentinfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let functionUrl = "\(MyURL.url)DisplayStudent"
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
           
      
                URLSession.shared.dataTask(with: address) { (data, response, error) in
                    
                    if (error != nil){
                        print("Error while getting data")
                        return
                    }
                    do{
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary{
           
                if let Array = json.value(forKey: "DisplayStudentResult") as? NSArray{
                    
                    
                    for R in Array{
                        
                        guard let mydic = R as? NSDictionary
                            else{
                                return
                        }
                        
                        let arid = mydic.value(forKey: "Arid_no") as! String
                        let name  = mydic.value(forKey: "sname") as! String
                        self.students.append(studentinfo.init(aridno: arid, name: name))
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
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:estuditTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "stucell", for: indexPath) as? estuditTableViewCell)!
        
        cell.name.text = students[indexPath.row].name
        cell.aridno.text =    students[indexPath.row].aridno
        cell.myimage.image =  #imageLiteral(resourceName: "personimg")
        return cell
        
        

   
}
}
