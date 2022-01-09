//
//  Extension+Image.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 08/01/22.
//

import Foundation
import UIKit

extension UIImage {

    class func getColoredRectImageWith(color: CGColor, andSize size: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let graphicsContext = UIGraphicsGetCurrentContext()
        graphicsContext?.setFillColor(color)
        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        graphicsContext?.fill(rectangle)
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rectangleImage!
    }
}

extension UIImageView {
    func circleImage() {
        self.layer.cornerRadius = self.bounds.width / 2
    }
    
    func DownloadStaticImage(_ uri : String) {
        guard let url = URL(string: uri) else { return }
        
        let task = URLSession.shared.dataTask(with: url) {responseData,response,error in
            if error == nil {
                if let data = responseData {
                    
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)
                       
                        print("Fin del hilo imagen muestra")
                    }
                    
                }else {
                    print("no data")
                }
            }else{
                print("error")
            }
        }
        task.resume()
    }
}
