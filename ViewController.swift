//
//  ViewController.swift
//  Downloading the Image from the web
//
//  Created by be RUPU on 18/11/20.
//  Copyright © 2020 be RUPU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //MARK: - Restore from UserDomain
        
//        let documanetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
//
//            if documanetPath.count > 0 {
//                let documentDirectory = documanetPath[0]
//
//                let restorePath = documentDirectory + "/cr7.jpg"
//
//                imageView.image = UIImage(contentsOfFile: restorePath)
//
//                print("BackedUP from storage")
//            }
        
        //MARK: - Download and save
        
        let url = URL(string: "https://scontent.fdac79-1.fna.fbcdn.net/v/t1.0-9/68370535_10157524021292164_2508255635234095104_o.jpg?_nc_cat=1&ccb=2&_nc_sid=09cbfe&_nc_ohc=9p0C_KpYbC8AX_0PewM&_nc_ht=scontent.fdac79-1.fna&oh=0d01e0454f0ef2adbd14ca9e1edfd756&oe=5FD974B4")!

        let request = NSMutableURLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in

            if error != nil {
                print(error!)
            }else {

                if let data = data {
                    if let downloadImage = UIImage(data: data){
                        DispatchQueue.main.async {
                            self.imageView.image = downloadImage
                        }
                            print("Downloaded")
                        let documanetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)

                        if documanetPath.count > 0 {
                            let documentDirectory = documanetPath[0]

                            let savePath = documentDirectory + "/cr7.jpg"

                            do{
                                try downloadImage.jpegData(compressionQuality: 1)?.write(to: URL(fileURLWithPath: savePath))
                            }catch{

                            }
                        }

                    }
                }
            }
        }
        task.resume()
    }
    

}

