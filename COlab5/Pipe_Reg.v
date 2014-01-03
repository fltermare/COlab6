//Subject:     CO project 4 - Pipe Register
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Pipe_Reg(
                    clk_i,
                    rst_n,
                    flush,
                    write,
                    data_i,
                    data_o
                    );
                    
parameter size = 0;

input                  clk_i;
input                  rst_n;
input                  flush;
input                  write;
input      [size-1: 0] data_i;
output reg [size-1: 0] data_o;

always @(negedge rst_n or posedge clk_i) begin
    case(rst_n)
        1'b0: data_o <= 0;
        1'b1: begin
            case(flush)
                1'b1: data_o <= 0;
                1'b0: begin
                    case(write)
                        1'b1: data_o <= data_i;
                        1'b0: data_o <= data_o;
                    endcase
                end
            endcase
        end
    endcase
end

endmodule
