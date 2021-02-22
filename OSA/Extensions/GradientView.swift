//
//  GradientView.swift
//  OPS
//
//  Created by Happy Sanz Tech on 31/12/20.
//

import Foundation
//class GradientBackgroundView {
//
//    var gl:CAGradientLayer!
//
////    let colorTop = UIColor(red: 45.0 / 255.0, green: 148.0 / 255.0, blue: 235.0 / 255.0, alpha: 1.0).cgColor
////    let colorBottom = UIColor(red: 23.0 / 255.0, green: 74.0 / 255.0, blue: 118.0 / 255.0, alpha: 1.0).cgColor
//
////    init() {
////     self.gl = CAGradientLayer()
////     self.gl.colors = [colorTop, colorBottom]
////     self.gl.startPoint = CGPoint(x: 0.5, y: 0)
////     self.gl.endPoint = CGPoint(x: 0.5, y: 1.0)
////    }
//
//}
//
//extension UIView {
//
//    func addGradient(colors: [UIColor], locations: [NSNumber]) {
//        addSubview(ViewWithGradient(addTo: self, colors: colors, locations: locations))
//    }
//}
//
//class ViewWithGradient: UIView {
//
//    private var gradient = CAGradientLayer()
//
//    init(addTo parentView: UIView, colors: [UIColor], locations: [NSNumber]){
//
//        super.init(frame: CGRect(x: 0, y: 0, width: 1, height: 2))
//        restorationIdentifier = "__ViewWithGradient"
//
//        for subView in parentView.subviews {
//            if let subView = subView as? ViewWithGradient {
//                if subView.restorationIdentifier == restorationIdentifier {
//                    subView.removeFromSuperview()
//                    break
//                }
//            }
//        }
//
//        let cgColors = colors.map { (color) -> CGColor in
//            return color.cgColor
//        }
//
//        gradient.frame = parentView.frame
//        gradient.colors = cgColors
//        gradient.locations = locations
//        backgroundColor = .clear
//
//        parentView.addSubview(self)
//        parentView.layer.insertSublayer(gradient, at: 0)
//        parentView.backgroundColor = .clear
//        autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        clipsToBounds = true
//        parentView.layer.masksToBounds = true
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        if let parentView = superview {
//            gradient.frame = parentView.bounds
//        }
//    }
//
//    override func removeFromSuperview() {
//        super.removeFromSuperview()
//        gradient.removeFromSuperlayer()
//    }
//}


public enum CAGradientPoint {
    case topLeft
    case centerLeft
    case bottomLeft
    case topCenter
    case center
    case bottomCenter
    case topRight
    case centerRight
    case bottomRight
    var point: CGPoint {
        switch self {
        case .topLeft:
            return CGPoint(x: 0, y: 0)
        case .centerLeft:
            return CGPoint(x: 0, y: 0.5)
        case .bottomLeft:
            return CGPoint(x: 0, y: 1.0)
        case .topCenter:
            return CGPoint(x: 0.5, y: 0)
        case .center:
            return CGPoint(x: 0.5, y: 0.5)
        case .bottomCenter:
            return CGPoint(x: 0.5, y: 1.0)
        case .topRight:
            return CGPoint(x: 1.0, y: 0.0)
        case .centerRight:
            return CGPoint(x: 1.0, y: 0.5)
        case .bottomRight:
            return CGPoint(x: 1.0, y: 1.0)
        }
    }
}

extension CAGradientLayer {

    convenience init(start: CAGradientPoint, end: CAGradientPoint, colors: [CGColor], type: CAGradientLayerType) {
        self.init()
        self.frame.origin = CGPoint.zero
        self.startPoint = start.point
        self.endPoint = end.point
        self.colors = colors
        self.locations = (0..<colors.count).map(NSNumber.init)
        self.type = type
    }
}

extension UIView {

    func layerGradient(startPoint:CAGradientPoint, endPoint:CAGradientPoint ,colorArray:[CGColor], type:CAGradientLayerType ) {
        let gradient = CAGradientLayer(start: .topLeft, end: .topRight, colors: colorArray, type: type)
        gradient.frame.size = self.frame.size
        self.layer.insertSublayer(gradient, at: 0)
    }
}


      
