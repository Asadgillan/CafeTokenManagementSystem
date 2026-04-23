//
//  ViewController.swift
//  CafeTokenManagmentSystem
//
//  Created by apple on 22/03/2019.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
  /*
    var s=""
    var arr = ["Admin","Student","Guardien"]
    var selected = "Admin"
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
    
    */
    

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var passlbl: UITextField!
    @IBOutlet weak var namelbl: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func loginbtn(_ sender: UIButton) {
    
        if(namelbl.text?.isEmpty)! || (passlbl.text?.isEmpty)!
        {
            let alert = UIAlertController(title: "Alert", message: "All field are required", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        let url="\(MyURL.url)login/\(namelbl.text!)/\(passlbl.text!)"
        
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
                            print(json)
                            if let cond = json.value(forKey: "loginResult") as? String
                            {
                                if cond == "admin"{
                                    
                                    DispatchQueue.main.async {
                                        self.login()
                                    }
                                 
                                }
                                else if(cond == "student")
                                {   print(" bacha ha yar")
                                    DispatchQueue.main.async {
                                    
                                    let forstudent:forstudentViewController = (self.storyboard?.instantiateViewController(withIdentifier: "forstudent") as? forstudentViewController)!
                                    //  present(studentclass, animated: true, completion: nil)
                                    self.navigationController?.pushViewController(forstudent, animated: true)
                                    }
                                    
                                }
                                else if(cond == "guardien")
                                {
                                    print("papa han")
                                    DispatchQueue.main.async {
                                    
                                    
                                    let forguardien:forguardienViewController = (self.storyboard?.instantiateViewController(withIdentifier: "forguardien") as? forguardienViewController)!
                                    //  present(studentclass, animated: true, completion: nil)
                                    self.navigationController?.pushViewController(forguardien, animated: true)
                                    }
                                }
                                else
                                {
                                print("koye nai ha")
                            }
                            
                            
                            }}
                    }
                    catch{
                        
                        print(Error.self)
                        
                    }
                    
                    
                }
                }.resume()
            
            
        }
        else{
            print("url error")
            
        }
      
        
        
       }

   func login()
   {
    print("successfully login")
    let studentclass:Student = (self.storyboard?.instantiateViewController(withIdentifier: "studentmain") as? Student)!
      //  present(studentclass, animated: true, completion: nil)
    self.navigationController?.pushViewController(studentclass, animated: true)
    }
        
        
    }



