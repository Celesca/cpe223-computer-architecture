M = input("Enter multiplicand: ") # ตัวตั้ง
Q = int(input("Multiplier: ")) # ตัวคูณ

# Q[-1] and QMinus1

Q = bin(Q)
print(Q)
print(type(Q))

# A - M = A + (-M) Which is make -M to 2's complement

# Arithmetic Shift Right

# ตัวหน้าเป็นอะไร ตัวที่ใส่เข้ามาด้านหน้าจะเป็นตัวเดิม
# bit ของ Q (ตัวคูณ)