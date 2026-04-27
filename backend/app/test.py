import numpy as np
import core

# This is straight AI generated btw
# -----------------------------
# GOLDEN TEST INPUTS
# -----------------------------
lon = -77
lat = 39
time = 4.0
day = 9500

# Polaris (approx)
ra = 37.5
dec = 89

# -----------------------------
# STEP 1: SKY MODEL
# -----------------------------
az, alt = core.calcAzmAlt(lon, lat, time, day, ra, dec)

print("AZ:", az)
print("ALT:", alt)

# Expected sanity check
# ALT should be ~lat (~39°)

# -----------------------------
# STEP 2: SKY → VECTOR
# -----------------------------
coords = core.skyToCoords(az, alt)
print("SKY VECTOR:", coords)

# -----------------------------
# STEP 3: DEVICE ROTATION (FLAT PHONE)
# -----------------------------
R_identity = np.eye(3)

vec_device = core.calcRotation(R_identity, coords)
print("DEVICE VECTOR:", vec_device)

# -----------------------------
# GOLDEN ASSERTIONS
# -----------------------------

# 1. Altitude check
assert abs(alt - lat) < 2, "Altitude is wrong (sky model broken)"

# 2. Identity rotation check
assert np.allclose(coords, vec_device), "Rotation matrix broken"

# 3. Unit vector check
norm = np.linalg.norm(vec_device)
assert abs(norm - 1) < 0.01, "Vector not on unit sphere"

print("✅ GOLDEN TEST PASSED")