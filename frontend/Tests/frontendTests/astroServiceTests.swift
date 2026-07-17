//import Testing
//@testable import frontend
//import Foundation
//
//@Suite struct AstronomyServiceTests {
//    
//    @Test func toradiansConvertsDegreesToRadians() {
//        #expect(abs(toradians(0.0) - 0.0) < 0.000001)
//        #expect(abs(toradians(90.0) - Double.pi / 2.0) < 0.000001)
//        #expect(abs(toradians(180.0) - Double.pi) < 0.000001)
//        #expect(abs(toradians(360.0) - 2.0 * Double.pi) < 0.000001)
//    }
//
//    @Test func skyToCoordsConvertsAzimuthAltitudeToUnitVector() {
//        let result = skyToCoords(azimuth: 0.0, altitude: 0.0)
//
//        #expect(abs(result.0 - 1.0) < 0.000001)
//        #expect(abs(result.1 - 0.0) < 0.000001)
//        #expect(abs(result.2 - 0.0) < 0.000001)
//    }
//
//    @Test func skyToCoordsHandlesStraightUpAltitude() {
//        let result = skyToCoords(azimuth: 0.0, altitude: 90.0)
//
//        #expect(abs(result.0 - 0.0) < 0.000001)
//        #expect(abs(result.1 - 0.0) < 0.000001)
//        #expect(abs(result.2 - 1.0) < 0.000001)
//    }
//
//    @Test func matrxMultiplicationMultipliesMatrixByColumnVector() {
//        let matrix = [
//            [1.0, 2.0, 3.0],
//            [4.0, 5.0, 6.0],
//            [7.0, 8.0, 9.0]
//        ]
//
//        let vector = [
//            [1.0],
//            [2.0],
//            [3.0]
//        ]
//
//        let result = matrxMultiplication(matrix, vector)
//
//        #expect(result[0][0] == 14.0)
//        #expect(result[1][0] == 32.0)
//        #expect(result[2][0] == 50.0)
//    }
//
//    @Test func calcRotationUsesOrientationMatrix() {
//        let identity = [
//            [1.0, 0.0, 0.0],
//            [0.0, 1.0, 0.0],
//            [0.0, 0.0, 1.0]
//        ]
//
//        let result = calcRotation(
//            orientation: identity,
//            rotvec: [3.0, 4.0, 5.0]
//        )
//
//        #expect(result.0 == 3.0)
//        #expect(result.1 == 4.0)
//        #expect(result.2 == 5.0)
//    }
//
//    @Test func calcAzmAltReturnsReasonableAngles() {
//        let result = calcAzmAlt(
//            lon: -71.0,
//            latog: 42.0,
//            time: 22.5,
//            day: 100.0,
//            ra: 120.0,
//            decog: 30.0
//        )
//
//        #expect(result.0 > -360.0)
//        #expect(result.0 < 360.0)
//        #expect(result.1 >= -90.0)
//        #expect(result.1 <= 90.0)
//    }
//}
