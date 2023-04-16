import SwiftUI

struct GifImage: UIViewRepresentable {
    var gifName: String
    var isAnimating: Bool = true
    
    func makeUIView(context: UIViewRepresentableContext<GifImage>) -> UIView {
        return UIView()
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<GifImage>) {
        guard let gif = UIImage.gifImageWithName(gifName) else {
            print("Failed to load GIF image: \(gifName)")
            return
        }
        
        let imageView = UIImageView(image: gif)
        
        imageView.contentMode = .scaleAspectFit
        imageView.frame = uiView.bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        uiView.addSubview(imageView)
        
        if isAnimating {
            imageView.startAnimating()
        } else {
            imageView.stopAnimating()
        }
    }
}
