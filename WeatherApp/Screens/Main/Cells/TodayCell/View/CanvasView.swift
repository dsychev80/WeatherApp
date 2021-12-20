//
//  CanvasView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 10.12.2021.
//

import UIKit


final class CanvasView: UIView {
    // MARK: - Properties
    private var firstColor: CGColor
    private var secondColor: CGColor
    let curveLayer = CAShapeLayer()
    let curveGradientLayer = CAGradientLayer()
    let gradientLayer = CAGradientLayer()
    let mainLayer = CALayer()
    
    // MARK: - Lifecycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(withColors color1: UIColor, color2: UIColor) {
        self.firstColor = color1.cgColor
        self.secondColor = color2.cgColor
        super.init(frame: .zero)
        layer.cornerRadius = 24
        
        mainLayer.addSublayer(gradientLayer)
        mainLayer.addSublayer(curveLayer)
        self.layer.addSublayer(mainLayer)
        
        gradientLayer.colors = [firstColor, secondColor]
    }
    
    // MARK: - Methods
    override func draw(_ rect: CGRect) {
        setup()
    }
    
    private func setup() {
        let width: CGFloat = frame.width
        let height: CGFloat = frame.height
        
        curveLayer.frame = frame
        let curvePath = UIBezierPath()
        curvePath.move(to: CGPoint(x: 0.0, y: height / 2 * 1.3))
        curvePath.addLine(to: CGPoint(x: 0.0, y: height))
        curvePath.addLine(to: CGPoint(x: width, y: height))
        curvePath.addLine(to: CGPoint(x: width, y: height / 2 * 1.3))
        curvePath.addArc(withCenter: CGPoint(x: width / 2, y: height * 1.38), radius: width / 1.4, startAngle: 0, endAngle: .pi, clockwise: false)
        curvePath.lineWidth = 0
        curvePath.fill()
        curvePath.stroke()
        curveLayer.path = curvePath.cgPath
        curveLayer.fillColor = firstColor
        
        curveGradientLayer.frame = curveLayer.frame
        mainLayer.frame = self.frame
        gradientLayer.frame = frame
    }
}
