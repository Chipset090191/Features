//
//  ContentView.swift
//  ProjectLayering
//
//  Created by Mikhail Tikhomirov on 4/6/25.
//

import SwiftUI


struct ContentView: View {
    @State private var selectedOption: Set<ClothingOption> = []
    
    @State private var constructedStyle = [StyleInfo]()
    @State private var imagesForRendering: [UIImage] = []
    @State private var finalImage: UIImage?
    @State private var showActivityVC = false
    
    
    
    var body: some View {
            VStack(spacing: 5) {
                HStack() {
                    Spacer()
                    Text("Options")
                        .font(.system(size: 25, weight: .bold, design: .serif))
                        .foregroundStyle(Color.secondary)
                    Spacer()
                    Spacer()
                    Spacer()
                    Button{
                        showActivityVC.toggle()
                    }label: {
                        Image (systemName: "square.and.arrow.up")
                            .font(.system(size: 25)) // Adjust size as needed
                    }
                    .sheet(isPresented: $showActivityVC) {
                        //
                        ActivityVIewController(activityItems: ["Image of Created person", finalImage!])
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)

                
                Spacer()
                
                List {
                    ForEach(ClothingOption.allCases) { option in
                        MultipleSelectionRow(title: option.rawValue, isSelected: selectedOption.contains(option)) {
                            // Here is gonna be our code
                            
                            if selectedOption.contains(option) {
                                selectedOption.remove(option)
                                updateStyle(for: option, isAdding: false)
                                //
                                preparing()
                                
                            } else {
                                selectedOption.insert(option)
                                updateStyle(for: option, isAdding: true)
                                
                                preparing()
                                
                            }
                        }
                    }
                }
                
                .listStyle(.plain)
                .frame(height: 160)
                .padding(.horizontal, 80)
                if let convertedImage = finalImage {
                    Image(uiImage: convertedImage)
                        .resizable()
                        .scaledToFill()
                        .background(Color.white)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .onAppear {
                // start image posture
                let emptyPerson = StyleInfo(image: UIImage(named: "optimal"), layer: 0, styleType: .posture)
                constructedStyle.append(emptyPerson)
                preparing()
            }
          
    }
    
    func preparing() {
        imagesForRendering = constructedStyle
            .sorted(by: {$0.layer < $1.layer})
            .map{ $0.image ?? UIImage(named: "optimal")! }
            
        finalImage = renderingForFinalImage(images: imagesForRendering)
        
   }
    
    func updateStyle(for option: ClothingOption, isAdding: Bool) {
         guard let (type, assetName, layerNumber) = styleOptions[option] else { return }
            
        if isAdding {
            let style = StyleInfo(image: UIImage(named: assetName), layer: layerNumber, styleType: type)
            constructedStyle.append(style)
        } else {
            constructedStyle.removeAll(where: {$0.styleType == type })
        }
        preparing()
        
    
    }
}

struct MultipleSelectionRow: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.system(size: 16, weight: .semibold, design: .serif))
                    .foregroundStyle(Color.black)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundStyle(Color.cyan)
                }
                
            }
            
        }
    }
    
}


private func renderingForFinalImage(images: [UIImage])-> UIImage {
    guard let size = images.first?.size else { return UIImage(named: "optimal")! }
    
    let renderer = UIGraphicsImageRenderer(size: size)
    
    let output = renderer.image { _ in
        for image in images {
            image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        }
    }
    
    return output
}




#Preview {
    ContentView()
}
