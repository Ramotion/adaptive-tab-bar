import Foundation
import UIKit

extension UIImage {

    /**
     Returns a copy of self, scaled by a specified scale factor (with an optional image orientation).

     Example:
     ```
     let image = UIImage(named: <image_name>) // image size = (width: 200, height: 100)
     image?.resized(width: 50, height: 50) // image size = (width: 50, height: 50)
     image?.resized(width: 50, height: 50, maintainAspectRatio: true) // image size = (width: 50, height: 25)
     ```

     - parameter width: The width to which to resize the image.
     - parameter height: The height to which to resize the image.
     - parameter maintainAspectRatio: A Boolean flag indicating whether or not to maintain the image's aspect ratio when resizing (optional, defaults to `false`).
     - returns: A copy of self, resized to a specified width and heigh (with an option to maintain the original aspect ratio).
     */
    public func resized(width: CGFloat, height: CGFloat, maintainAspectRatio: Bool = false, insets: UIEdgeInsets = .zero) -> UIImage? {

        let inputSize = CGSize(width: width, height: height)
        let newSize: CGSize

        if maintainAspectRatio {
            let ratio = min(inputSize.width / size.width, inputSize.height / size.height)
            newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        } else {
            newSize = inputSize
        }

        let contextSize = CGSize(width: newSize.width + insets.right + insets.left, height: newSize.height + insets.bottom + insets.top)
        UIGraphicsBeginImageContextWithOptions(contextSize, false, UIScreen.main.scale)

        defer { UIGraphicsEndImageContext() }

        draw(in: CGRect(origin: CGPoint(x: insets.left, y: insets.top), size: newSize))

        return UIGraphicsGetImageFromCurrentImageContext()
    }

    public func resized(size: CGSize, maintainAspectRatio: Bool = false, insets: UIEdgeInsets = .zero) -> UIImage? {
        return resized(width: size.width, height: size.height, maintainAspectRatio: maintainAspectRatio, insets: insets)
    }
}
