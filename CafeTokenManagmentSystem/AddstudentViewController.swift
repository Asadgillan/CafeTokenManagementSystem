//
//  AddstudentViewController.swift
//  CafeTokenManagmentSystem
//
//  Created by apple on 25/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class AddstudentViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var s=""
    var arr = ["BSCS","BSIT","MCS","MIT"]
    var selected = "BSCS"
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arr[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selected = arr[row]
        print(selected)
    }
    
    
    
    
    @IBOutlet weak var namelbl: UITextField!
     @IBOutlet weak var aridlbl: UITextField!
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var semlbl: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
picker.dataSource = self
        picker.delegate = self
        // Do any additional setup after loading the view.
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addbtn(_ sender: Any) {
        
        if(namelbl.text?.isEmpty)! || (aridlbl.text?.isEmpty)!||(semlbl.text?.isEmpty)!
        {
            let alert = UIAlertController(title: "Alert", message: "All field are required", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
         
        }
        
            
        
        let url="\(MyURL.url)AddStudent/\(aridlbl.text!)/\(namelbl.text!)/\(semlbl.text!)/\(selected)"
        if let address = URL(string: url)
        {
            print(address)
            URLSession.shared.dataTask(with: address) { (data, responce, error) in
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
                            if let cond = json.value(forKey: "AddStudentResult") as? Int
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



    

    

