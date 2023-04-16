import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .camera
    
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.black)
                .overlay(
                    Group {
                        if uiImage != nil {
                            Image(uiImage: uiImage!)
                                .resizable()
                                .scaledToFill()
                        } else {
                            Image("Scan")
                                .resizable()
                                .scaledToFill()
                        }
                    }
                )
                .onTapGesture {
                    uiImage = nil
                    classifier.reset()
                    isPresenting = true
                }
            
            VStack{
                Spacer()
                
                VStack{
                    if let imageClass = classifier.imageClass {
                        Result(imageClass: imageClass)
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity
                            )
                            .padding(30)
                    } else {
                        GifImage(gifName: "Loading")
                            .scaledToFill()
                            .padding(.bottom, 10)
                            .frame(width: 148.15, height: 90)
                    }
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity
                )
                .background(Color.white)
                .cornerRadius(40, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $isPresenting){
            ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                .onDisappear{
                    if uiImage != nil {
                        classifier.detect(uiImage: uiImage!)
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(classifier: ImageClassifier())
    }
}
