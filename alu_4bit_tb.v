`timescale 1ns/1ps

module alu_4bit_tb;
  
  reg[3:0] a;
  reg[3:0] b;
  reg[3:0] op;
  wire[7:0] result;
  wire carry;
  wire borrow;
  wire[3:0] remainder;
  
  alu_4bit dut(
    .a(a),
    .b(b),
    .op(op),
    .result(result),
    .carry(carry),
    .borrow(borrow),
    .remainder(remainder)
  );
  
  initial begin
    // Test 1: Bitwise OR
    a = 4'b0101;
    b = 4'b0111;
    op = 4'b0011;
    
    #10;
    
    // Test 2: Addition with carry 
	a = 4'b1111; b = 4'b0001; op = 4'b0000;
	#10;

	// Test 3: Subtraction 
    a = 4'b1001; b = 4'b0100; op = 4'b0001;
    #10;

	// Test 4: Subtraction with borrow 
	a = 4'b0011; b = 4'b0101; op = 4'b0001;
	#10;

	// Test 5: Bitwise AND
	a = 4'b1010; b = 	4'b1100; op = 4'b0010;
	#10;

	// Test 6: Bitwise OR
	a = 4'b0101; b = 4'b0111; op = 4'b0011;
	#10;

	// Test 7: Bitwise XOR
	a = 4'b1010; b = 4'b1100; op = 4'b0100;
	#10;

	// Test 8: Bitwise NOT A
	a = 4'b1010; b = 	4'b0000; op = 4'b0101;
	#10;

	// Test 9: Left shift 
	a = 4'b0011; b = 4'b0010; op = 4'b0110;
	#10;

	// Test 10: Right shift 
	a = 4'b1100; 
    b = 4'b0010; 
    op = 4'b0111;
	#10;

	// Test 11: Multiplication 
	a = 4'b1001; 
    b = 4'b0111; 
    op = 4'b1000;
	#10;

	// Test 12: Division 
	a = 4'b1101; 
    b = 4'b0101; 
    op = 4'b1001;
	#10;

// Test 13: Division by zero
	a = 4'b1001; 
    b = 4'b0000; 
    op = 4'b1001;
    #10;
    
    $finish;
    
  end
  
  initial begin
    $monitor("TIme=%0t A=%d B=%d op=%d, Result=%d Carry=%d, Borrow=%d Remainder=%d",$time,a,b,op,result,carry,borrow,remainder);
    end
endmodule
    