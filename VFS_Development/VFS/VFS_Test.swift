import VFS
import Cocoa

let rootPath = NSSearchPathForDirectoriesInDomains(
    .documentDirectory,
    .userDomainMask,
    true)[0]

var plistPathInDocument:String{
    get{
        return rootPath + "/TEST"
    }
}

let factory = LocalFileFactory()
print(plistPathInDocument)

print("")
print("nil")
let s3 = plistPathInDocument + "/ERTYUI"
let url3 = URL(fileURLWithPath: s3)
do{
    let data3 = try factory.getFile(url: url3)
    print("data3 = ",data3)
    try data3.create()
}catch let error as NSError{
    print(error.debugDescription)
}
print("url3 = ",url3.absoluteString)
print("url3 name = ",(url3.lastPathComponent))
