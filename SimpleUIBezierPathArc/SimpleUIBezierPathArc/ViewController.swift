//
//  ViewController.swift
//  SimpleUIBezierPathArc
//
//  Created by 1 on 06/03/2020.
//  Copyright © 2020 swieeft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let centerPoint = view.center
        let startPoint = CGPoint(x: centerPoint.x + 100, y: centerPoint.y + 50)
        let angle: CGFloat = 180
//        let endPoint = CGPoint(x: centerPoint.x - 100, y: centerPoint.y + 50)

        drawPointDot(centerPoint: centerPoint, startPoint: startPoint)
        drawArc(centerPoint: centerPoint, startPoint: startPoint, angle: angle)
//        drawPointDot(centerPoint: centerPoint, startPoint: startPoint, endPoint: endPoint)
//        drawArc(centerPoint: centerPoint, startPoint: startPoint, endPoint: startPoint)
    }

    func drawPointDot(centerPoint: CGPoint, startPoint: CGPoint) {

        let path = UIBezierPath()
        path.move(to: CGPoint(x: centerPoint.x + 5, y: centerPoint.y))
        path.addArc(withCenter: centerPoint, radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        path.move(to: CGPoint(x: startPoint.x + 5, y: startPoint.y))
        path.addArc(withCenter: startPoint, radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)

        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = UIColor.black.cgColor
        layer.fillMode = .forwards

        self.view.layer.addSublayer(layer)
    }

    func drawArc(centerPoint: CGPoint, startPoint: CGPoint, angle: CGFloat) {
        let radius = getRadius(center: centerPoint, start: startPoint)
        let start = getStartAngle(center: centerPoint, start: startPoint, radius: radius)
        let end = getEndAngle(startAngle: start, angle: angle)

        let arcPath = UIBezierPath()
        arcPath.move(to: startPoint)
        arcPath.addArc(withCenter: centerPoint, radius: radius, startAngle: start, endAngle: end, clockwise: true)

        let arcLayer = CAShapeLayer()
        arcLayer.path = arcPath.cgPath
        arcLayer.lineWidth = 3
        arcLayer.strokeEnd = 1
        arcLayer.strokeColor = UIColor.red.cgColor
        arcLayer.fillColor = UIColor.clear.cgColor
        arcLayer.fillMode = .forwards

        view.layer.addSublayer(arcLayer)
    }
//    func drawPointDot(centerPoint: CGPoint, startPoint: CGPoint, endPoint: CGPoint) {
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: centerPoint.x + 5, y: centerPoint.y))
//        path.addArc(withCenter: centerPoint, radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
//        path.move(to: CGPoint(x: startPoint.x + 5, y: startPoint.y))
//        path.addArc(withCenter: startPoint, radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
//        path.move(to: CGPoint(x: endPoint.x + 5, y: endPoint.y))
//        path.addArc(withCenter: endPoint, radius: 5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
//
//        let layer = CAShapeLayer()
//        layer.path = path.cgPath
//        layer.fillColor = UIColor.black.cgColor
//        layer.fillMode = .forwards
//
//        self.view.layer.addSublayer(layer)
//    }
//
//    func drawArc(centerPoint: CGPoint, startPoint: CGPoint, endPoint: CGPoint) {
//        let radius = getRadius(center: centerPoint, start: startPoint)
//        let start = getAngle(center: centerPoint, point: startPoint, radius: radius)
//        let end = getAngle(center: centerPoint, point: endPoint, radius: radius)
//
//        let arcPath = UIBezierPath()
//        arcPath.move(to: startPoint)
//        arcPath.addArc(withCenter: centerPoint, radius: radius, startAngle: start, endAngle: end, clockwise: true)
//
//        let arcLayer = CAShapeLayer()
//        arcLayer.path = arcPath.cgPath
//        arcLayer.lineWidth = 3
//        arcLayer.strokeEnd = 1
//        arcLayer.strokeColor = UIColor.red.cgColor
//        arcLayer.fillColor = UIColor.clear.cgColor
//        arcLayer.fillMode = .forwards
//
//        view.layer.addSublayer(arcLayer)
//    }
//
    func getRadius(center: CGPoint, start: CGPoint) -> CGFloat {
        let xDist: CGFloat = start.x - center.x
        let yDist: CGFloat = start.y - center.y

        let radius: CGFloat = sqrt((xDist * xDist) + (yDist * yDist))// 제곱근 계산
        return radius
    }

//    func getAngle(center: CGPoint, point: CGPoint, radius: CGFloat) -> CGFloat {
//        let origin = CGPoint(x: center.x + radius, y: center.y)
//        let v1 = CGVector(dx: origin.x - center.x, dy: origin.y - center.y)
//        let v2 = CGVector(dx: point.x - center.x, dy: point.y - center.y)
//        let angle = atan2(v2.dy, v2.dx) - atan2(v1.dy, v1.dx)
//
//        return angle
//    }

    func getStartAngle(center: CGPoint, start: CGPoint, radius: CGFloat) -> CGFloat {
        let origin = CGPoint(x: center.x + radius, y: center.y) // Center에서 radius 만큼 이동한 0도의 위치
        let v1 = CGVector(dx: origin.x - center.x, dy: origin.y - center.y)
        let v2 = CGVector(dx: start.x - center.x, dy: start.y - center.y)
        let angle = atan2(v2.dy, v2.dx) - atan2(v1.dy, v1.dx)

        return angle
    }

    func getEndAngle(startAngle: CGFloat, angle: CGFloat) -> CGFloat {
        return (angle * (.pi / 180)) + startAngle
    }
//
//    func getEndAngle(center: CGPoint, end: CGPoint, radius: CGFloat) -> CGFloat {
//        let origin = CGPoint(x: center.x + radius, y: center.y)
//        let v1 = CGVector(dx: origin.x - center.x, dy: origin.y - center.y)
//        let v2 = CGVector(dx: end.x - center.x, dy: end.y - center.y)
//        let angle = atan2(v2.dy, v2.dx) - atan2(v1.dy, v1.dx)
//        return angle
//    }
}
