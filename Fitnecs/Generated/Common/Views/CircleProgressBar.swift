//
//  CircleProgressView.swift
//  Fitnecs
//
//  Created by Panov Sergey on 16.10.2020.
//

import UIKit
import SnapKit


class CircularProgressBar: UIView {

    //MARK: awakeFromNib

    override func awakeFromNib() {
        super.awakeFromNib()
        self.label = makeLabel(withText: "", 10, width: self.bounds.width * 0.8)
        self.addSubview(label)
    }


    //MARK: Public

    public var lineWidth:CGFloat = 2 {
        didSet{
            foregroundLayer.lineWidth = lineWidth
            backgroundLayer.lineWidth = lineWidth - (0.20 * lineWidth)
        }
    }

    public var safePercent: Int = 100 {
        didSet{
            setForegroundLayerColorForSafePercent()
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


    public func setProgress(to progressConstant: Double, maxValue: Double, lineColor: UIColor, thickness: CGFloat = 4, isFractional: Bool = true, withAnimation: Bool = true) {

        var progress: Double {
            get {
                if progressConstant > 0  {
                    return progressConstant
                }
                else {
                    return 0
                }
            }
        }
        self.maxValue = maxValue
        self.lineColor = lineColor
        self.lineWidth = thickness
        self.isFractional = isFractional


        let animationDuration = wholeCircleAnimationDuration //* (progress / maxValue)

        foregroundLayer.strokeEnd = CGFloat(progress / maxValue)

        if withAnimation {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.toValue = progress / maxValue
            animation.duration = animationDuration
            foregroundLayer.add(animation, forKey: "foregroundAnimation")

        }

        var currentTime:Double = 0
        let timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
            if currentTime >= animationDuration {
                self.label.text = isFractional ? "\(Double(progress).roundTo(1))" : "\(Int(progress))"
                timer.invalidate()
            } else {
                currentTime += 0.01
                var currentProgress = (currentTime/animationDuration * progress)
                currentProgress = isFractional ? currentProgress.roundTo(1) : floor(currentProgress)
//                if isFractional && currentProgress.truncatingRemainder(dividingBy: 1) < 0.01 {
//                    currentProgress = Double(Int(currentProgress))
//                }

                self.label.text = isFractional ? "\(Double(currentProgress))" : "\(Int(currentProgress))"
                //self.setForegroundLayerColorForSafePercent()
            }
        }
        timer.fire()

    }




    //MARK: Private
    private var label = UILabel()
    private let foregroundLayer = CAShapeLayer()
    private let backgroundLayer = CAShapeLayer()
    private var radius: CGFloat {
        get{
            if self.frame.width < self.frame.height { return (self.frame.width - lineWidth)/2 }
            else { return (self.frame.height - lineWidth)/2 }
        }
    }

    private var pathCenter: CGPoint{
        get{ return self.convert(self.center, from: self.superview) }
    }

    private var isFractional = true


    private func drawBackgroundLayer(){
        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        self.backgroundLayer.path = path.cgPath
        self.backgroundLayer.strokeColor = lineBackgroundColor.cgColor
        self.backgroundLayer.lineWidth = lineWidth - (lineWidth * 20/100)
        self.backgroundLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(backgroundLayer)

    }

    private func drawForegroundLayer(){

        let startAngle = (-CGFloat.pi/2)
        let endAngle = 2 * CGFloat.pi + startAngle

        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        foregroundLayer.lineCap = CAShapeLayerLineCap.round
        foregroundLayer.path = path.cgPath
        foregroundLayer.lineWidth = lineWidth
        foregroundLayer.fillColor = UIColor.clear.cgColor
        foregroundLayer.strokeColor = lineColor.cgColor
        //foregroundLayer.strokeEnd = 0

        self.layer.addSublayer(foregroundLayer)

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


    private func setForegroundLayerColorForSafePercent(){
        if Int(label.text!)! >= self.safePercent {
            self.foregroundLayer.strokeColor = lineFinishColor.cgColor
        } else {
            self.foregroundLayer.strokeColor = lineColor.cgColor
        }
    }

    private func setupView() {
        drawBackgroundLayer()
        drawForegroundLayer()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setupView()

        self.label.font = FontFamily.Calibri.regular.font(size: CGFloat(self.bounds.width / 4.5))
        self.label.snp.makeConstraints { (make) in
            make.width.equalTo(self.bounds.width * 0.8)
            make.center.equalTo(self)
        }
    }

}
