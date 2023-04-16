import SwiftUI

extension UIImage {
    static func gifImageWithName(_ name: String) -> UIImage? {
        guard let bundleURL = Bundle.main
            .url(forResource: name, withExtension: "gif"),
            let imageData = try? Data(contentsOf: bundleURL) else {
                print("Failed to load GIF image data: \(name)")
                return nil
        }
        
        guard let source = CGImageSourceCreateWithData(imageData as CFData, nil) else {
            print("Failed to create CGImageSource")
            return nil
        }
        
        let count = CGImageSourceGetCount(source)
        
        var images = [UIImage]()
        var delays = [Double]()
        
        for i in 0..<count {
            guard let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) else {
                print("Failed to create CGImage")
                continue
            }
            
            let image = UIImage(cgImage: cgImage)
            
            images.append(image)
            
            if let properties = CGImageSourceCopyPropertiesAtIndex(source, i, nil) as? [String: Any],
               let gifProperties = properties[kCGImagePropertyGIFDictionary as String] as? [String: Any],
               let delayTime = gifProperties[kCGImagePropertyGIFDelayTime as String] as? Double {
                delays.append(delayTime)
            } else {
                delays.append(0.1)
            }
        }
        
        let animation = UIImage.animatedImage(with: images, duration: delays.reduce(0, +))
        
        return animation
    }
}
