def booth_multiplication(multiplier, multiplicand):
    # Step 1: Initialize the product and accumulator
    product = 0
    accumulator = 0

    # Step 2: Determine the number of bits in the multiplier and multiplicand
    num_bits = max(len(bin(multiplier)), len(bin(multiplicand))) - 2

    # Step 3: Perform the multiplication
    for i in range(num_bits):
        # Check the least significant bit of the multiplier
        if multiplier & 1:
            if accumulator & 1:
                # Subtract the multiplicand from the accumulator
                accumulator -= multiplicand
        else:
            if accumulator & 1:
                # Add the multiplicand to the accumulator
                accumulator += multiplicand

        # Right shift the multiplier and accumulator
        multiplier >>= 1
        accumulator >>= 1

    # Step 4: Combine the product and accumulator to get the final result
    product = (accumulator << num_bits) | multiplier

    return product

# Example usage
multiplier = 0b00001010  # Binary representation of 0A
multiplicand = 0b00000010  # Binary representation of 10
result = booth_multiplication(multiplier, multiplicand)
print(f"The result of {multiplier} * {multiplicand} is {result}")