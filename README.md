# Features
Some awesome and helpful technics

### 1. Create a Dressed charachter (2d Vector Graphics prj)
This project showcases how to efficiently create an application that allows users to dress a character using 2D vector graphic images, leveraging the capabilities of `UIImageRenderer`.

<div align="center">
  <video src="https://github.com/user-attachments/assets/4e95eb97-87e1-449e-bd71-2b3c995a844f" controls width="600"></video>
</div>

The core functionality is handled by the method `func renderingForFinalImage(images: [UIImage])-> UIImage` 

    
    let renderer = UIGraphicsImageRenderer(size: size)
    
    let output = renderer.image { _ in
        for image in images {
            image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        }
    }
    
    return output

This method generates the final composite image by sequentially drawing each UIImage from the input array. The images are ordered by their respective layers, ensuring the correct visual stacking. As a result, the output contains the fully rendered, dressed character.
