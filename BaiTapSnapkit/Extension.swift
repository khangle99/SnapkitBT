import Foundation
import UIKit
extension UIImageView {
    func load(urlString: String) {
        DispatchQueue.global().async { [weak self] in
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url),let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                }
            } else {
                DispatchQueue.main.async {
                    self?.image = UIImage(named: "errorImage")
                }
            }
           
        }
    }
    
    static func rounded(size: CGSize)-> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 0.1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.frame.size = size
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        imageView.clipsToBounds = true
        return imageView
    }
    
  
}

extension UIImage {
    func decodedImage() -> UIImage {
          guard let cgImage = cgImage else { return self }
          let size = CGSize(width: cgImage.width, height: cgImage.height)
          let colorSpace = CGColorSpaceCreateDeviceRGB()
          let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: 8, bytesPerRow: cgImage.bytesPerRow, space: colorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
          context?.draw(cgImage, in: CGRect(origin: .zero, size: size))
          guard let decodedImage = context?.makeImage() else { return self }
          return UIImage(cgImage: decodedImage)
      }
}
