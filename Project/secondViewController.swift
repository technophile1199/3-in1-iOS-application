//
//  secondViewController.swift
//  Project
//
//  Created by english on 2020-12-01.
//  Copyright © 2020 Manan. All rights reserved.
//

import UIKit
import CoreData

class secondViewController: UIViewController ,UITableViewDataSource , UITableViewDelegate , UIApplicationDelegate{
    
    var nameArray = [String]()
       var idArray = [UUID]()
       var selectedPainting = ""
       var selectedPaintingId : UUID?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return nameArray.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = UITableViewCell()
           cell.textLabel?.text = nameArray[indexPath.row]
           return cell
           
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           selectedPainting = nameArray[indexPath.row]
           selectedPaintingId = idArray[indexPath.row]
           performSegue(withIdentifier: "m3", sender: nil)
       }
    
    @IBOutlet var tableview: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
               tableview.delegate = self
               
               // Do any additional setup after loading the view.
               getData()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name:
            NSNotification.Name(rawValue: "NewData"), object: nil)
    }
    @objc func getData(){
        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        fetchRequest.returnsObjectsAsFaults = false
        
        
        do{
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let name = result.value(forKey: "name") as? String {
                        nameArray.append(name)
                        
                    }
                    if let id = result.value(forKey: "id") as? UUID{
                        idArray.append(id)
                    }
                    tableview.reloadData()
                    
                }
            }
        }
        catch{
            print("error")
        }
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "m3"{
        let des = segue.destination as! thirdViewController
        des.choosePainting = selectedPainting
        des.choosePaintingId = selectedPaintingId
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
