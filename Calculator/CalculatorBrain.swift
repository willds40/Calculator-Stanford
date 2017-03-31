import Foundation

var binaryOperations:[String] = [
    "x", "/", "+", "-",
]
class CalculatorBrain{
    
    private var internalProgram = [AnyObject]()
    private  var accumalator = 0.0
    private var description = " "
    var isPartailResult = false
    var variableKey = ""
    var variableValue = 0.0
    
    
    func setOperand(operand:Double){
        accumalator = operand
        internalProgram.append(operand as AnyObject)
    }
   
    var variableValuesDictionary:Dictionary<String, Double> = [:]
    
    func setOperand(variableName: String){
        variableKey = variableName
        internalProgram.append(variableName as AnyObject)
        if variableValuesDictionary[variableName] != nil{
        accumalator = variableValuesDictionary[variableKey]!
        }
    }
    
    
    private var  operations:Dictionary<String, Operation> = [
        "pie" :Operation.Constant(M_PI),
        "sin": Operation.UniaryOperations(sqrt),
        "e" :Operation.Constant(M_E),
        "tan":Operation.UniaryOperations(tan),
        "log": Operation.UniaryOperations(log),
        "logten" :Operation.UniaryOperations(log10),
        "logtwo" :Operation.UniaryOperations(log2),
        "+" :Operation.BinaryOperations({$0 + $1}),
        "-": Operation.BinaryOperations({$0 - $1}),
        "/": Operation.BinaryOperations({$0 / $1}),
        "x" : Operation.BinaryOperations({$0 * $1}),
        "cos" : Operation.UniaryOperations(cos),
        "√":Operation.UniaryOperations(sqrt),
        "=":Operation.Equals,
        ]
    
    private enum Operation {
        case Constant(Double)
        case UniaryOperations((Double) ->Double)
        case BinaryOperations((Double, Double)->Double)
        case Equals
    }
    
    func printDescription(oper1:String, symbol:String, oper2:String, result:String )->String{
        
        if !isPartailResult{
            description = oper1 + " " + symbol + " " + oper2  + " =" + " " + result
            if description.contains("...") {
                description = description.replacingOccurrences(of: " ...", with: "")
            }
        }else{
            description = oper1 + " " +  symbol + oper2 + "..."
        }
        return description
    }
    
    func preformOperation(mathematicalSymbol:String){
        internalProgram.append(mathematicalSymbol as AnyObject)
        if let operation = operations[mathematicalSymbol]{
            switch operation {
            case .Constant(let value):accumalator = value;
                
            case .BinaryOperations(let function): pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumalator);
                
            case.UniaryOperations(let function):accumalator = function(accumalator);
            case.Equals:
                if pending != nil{
                    accumalator = pending!.binaryFunction(pending!.firstOperand, accumalator)
                }
            }
            
        }
    }
    private var pending: PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) ->Double
        var firstOperand: Double
    }
    typealias PropertyList = AnyObject
    
    var program: PropertyList{
        get{
            return internalProgram as CalculatorBrain.PropertyList
        }
        set {
            clear()
            if let arrayOfOps = newValue as? [AnyObject]{
                for op in arrayOfOps{
                    if let operand = op as? Double{
                        setOperand(operand: operand)
                    } else if let operation = op as? String{
                        preformOperation(mathematicalSymbol: operation)
                    }else if let variable = op as? Double {
                    setOperand(operand: variable)
                    }
                }
            }
        }
    }
    
    
     func clear(){
        accumalator = 0.0
        pending = nil
        internalProgram.removeAll()
    }
    
    var result:Double{
        get{
            return accumalator
        }
    }
}
