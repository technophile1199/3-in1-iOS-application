//
//  thirdViewController.swift
//  Project
//
//  Created by english on 2020-12-01.
//  Copyright © 2020 Manan. All rights reserved.
//

import UIKit
import CoreData

class thirdViewController: UIViewController , UIApplicationDelegate  ,UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet var nametxt: UITextField!
    
    @IBOutlet var imageview: UIImageView!
    
    var choosePainting = ""
    var choosePaintingId : UUID?
    
    @IBAction func btnpressed(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings" , into: context)
        
            newPainting.setValue(nametxt.text!, forKey: "name")
        
            
            
            
            
            newPainting.setValue(UUID(), forKey: "id")
            let data = imageview.image?.jpegData(compressionQuality: 0.5)
            newPainting.setValue(data, forKey: "image")
            
            do{
                try context.save()
                print("success")
            }
            catch{
                print("error")
            }
            navigationController?.popViewController(animated: true)
            NotificationCenter.default.post(name: NSNotification.Name("NewData"), object: nil)
        
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        imageview.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageview.addGestureRecognizer(imageTapRecognizer)
        
        getdataById()
        // Do any additional setup after loading the view.
    }
    
    @objc func chooseImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true , completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageview.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func getdataById(){
        
        if choosePainting != ""{
            
        
            
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
    let idString = choosePaintingId?.uuidString
    fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
    fetchRequest.returnsObjectsAsFaults = false
    
        do{
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let name = result.value(forKey: "name") as? String {
                        nametxt.text = name
                        
                    }
                    
                    if let imageData = result.value(forKey: "image") as? Data{
                            let image = UIImage(data: imageData)
                            imageview.image = image
                    }
                
                    
                }
            }
        }
        catch{
            print("error")
        }
        
        
    }
        else{
    nametxt.text = ""
    
            
    
    
    
    
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
