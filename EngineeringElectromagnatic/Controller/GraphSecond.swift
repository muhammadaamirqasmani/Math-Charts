//
//  GraphSecond.swift
//  EngineeringElectromagnatic
//
//  Created by Techsviewer on 21/04/2018.
//  Copyright © 2018 maqCloud. All rights reserved.
//
/*
import UIKit
import Charts

class GraphSecond: UIViewController {

    @IBOutlet weak var t: UITextField!
    @IBOutlet weak var Eo: UITextField!
    @IBOutlet weak var w: UITextField!
    @IBOutlet weak var GraphView: LineChartView!
    let color = UIColor(red: 64/255, green: 224/255, blue: 208/255, alpha: 1.0)

    var lineChartEntry = [ChartDataEntry]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateGraph(x: Double, y: Double){
        
        var ys2 = [Double]()
        for i in 0..<15{
            ys2.append(equation(w: Double(w.text!)!, t: Double(i), Eo: Double(Eo.text!)!))
            
        }
        let yse2 = ys2.enumerated().map { x, y in return ChartDataEntry(x: Double(x), y: y/2) }
        
        var ys3 = [Double]()
        for i in 0..<15{
            
            
        }
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
        line2.lineDashLengths = [5, 2.5]
        
        let value3 = ChartDataEntry(x: x, y: y)
        lineChartEntry.append(value3)
        let data = LineChartData(dataSets: [line1, line2])
        data.setValueTextColor(.white)
        
        GraphView.data = data
        GraphView.drawBordersEnabled = false
        GraphView.setScaleEnabled(true)
        GraphView.legend.form = .line
        GraphView.chartDescription?.text = "Megnative Waves"
        GraphView.animate(xAxisDuration: 3.00)
        GraphView.animate(yAxisDuration: 3.00)
        
    }
    
    @IBAction func ActionGraphs(_ sender: Any) {
        updateGraph(x: 0.0, y: 0.0)
    }
    @IBOutlet weak var ActionGraph: UIButton!
    
    func equation(w:Double, t:Double, Eo:Double)->Double{
        return Eo*(cos((w*t)) + sin((w*t)))
    }

}
*/
