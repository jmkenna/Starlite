import Foundation

//importing backend functions to frontend
func calcAzmAlt(lon: Double, latog: Double, time: Double, day: Double, ra: Double, decog: Double) -> (Double,Double)
{
    //calculate local sidereal time, then hour angle
    let rawlst = (100.46 + 0.985647 * day + lon + 15.0 * time)
    let lst = rawlst.truncatingRemainder(dividingBy: 360.0)

    var hourAngle = lst - ra

    if (hourAngle > 180)
    {
        hourAngle -= 360
    }
    hourAngle = hourAngle * .pi/180
    let lat = latog * .pi/180
    let dec = decog * .pi/180

    let altitude = asin((sin(lat) * sin(dec)) + (cos(lat) * cos(dec) * cos(hourAngle)))
    let azimuth = atan2((-1 * cos(dec) * sin(hourAngle)), ((sin(dec) * cos(lat)) - (cos(dec) * sin(lat) * cos(hourAngle))))
    return (((azimuth * (180/(.pi))).truncatingRemainder(dividingBy: 360.0)), (altitude * (180/(.pi))).truncatingRemainder(dividingBy: 360.0))
}

func skyToCoords(azimuth: Double, altitude: Double) -> (Double, Double, Double)
{
    let r: Double = 1;
    let x = r * cos(toradians(altitude)) * cos(toradians(azimuth))
    let y = r * cos(toradians(altitude)) * sin(toradians(azimuth))
    let z = r * sin(toradians(altitude))
    return (x,y,z)
}

//degrees to radian
func toradians(_ deg: Double) -> Double
{
    return deg * ((.pi)/180.0)
}

func calcRotation(orientation: [[Double]],rotvec: [Double]) -> (Double, Double, Double)
{
    var tempvec: [[Double]] = [[rotvec[0]],[rotvec[1]],[rotvec[2]]]
    tempvec = matrxMultiplication(orientation, tempvec)
    let result: (Double,Double,Double) = (tempvec[0][0], tempvec[1][0], tempvec[2][0])
    return result
}

func matrxMultiplication(_ orientation: [[Double]],_ rotvec: [[Double]]) -> [[Double]]
{
    let orrows = orientation.count
    // let rotrows = rotvec.count
    guard let orcols = orientation.first?.count,
        let rotcols = rotvec.first?.count else 
        {
            return [[]]
        }
    var result = Array(
        repeating: Array(repeating: 0.0, count: rotcols),
        count: orrows
        )
    
    for i in 0..<orrows
    {
        for j in 0..<rotcols
        {
            for k in 0..<orcols
            {
                result[i][j] += orientation[i][k] * rotvec[k][j]
            }
        }
    }


    return result
}