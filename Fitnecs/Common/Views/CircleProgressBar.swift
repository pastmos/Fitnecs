//
//  CircleProgressView.swift
//  Fitnecs
//
//  Created by Panov Sergey on 16.10.2020.
//

import UIKit
import SnapKit


class CircularProgressBar: UIView {

    // MARK: awakeFromNib

    override func awakeFromNib() {
        super.awakeFromNib()
        self.label = makeLabel(withText: "", 10, width: self.bounds.width * 0.8)
        self.addSubview(label)
    }


    // MARK: Public

    public var lineWidth: CGFloat = 2 {
        didSet{
            foregroundLayer.lineWidth = lineWidth
            backgroundLayer.lineWidth = lineWidth - (0.20 * lineWidth)
        }
    }

    public var maxValue: Double = 100

    public var wholeCircleAnimationDuration: Double = 1

    public var lineBackgroundColor: UIColor = Assets.Colors.backgroundProgress.color
    public var lineColor: UIColor = .blue {
        didSet {
            foregroundLayer.strokeColor = lineColor.cgColor
        }
    }
    public var lineFinishColor: UIColor = .green

    public func setProgress(to progress: Double, maxValue: Double, lineColor: UIColor, thickness: CGFloat = 4, isFractional: Bool = true, withAnimation: Bool = true) {

        self.maxValue = maxValue
        self.lineColor = lineColor
        self.lineWidth = thickness
        self.isFractional = isFractional
        self.progress = progress

        drawBackgroundLayer()
        drawForegroundLayer()

        // to show end of progress correctly
        let ratio = progress / maxValue
        if ratio > 0.98 && ratio < 0.995 {
            self.progress = 0.98 * maxValue
        }

        let animationDuration = wholeCircleAnimationDuration //* (progress / maxValue)

        maskLayer.strokeEnd = CGFloat(self.progress / maxValue)

        if withAnimation {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.toValue = self.progress / maxValue
            animation.duration = animationDuration
            maskLayer.add(animation, forKey: "foregroundAnimation")
        }

        var currentTime: Double = 0
        let timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            if currentTime >= animationDuration {
                self.label.text = isFractional ? "\(Double(progress).roundTo(1))" : "\(Int(progress))"
                timer.invalidate()
            }else {
                currentTime += 0.05
                var currentProgress = (currentTime / animationDuration * progress)
                currentProgress = isFractional ? currentProgress.roundTo(1) : floor(currentProgress)

                self.label.text = isFractional ? "\(Double(currentProgress))" : "\(Int(currentProgress))"
            }
        }
        timer.fire()

    }




    // MARK: Private
    private var label = UILabel()
    private let foregroundLayer = CAShapeLayer()
    private let backgroundLayer = CAShapeLayer()
    private let gradient = CAGradientLayer()
    internal let maskLayer = CAShapeLayer()
    private var radius: CGFloat {
        if self.frame.width < self.frame.height {
            return (self.frame.width - lineWidth) / 2
        }
        else {
            return (self.frame.height - lineWidth) / 2
        }
    }

    private var pathCenter: CGPoint {
        return self.convert(self.center, from: self.superview)
    }

    private var isFractional = true

    private var progress: Double = 0


    private func drawBackgroundLayer() {
        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        self.backgroundLayer.path = path.cgPath
        self.backgroundLayer.strokeColor = lineBackgroundColor.cgColor
        self.backgroundLayer.lineWidth = lineWidth - (lineWidth * 20 / 100)
        self.backgroundLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(backgroundLayer)

    }

    private func drawForegroundLayer() {

        let startAngle = (-CGFloat.pi / 2) + lineWidth * 0.009
        let endAngle = 2 * CGFloat.pi + startAngle

        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        gradient.colors = [UIColor.white.cgColor, UIColor.blue.cgColor]
        gradient.frame = bounds
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.5, y: 0)
        if #available(iOS 12.0, *) {
            gradient.type = .conic
        }else {
            // Fallback on earlier versions
        }

        maskLayer.lineCap = .round
        maskLayer.fillColor = UIColor.clear.cgColor
        maskLayer.strokeColor = UIColor.white.cgColor
        maskLayer.lineWidth = lineWidth
        maskLayer.path = path.cgPath
        gradient.mask = maskLayer
        layer.addSublayer(gradient)
    }


    private func makeLabel(withText text: String, _ fontSize: CGFloat, width: CGFloat) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 100))
        label.text = text
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = FontFamily.Calibri.regular.font(size: fontSize)
        label.textColor = .black
        label.center = pathCenter
        return label
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.label.font = FontFamily.Calibri.regular.font(size: CGFloat(self.bounds.width / 4.5))
        self.label.snp.makeConstraints { make in
            make.width.equalTo(self.bounds.width * 0.8)
            make.center.equalTo(self)
        }
    }

}
