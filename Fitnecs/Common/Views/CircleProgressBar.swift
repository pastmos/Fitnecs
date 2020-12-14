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
        label = makeLabel(withText: "", 10, color: Assets.Colors.underlineColor.color, width: self.bounds.width * 0.8, lines: 1, center: pathCenter)
        label.font = FontFamily.SFUIDisplay.medium.font(size: CGFloat(self.bounds.width / 5))

        topLabel = makeLabel(withText: "индекс подвижности", 10, color: Assets.Colors.greyTextColor.color, width: self.bounds.width * 0.27, lines: 2, center: pathCenter)
        bottomLabel = makeLabel(withText: " вчера", 10, color: Assets.Colors.mainTextColor.color, width: 0, lines: 1, center: pathCenter)
        bottomYesterdayIndexLabel = makeLabel(withText: String(describing: yesterdayIndex), 10, color: Assets.Colors.mainTextColor.color, width: 0, lines: 1, center: pathCenter)
        yesterdayIndexLabel = makeLabel(withText: String(Int(yesterdayIndex)), 10, color: .white, width: 8, lines: 1, center: yesterdayIndexView.center)

        bottomYesterdayIndexStack = UIStackView()
        bottomYesterdayIndexStack.addArrangedSubview(bottomYesterdayIndexLabel)
        bottomYesterdayIndexStack.addArrangedSubview(bottomLabel)

        addSubview(topLabel)
        addSubview(bottomYesterdayIndexStack)
        addSubview(label)
    }


    // MARK: Public

    public var lineWidth: CGFloat = 2 {
        didSet {
            foregroundLayer.lineWidth = lineWidth
            backgroundLayer.lineWidth = lineWidth - (0.20 * lineWidth)
        }
    }

    public var maxValue: Double = 100

    public var wholeCircleAnimationDuration: Double = 1

    public var lineBackgroundColor: UIColor = Assets.Colors.backgroundProgress.color
    public var startColor: UIColor = .blue
    public var endColor: UIColor = .blue
    public var lineFinishColor: UIColor = .green

    public func setProgress(to progress: Double, maxValue: Double, startColor: UIColor, endColor: UIColor, thickness: CGFloat = 7, isFractional: Bool = true, withAnimation: Bool = true, type: CircleType, yesterdayIndex: Double = 0) {

        self.maxValue = maxValue
        self.startColor = startColor
        self.endColor = endColor
        self.lineWidth = thickness
        self.isFractional = isFractional
        self.progress = progress
        self.type = type
        self.yesterdayIndex = yesterdayIndex

        switch type {

        case .activityIndex:
            print("")
        case .sleep:
            topLabel.removeFromSuperview()
            bottomYesterdayIndexStack.removeFromSuperview()
        case .yesterdayIndex:
            topLabel.removeFromSuperview()
            bottomYesterdayIndexStack.removeFromSuperview()
            label.removeFromSuperview()
        }

        drawBackgroundLayer()
        drawForegroundLayer()

        // to show end of rounded progress correctly
//        let ratio = progress / maxValue
//        if ratio > 0.98 && ratio < 0.995 {
//            self.progress = 0.98 * maxValue
//        }

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
        let timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [self] timer in
            if currentTime >= animationDuration {
                self.label.text = isFractional ? "\(Double(progress).roundTo(1))" : "\(Int(progress))"
                let hour = type == .sleep ? "ч" : ""
                self.label.text! += hour

               addYesterdayCircleView()

                timer.invalidate()
            }
            else {
                currentTime += 0.05
                var currentProgress = (currentTime / animationDuration * progress)
                currentProgress = isFractional ? currentProgress.roundTo(1) : floor(currentProgress)

                self.label.text = isFractional ? "\(Double(currentProgress))" : "\(Int(currentProgress))"
            }
        }
        timer.fire()

    }

    func removeYesterdayIndexView() {
        yesterdayIndexView.removeFromSuperview()
        isYesterdayAdded = false
    }

    private func addYesterdayCircleView() {
        if type == .yesterdayIndex {

            guard !isYesterdayAdded else {
                return
            }

            let point = self.point(progress: self.progress / self.maxValue, radius: self.bounds.width / 2 - 1)
            yesterdayIndexView = UIView(frame: CGRect(x: point.x, y: point.y, width: self.bounds.width * 0.07, height: self.bounds.width * 0.07))
            yesterdayIndexView.center.x = point.x
            yesterdayIndexView.center.y = point.y
            yesterdayIndexView.backgroundColor = Assets.Colors.circleYesterdayGradientEnd.color
            yesterdayIndexView.makeCircle()

            yesterdayIndexLabel.text = String(Int(yesterdayIndex))

            yesterdayIndexView.addSubview(yesterdayIndexLabel)

            yesterdayIndexLabel.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(2)
            }

            addSubview(yesterdayIndexView)
            isYesterdayAdded = true
        }
    }

    func point(progress: Double, radius: CGFloat) -> CGPoint {
        let x = radius * (1 + CGFloat(sin(progress * 2 * Double.pi)))
        let y = radius * (1 - CGFloat(cos(progress * 2 * Double.pi)))
        return CGPoint(x: x, y: y)
    }

    // MARK: Private
    private var label: UILabel!
    private var topLabel: UILabel!
    private var bottomLabel: UILabel!
    private var bottomYesterdayIndexLabel: UILabel!
    private var yesterdayIndexLabel: UILabel!
    private var bottomYesterdayIndexStack: UIStackView!
    private var yesterdayIndexView = UIView()
    private let foregroundLayer = CAShapeLayer()
    private let backgroundLayer = CAShapeLayer()
    private let gradient = CAGradientLayer()
    internal let maskLayer = CAShapeLayer()
    internal let yesterdayView = UIView()
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
    private var type: CircleType = .activityIndex
    private var yesterdayIndex: Double = 0
    private var isYesterdayAdded = false


    private func drawBackgroundLayer() {
        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius + (lineWidth * 0.2) / 2, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        self.backgroundLayer.path = path.cgPath
        self.backgroundLayer.strokeColor = type == .yesterdayIndex ? Assets.Colors.circleYesterdayBackground.color.cgColor : lineBackgroundColor.cgColor
        self.backgroundLayer.lineWidth = type == .yesterdayIndex ? 1 : lineWidth - (lineWidth * 0.2)
        self.backgroundLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(backgroundLayer)
    }

    private func drawForegroundLayer() {

        let startAngle = (-(CGFloat.pi) / 2)
        let endAngle = 2 * .pi + startAngle

        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.frame = bounds
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.5, y: 0)


        if #available(iOS 12.0, *) {
            gradient.type = .conic
        }
        else {
            // Fallback on earlier versions
        }

        //maskLayer.lineCap = .round
        maskLayer.fillColor = UIColor.clear.cgColor
        maskLayer.strokeColor = UIColor.white.cgColor
        maskLayer.lineWidth = lineWidth
        maskLayer.path = path.cgPath

        gradient.mask = maskLayer
        layer.addSublayer(gradient)

        bottomYesterdayIndexLabel.text = String(Int(yesterdayIndex))
    }


    private func makeLabel(withText text: String, _ fontSize: CGFloat, color: UIColor, width: CGFloat, lines: Int, center: CGPoint) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = lines
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = FontFamily.SFUIDisplay.medium.font(size: fontSize)
        label.textColor = color
        label.center = center
        return label
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        label.snp.updateConstraints { make in
            make.width.equalTo(self.frame.width * 0.4)
            make.center.equalTo(self)
        }

        let offsetTop = self.label.frame.height / 2 + 10
        let offsetBottom = self.label.frame.height / 2 + 6

        bottomYesterdayIndexStack.snp.updateConstraints { make in
            make.centerX.equalTo(label)
            make.centerY.equalTo(label).offset(offsetBottom)
        }

        topLabel.snp.updateConstraints { make in
            make.centerX.equalTo(label)
            make.centerY.equalTo(label).offset(-offsetTop)
            make.width.equalTo(self.frame.width * 0.3)
        }

    }

}


enum CircleType {
    case activityIndex
    case sleep
    case yesterdayIndex
}
