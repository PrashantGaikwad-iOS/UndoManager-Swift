//
//  ViewController.swift
//  UndoManager
//
//  Created by Prashant G on 7/11/18.
//  Copyright © 2018 MyOrg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var colorsCollectionView: UICollectionView!
    
    @IBOutlet weak var colorView: UIView!
    
    var colorsArray = ["green","blue","red","black","yellow","brown","orange","purple","cyan","magenta"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func redoAction(_ sender: Any) {
        undoManager?.redo()
    }
    
    @IBAction func undoAction(_ sender: Any) {
        undoManager?.undo()
    }
    
    func changeColor(color: UIColor) {
        
        let oldColor = self.colorView.backgroundColor ?? UIColor.white
        undoManager?.registerUndo(withTarget: self, handler: { (targetSelf) in
            targetSelf.changeColor(color: oldColor)
        })
        colorView.backgroundColor = color
    }
    
}


extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let label:UILabel = cell.viewWithTag(101) as! UILabel
        label.text = colorsArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let colorName = colorsArray[indexPath.row]
        
        switch colorName {
        case "green":
            changeColor(color: UIColor.green)
        case "blue":
            changeColor(color: UIColor.blue)
        case "red":
            changeColor(color: UIColor.red)
        case "black":
            changeColor(color: UIColor.black)
        case "yellow":
            changeColor(color: UIColor.yellow)
        case "brown":
            changeColor(color: UIColor.brown)
        case "orange":
            changeColor(color: UIColor.orange)
        case "purple":
            changeColor(color: UIColor.purple)
        case "cyan":
            changeColor(color: UIColor.cyan)
        case "magenta":
            changeColor(color: UIColor.magenta)
        default:
            changeColor(color: UIColor.white)
        }
    }
}
