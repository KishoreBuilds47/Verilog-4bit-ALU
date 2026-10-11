`timescale 1ns/1ps

module alu_4bit(
  input wire[3:0] a,
  input wire[3:0] b,
  input wire[3:0] op,
  output reg[7:0] result,
  output reg carry,
  output reg borrow,
  output reg[3:0] remainder
);
  
  parameter add = 4'b0000;
  parameter subtract = 4'b0001;
  parameter bitwiseand = 4'b0010;
  parameter bitwiseor = 4'b0011;
  parameter bitwisexor = 4'b0100;
  parameter bitwisenot = 4'b0101;
  parameter leftshift = 4'b0110;
  parameter rightshift = 4'b0111;
  parameter multiply = 4'b1000;
  parameter divide = 4'b1001;
  
  reg[4:0] temp;
  always @(*) begin
    
    result = 8'b00000000;
    carry = 1'b0;
    borrow = 1'b0;
    remainder =4'b0000;
    
    
    case(op)
      add: begin
        temp = {1'b0,a} + {1'b0,b};
        result = temp[3:0];
        carry = temp[4];
      end
      
      
      subtract: begin
        temp = {1'b0,a} - {1'b0,b};
        result = temp[3:0];
        borrow = temp[4];
      end
      
      
      bitwiseand: begin
        result = a &b;
      end
      
      
      bitwiseor: begin
        result = a|b;
      end
      
      
      bitwisexor: begin
        result = a ^ b;
      end
      
      
      bitwisenot: result = ~a;
      
      
      leftshift: 
        result = a <<b;
      
      
      rightshift:
        result = a>>b;
      
      
      multiply:
        result = a*b;
      
      
      divide: begin
        if(b!=0) begin
          result = a/b;
          remainder = a%b;
        end
        else begin
          result = 0;
        end
      end
      
      
      default:
        result = 8'b0;
    endcase
  end
endmodule
      