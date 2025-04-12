# Features
Some awesome and helpful technics

### 1. Create a Dressed charachter (2d Vector Graphics prj)
This project demonstrates how you can easily create an app with functionality to dress charackter by using Vector graphics 2d images with help out of UIImageRenderer.

<div align="center">
  <video src="https://github.com/user-attachments/assets/4e95eb97-87e1-449e-bd71-2b3c995a844f" controls width="600"></video>
</div>

The real magical things is taking place in `func renderingForFinalImage(images: [UIImage])-> UIImage` 


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
