
import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var imageViewModel: ImageViewModel
    @State var showDetails = false
    @State var first = true
    @State var nextButton = false
    @State var detailButton = false
    
    var body: some View {
        
        VStack {
            Button("Image Classifier"){
                if(first){
                    imageViewModel.classifyImage()
                    first = false
                    nextButton = true
                    detailButton = true
                }
            }.padding()
            
            Image(imageViewModel.images[imageViewModel.currentIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Text(imageViewModel.bestExplanation)
            
            Button("Next Image >") {
                if(nextButton){
                    if imageViewModel.currentIndex < imageViewModel.images.count - 1 {
                        imageViewModel.currentIndex = imageViewModel.currentIndex + 1
                    }
                    else {
                        imageViewModel.currentIndex = 0
                    }
                    imageViewModel.classifyImage()}
            }.padding()
            
            Button("Detailed Information") {
                if detailButton{
                    showDetails.toggle()
                }
            }
            if showDetails {
                
                Text(imageViewModel.classificationLabel)
                    .padding()
            }
        }
        .font(.system(size: 20))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

