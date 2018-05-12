//
//  GraphVC.swift
//  EngineeringElectromagnatic
//
//  Created by Techsviewer on 09/04/2018.
//  Copyright © 2018 maqCloud. All rights reserved.
//

import UIKit
import Charts


class GraphVC: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var z: UITextField!
    @IBOutlet weak var W: UITextField!
    @IBOutlet weak var PlotGraph: UIButton!
    @IBOutlet weak var Text4: UITextField!
    @IBOutlet weak var EY0: UITextField!
    @IBOutlet weak var E0: UITextField!
    @IBOutlet weak var Cos: UITextField!
    @IBOutlet weak var hostView: LineChartView!
    var lineChartEntry = [ChartDataEntry]()
    var ys2 = [Double]()
    var ys3 = [Double]()
    var timer = Timer()
    var t = 1.00
    var ax: Double?
    var xaxis : [Double] = []
    let color = UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        initPlot()
    }
    
    
    @IBAction func PlotAction(_ sender: Any) {
        scheduledTimerWithTimeInterval()
    }
    func scheduledTimerWithTimeInterval(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounting(){
        NSLog("counting..")
        t = t+1
        if t < 30 {
            updateGraph(x: 0.00, y: 0.00, z: 0.00, a: 0.00)
        }
        
    }
    func updateGraph(x: Double, y: Double, z: Double, a: Double){
    
//        if lineChartEntry.count > 12{
//            lineChartEntry.removeAll()
//        }
        
            ys2.append(Equation(Exo: Double(self.E0.text!)!, B: Double(self.Cos.text!)!, w: Double(self.W.text!)!, z: Double(self.z.text!)!, t: Double(t)))
    
        let yse2 = ys2.enumerated().map { x, y in return ChartDataEntry(x: Double(x), y: y/2) }
        
        
        
            ys3.append(Equation2(EYo: Double(self.EY0.text!)!, B: Double(self.Cos.text!)!, Phi: Double(self.Text4.text!)!, w: Double(self.W.text!)!, z: Double(self.z.text!)!, t: Double(t)))
        
        let yse3 = ys3.enumerated().map { x, y in return ChartDataEntry(x: Double(x), y: y/2) }
        
        
        let line1 = LineChartDataSet(values: yse2, label: "ax")
        line1.setColor(UIColor(red: 64/255, green: 204/255, blue: 228/255, alpha: 0.70))
        line1.drawCircleHoleEnabled = false
        line1.drawCirclesEnabled = false
        line1.fillAlpha = 0.26
        line1.mode = .cubicBezier
        let value2 = ChartDataEntry(x: x, y: y)
        lineChartEntry.append(value2)
        
        let line2 = LineChartDataSet(values: yse3, label: "ay")
        
        line2.setColor(UIColor(red: 64/255, green: 204/255, blue: 228/255, alpha: 0.70))
        line2.drawCirclesEnabled = false
        line2.drawCircleHoleEnabled = false
        line2.mode = .cubicBezier
        line2.axisDependency = .left
        line2.lineWidth = 1.5
        line2.drawValuesEnabled = false
        line2.fillAlpha = 0.26
        line2.fillColor = self.color
        line2.highlightColor = self.color
        line2.lineDashLengths = [5, 5]
        
        let value3 = ChartDataEntry(x: x, y: y)
        lineChartEntry.append(value3)
        let data = LineChartData(dataSets: [line1, line2])
        data.setValueTextColor(.white)
        
        hostView.data = data
        hostView.drawBordersEnabled = false
        hostView.setScaleEnabled(true)
        hostView.legend.form = .line
//        hostView.setVisibleXRange(minXRange: 1.00, maxXRange: 3.00)
        hostView.chartDescription?.text = "Phase Difference = "
//        hostView.animate(xAxisDuration: 10.00)
//        hostView.animate(yAxisDuration: 10.00)
        
    }
    
    
    
    func Equation (Exo: Double, B: Double,w: Double, z:Double, t:Double )->Double{
        let CValue = (cos((w*t))*cos((B*z)))+(sin(w*t)*sin(B*z))
        return CValue * Exo
    }
    
    
    func Equation2 (EYo: Double, B: Double, Phi: Double, w: Double, z:Double, t:Double )->Double{
        let CValue = cos((w*t)-(B*z)+Phi)
        return CValue * EYo
    }
    
    
    func initPlot() {
        PlotGraph.backgroundColor = UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1.0)
        PlotGraph.layer.cornerRadius = CGFloat(10.0)
        PlotGraph.setTitleColor(.white, for: .normal)
        PlotGraph.clipsToBounds = true
        Cos.layer.borderWidth = 1.0
        Cos.layer.borderColor = color.cgColor
        Cos.attributedPlaceholder = NSAttributedString(string: "β", attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 0.7)])
        Cos.layer.cornerRadius = CGFloat(8.0)
        Text4.layer.borderWidth = 1.0
        Text4.layer.borderColor = color.cgColor
        Text4.attributedPlaceholder = NSAttributedString(string: "φ ( Phi )", attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 0.7)])
        Text4.layer.cornerRadius = CGFloat(8.0)
        EY0.layer.borderWidth = 1.0
        EY0.layer.borderColor = color.cgColor
        EY0.attributedPlaceholder = NSAttributedString(string: "EY", attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 0.7)])
        EY0.layer.cornerRadius = CGFloat(8.0)
        E0.layer.borderWidth = 1.0
        E0.layer.borderColor = color.cgColor
        E0.attributedPlaceholder = NSAttributedString(string: "EXo", attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 0.7)])
        E0.layer.cornerRadius = CGFloat(8.0)
        z.layer.borderWidth = 1.0
        z.layer.borderColor = color.cgColor
        z.attributedPlaceholder = NSAttributedString(string: "z", attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 0.7)])
        z.layer.cornerRadius = CGFloat(8.0)
        W.layer.borderWidth = 1.0
        W.layer.borderColor = color.cgColor
        W.attributedPlaceholder = NSAttributedString(string: "W", attributes: [NSAttributedStringKey.foregroundColor: UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 0.7)])
        W.layer.cornerRadius = CGFloat(8.0)
        tabBarController?.tabBar.tintColor = color
    }
    
}
