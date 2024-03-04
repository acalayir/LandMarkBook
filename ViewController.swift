//
//  ViewController.swift
//  LandMarkBook
//
//  Created by Ahmed Emrah Calayır on 4.03.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {


    @IBOutlet weak var tableView: UITableView!
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()

    var choosenLandMark = ""
    var choosenImageView = UIImage()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
         landmarkNames.append("Colessium")
         landmarkNames.append("Great Wall")
         landmarkNames.append("Eifel Tower")
         landmarkNames.append("Taj Mahal")
         landmarkNames.append("Stonhenge")
         
         landmarkImages.append(UIImage(named: "collesium.jpg")!)
         landmarkImages.append(UIImage(named: "greatwall.jpg")!)
         landmarkImages.append(UIImage(named: "eifeltower.jpg")!)
         landmarkImages.append(UIImage(named: "tacmahal.jpg")!)
         landmarkImages.append(UIImage(named: "stonehedge.jpg")!)
         
         
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        //content.image = landmarkImages[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenLandMark = landmarkNames[indexPath.row]
        choosenImageView = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            var destination = segue.destination as! detailsVC
            destination.selectedLandMark = choosenLandMark
            destination.selectedImageView = choosenImageView
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }

}

