//
//  GuardienViewController.swift
//  CafeTokenManagmentSystem
//
//  Created by Asad Khan on 03/04/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class GuardienViewController: UIViewController {

    
    @IBOutlet weak var gname: UITextField!
    @IBOutlet weak var aridno: UITextField!
    @IBOutlet weak var cellno: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addbtn(_ sender: UIButton) {
        if(gname.text?.isEmpty)! ||
        (aridno.text?.isEmpty)! ||
        (cellno.text?.isEmpty)!
        {
            let alert = UIAlertController(title: "Alert", message: "All field are required", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert , animated: true, completion: nil)
            
        }
        let url="\(MyURL.url)AddGuardien/\(gname.text!)/\(aridno.text!)/\(cellno.text!)"
        if let add = URL(string: url)
        {
            print(add)
            URLSession.shared.dataTask(with: add){ (data , response, error) in
                if(error != nil)
                {
                    print("saving error")
                    
                }
                else{
                    do{
                        if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary
                        {
                            DispatchQueue.main.async {
                                print(json)
                                if let cond = json.value(forKey: "AddGuardienResult") as? Int
                                {
                                if cond == 0{
                                    
                                    let alert = UIAlertController(title: "Alert", message: "Student is Already Registered", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                                    self.present(alert, animated: true, completion: nil)
                                    
                                }
                                else
                                {
                                    print("saved")
                                    let alert = UIAlertController(title: "Alert", message: "Student is Sucessfully Registered", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                                    self.present(alert, animated: true, completion: nil)
                                }
                            }
                            
                        }
                    }
                    
                }
                catch{
                    
                    print("return error")
                    
                }
            }
        }.resume()
    }
    
    else {
    print("url error")
    
    }
}
}








