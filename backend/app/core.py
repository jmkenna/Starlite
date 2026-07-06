import astropy as ap
from astropy.coordinates import SkyCoord
import astropy.units as u
import numpy as np

# calculates both the Azimuth and the Altidtude of a star
# longitude should be signed
# day should be in days since Jan 1, 2000, 12:00 UTC
# time should be in decimal hours UTC
# Right Ascension should be in degrees
# Declination should be in degrees
# Output is azimuth, altitude in degrees
def calcAzmAlt(lon, lat, time, day, ra, dec):
    # calculate local sidereal time, then hour angle
    lst = (100.46 + 0.985647 * day + lon + 15 * time) % 360

    hourAngle = lst - ra

    if (hourAngle > 180):
        hourAngle -= 360
    hourAngle = np.radians(hourAngle)
    lat = np.radians(lat)
    dec = np.radians(dec)

    altitude = np.arcsin((np.sin(lat) * np.sin(dec)) + (np.cos(lat) * np.cos(dec) *np.cos(hourAngle)))
    azimuth = np.arctan2((-1 * np.cos(dec) * np.sin(hourAngle)), ((np.sin(dec) * np.cos(lat)) - (np.cos(dec) * np.sin(lat) * np.cos(hourAngle))))
    return (np.degrees(azimuth) % 360), np.degrees(altitude)

# Takes in altitude and azimuth in degrees
# typically these calculations would involve r, I chose 1 for r
# outputs (x,y,z) coordinates
def skyToCoords(azimuth, altitude):
    r = 1
    x = r * np.cos(np.radians(altitude)) * np.cos(np.radians(azimuth))
    y = r * np.cos(np.radians(altitude)) * np.sin(np.radians(azimuth))
    z = r * np.sin(np.radians(altitude))
    return (x,y,z)

# INPUTS: 3x3 Orientation Matrix, 3x1 Rotation Vector
# Outputs a rotation vector
def calcRotation(orientation, rotvec):
    v = np.array(rotvec, dtype=float)   # (x, y, z)
    R = np.array(orientation, dtype=float).reshape(3, 3)
    return R @ v

