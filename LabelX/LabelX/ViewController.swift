//
//  ViewController.swift
//  LabelX
//
//  Created by Burak Altunoluk on 13/12/2022.
//

import UIKit

class ViewController: UIViewController {
var image = UIImageView()
    var Image = UIImage()
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
  
        
    }
    func gelgel() {
        
        let newLabel = UIView(frame: CGRect(x: 10, y: 40, width: 350, height: 500))
        newLabel.backgroundColor = UIColor.white
        
        let invoiceText = UILabel(frame: CGRect(x: 20, y: 50, width: 120, height: 30))
        invoiceText.text = "INVOICE"
        invoiceText.adjustsFontSizeToFitWidth = true
        newLabel.addSubview(invoiceText)
        
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 350, height: 350))
      
        imageView.image = UIView.asImage(backgroundView)()
    
        // image to share
             let image =  imageView.image
             
             // set up activity view controller
             let imageToShare = [ image! ]
             let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
             activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
             
             // exclude some activity types from the list (optional)
             activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
             
             // present the view controller
             self.present(activityViewController, animated: true, completion: nil)
        
                              
        newLabel.addSubview(imageView)
        
        view.addSubview(newLabel)
        
        
    }
    

    @IBAction func pdfCreate(_ sender: UIButton) {
        gelgel()
       
       
    }
    

    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Call out"
        return cell
    }
    
    
    
    
    
}

extension UIView {

    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }

    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}
