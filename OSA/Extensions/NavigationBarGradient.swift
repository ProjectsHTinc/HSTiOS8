//
//  NavigationBarGradient.swift
//  OSA
//
//  Created by Happy Sanz Tech on 02/02/21.
//

import UIKit

class UINavigationBarGradientView: UIView {
    
    enum Point {
        case topRight, topLeft
        case bottomRight, bottomLeft
        case left, right
        case custom(point: CGPoint)

        var point: CGPoint {
            switch self {
//                case .topRight: return CGPoint(x: 1, y: 0)
                case .topRight: return CGPoint(x: 1, y: 1)
                case .topLeft: return CGPoint(x: 0, y: 0)
                case .left: return CGPoint(x: 0, y: 0.5)
                case .right: return CGPoint(x:1 , y: 0.5)
                case .bottomRight: return CGPoint(x: 1, y: 1)
                case .bottomLeft: return CGPoint(x: 0, y: 1)
                case .custom(let point): return point
            }
        }
    }

    private weak var gradientLayer: CAGradientLayer!

    convenience init(colors: [UIColor], startPoint: Point = .topLeft,
                     endPoint: Point = .bottomLeft, locations: [NSNumber] = [0, 1]) {
        self.init(frame: .zero)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        layer.addSublayer(gradientLayer)
        self.gradientLayer = gradientLayer
        set(colors: colors, startPoint: startPoint, endPoint: endPoint, locations: locations)
        backgroundColor = .clear
    }

    func set(colors: [UIColor], startPoint: Point = .topLeft,
             endPoint: Point = .bottomLeft, locations: [NSNumber] = [0, 1]) {
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint.point
        gradientLayer.endPoint = endPoint.point
        gradientLayer.locations = locations
    }

    func setupConstraints() {
        guard let parentView = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: parentView.leftAnchor).isActive = true
        parentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        parentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        guard let gradientLayer = gradientLayer else { return }
        gradientLayer.frame = frame
        superview?.addSubview(self)
    }
}

extension UINavigationBar {
    func setGradientBackground(colors: [UIColor],
                               startPoint: UINavigationBarGradientView.Point = .topLeft,
                               endPoint: UINavigationBarGradientView.Point = .bottomLeft,
                               locations: [NSNumber] = [0, 1]) {
        guard let backgroundView = value(forKey: "backgroundView") as? UIView else { return }
        guard let gradientView = backgroundView.subviews.first(where: { $0 is UINavigationBarGradientView }) as? UINavigationBarGradientView else {
            let gradientView = UINavigationBarGradientView(colors: colors, startPoint: startPoint,
                                                           endPoint: endPoint, locations: locations)
            backgroundView.addSubview(gradientView)
            gradientView.setupConstraints()
            return
        }
        gradientView.set(colors: colors, startPoint: startPoint, endPoint: endPoint, locations: locations)
    }
    
    
}


//func setNavGradient() {
//
//       if let navigationbar = self.navigationController?.navigationBar {
//              navigationbar.setGradientBackground(colors: [UIColor(red: 189.0/255.0, green: 6.0/255.0, blue: 33.0/255.0, alpha: 1.0), UIColor(red: 95.0/255.0, green: 3.0/255.0, blue: 17.0/255.0, alpha: 1.0)], startPoint: .topLeft, endPoint: .bottomRight)
//              backView.layer.cornerRadius = 15
//       }
//}

//       //MARK:- Facebook Login
//       func fbLogin() {
//           let loginManager = LoginManager()
//           loginManager.logOut()
//           loginManager.logIn(permissions:[ .publicProfile, .email, .userFriends ], viewController: self) { loginResult in
//
//               switch loginResult {
//
//               case .failed(let error):
//                   //HUD.hide()
//                   print(error)
//
//               case .cancelled:
//                   //HUD.hide()
//                   print("User cancelled login process.")
//
//               case .success( _, _, _):
//                   print("Logged in!")
//                   self.getFBUserData()
//               }
//           }
//       }
//
//       func getFBUserData() {
//           //which if my function to get facebook user details
//           if((AccessToken.current) != nil){
//
//               GraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email, gender"]).start(completionHandler: { (connection, result, error) -> Void in
//                   if (error == nil){
//
//                       let dict = result as! [String : AnyObject]
//                       print(result!)
//                       print(dict)
//                       let picutreDic = dict as NSDictionary
//                       let tmpURL1 = picutreDic.object(forKey: "picture") as! NSDictionary
//                       let tmpURL2 = tmpURL1.object(forKey: "data") as! NSDictionary
//                    _ = tmpURL2.object(forKey: "url") as! String
//
//                       let nameOfUser = picutreDic.object(forKey: "name") as! String
////                        self.lblUserName.text = nameOfUser
//                    print(nameOfUser)
//
//                       var tmpEmailAdd = ""
//                       if let emailAddress = picutreDic.object(forKey: "email") {
//                           tmpEmailAdd = emailAddress as! String
////                           self.lblUserEmail.text = tmpEmailAdd
//                        print(tmpEmailAdd)
//                       }
//                       else {
//                           var usrName = nameOfUser
//                           usrName = usrName.replacingOccurrences(of: " ", with: "")
//                           tmpEmailAdd = usrName+"@facebook.com"
//                       }
//                   }
//                   print(error?.localizedDescription as Any)
//               })
//           }
//       }
