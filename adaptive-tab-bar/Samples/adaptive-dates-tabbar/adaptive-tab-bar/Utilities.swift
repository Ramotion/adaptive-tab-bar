import Foundation
import UIKit

extension UITabBar {

    func getFrameForTabAt(index: Int) -> CGRect? {
        var frames = self.subviews.compactMap { return $0 is UIControl ? $0.frame : nil }
        frames.sort { $0.origin.x < $1.origin.x }
        return frames[safe: index]
    }
}

extension Collection {

    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
