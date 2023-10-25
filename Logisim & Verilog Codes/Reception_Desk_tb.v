`timescale 1ns/10ps
module testbench;
    reg start,clk;
    reg [1:0] query;
    wire [1:0] message;
    reception_desk doctor(query,A,B,clk,start,message);             //Create an object of allot_doctor
    initial 
    begin
		$display("300 time units is equal to 15 seconds.\nOutput '1' indicates Doctor A has been alloted.\nOutput '2' indicates Doctor B has been alloted.\nOutput '3' indicates the patient to wait until their doctor is available.");        
    	clk = 1'b0;
        repeat (100);
        #10 clk = ~clk;                                     //Create clock 
    end 
    initial
    begin
        $dumpfile("reception_desk.vcd");                            
        $dumpvars(0,doctor);
        #10                           
		start = 1'b1;                                          
        query = 2'b00;
        start = 1'b0;                                          
        $display("| Incoming Query | Output To Query | Time Of Query |");
		$display("----------------------------------------------------");
        $monitor("|       %d        |        %d        |      %3d      |", query, message, $time);    

        #90
        start = 1'b1;                                          
        query = 2'b11;
        start = 1'b0;                                          
        $monitor("|       %d        |        %d        |      %3d      |", query, message, $time);    

        #100
        start = 1'b1;                                          
        query = 2'b01;
        start = 1'b0;                                           
        $monitor("|       %d        |        %d        |      %3d      |", query, message, $time);    
		
		#100
        start = 1'b1;                                          
        query = 2'b10;
        start = 1'b0;                                           
        $monitor("|       %d        |        %d        |      %3d      |", query, message, $time);    
		
		#100
        start = 1'b1;                                          
        query = 2'b01;
        start = 1'b0;                                           
        $monitor("|       %d        |        %d        |      %3d      |", query, message, $time);    

        #20
        start = 1'b1;                                          
        query = 2'b00;
        start = 1'b0;                                          
        $monitor("|       %d        |        %d        |      %3d      |", query, message, $time);    
        
        #20
        start = 1'b1;                                          
        query = 2'b11;
        start = 1'b0;                                          
        $monitor("|       %d        |        %d        |      %3d      |", query, message, $time);
        
        #400
        start = 1'b1;                                          
        query = 2'b11;
        start = 1'b0;                                          
        $monitor("|       %d        |        %d        |      %3d      |", query, message, $time);    
  
    end
endmodule 


