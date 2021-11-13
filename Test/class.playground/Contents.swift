import UIKit

class VideoMode {
    var frameRate = 0.0
}

let tenEighty = VideoMode()
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

