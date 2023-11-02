# Automated-Reception-Desk
Our project aims to design an automated reception desk for hospitals. The system has an easy-to-use interface allowing patients to check in and make appointments with doctors based on their needs. It can be integrated with the hospital's software and provide real-time updates on doctor availability for a convenient and satsifying experience.

# Team Details:
1. 221CS251, Srivatsan Suresh, srivatsansuresh.221cs251@nitk.edu.in, 9449820314
2. 221CS258, Vaibhav Anurag, anuragvaibhav.221cs258@nitk.edu.in,  79799 15189
3. 221CS264, Himaneesh Yadala, himaneeshyadala.221cs264@nitk.edu.in, 97399 55000

# Abstract:
Background:
An automated system in hospitals for managing appointments can improve the efficiency and accuracy of the scheduling process.
It can also reduce the workload of receptionists, allowing them to focus on other tasks, such as managing patient information and assisting patients.
One of the key benefits of automating the appointment scheduling process is the ability to match patients with the most appropriate doctor based on their medical needs.
This ensures that patients receive the appropriate care from specialized practitioners, ultimately leading to better treatment outcomes.
Another benefit of an automated system is the ability to notify patients of their appointment details in a timely manner.
This contributes to the overall enhancement of the patient experience, as it fosters a sense of transparency and reliability in the healthcare system. 
This model can be made using just logic gates, Flip Flops and Counters. This simplistic design also makes the model economical.

Motivation: 
We wanted to combine two different domains Healthcare and Technology and decided to make a project, which can make the experience of patients and hospital staff better in many ways. 
With our project we aim to address global health challenges by providing innovative solutions to streamline the process.

# Working

# Logisim Circuit Diagram: 

# Verilog Code:
  # Main Code:
module reception_desk(query,A,B,clk,start,message);
	input [1:0] query; 
	input A,B,clk,start;
	output reg [1:0] message;
	reg a = 1'b0;
	reg b = 1'b0;
	integer c_a = 0;
	integer c_b = 0;
	always@(negedge start)
	begin
		if(query == 2'b00)				
			if(a == 0)				
			begin
				message = 2'b01;	
				a = 1'b1;			
			end
			else
				message = 2'b11;	
		if(query == 2'b01)				
            		if(a == 0)				
			begin
                		message = 2'b01;	
				a = 1'b1;			
			end
            		else if(b == 0)			
			begin
                		message = 2'b10;	
				b = 1'b1;			
			end
			else 
				message = 2'b11;
		if(query == 2'b10)				
            		if(a == 0)				
			begin
                		message = 2'b01;	
				a = 1'b1;			
			end
            		else if(b == 0)			
			begin
                		message = 2'b10;	
				b = 1'b1;			
			end
			else 
				message = 2'b11;
		if(query == 2'b11)				
            		if(b == 0)			
			begin
                		message = 2'b10;	
				b = 1'b1;			
			end
			else 
				message = 2'b11;
	end
	always@(posedge clk)
	begin
	if(a == 1)
            c_a = c_a + 1;
        if(b == 1)
            c_b = c_b + 1;
        if(c_a == 15)
            a = 0;
        if(c_b == 15)
            b = 0;
	end
endmodule

  # Testbench File:
module reception_desk(query,A,B,clk,start,message);
	input [1:0] query; 
	input A,B,clk,start;
	output reg [1:0] message;
	reg a = 1'b0;
	reg b = 1'b0;
	integer c_a = 0;
	integer c_b = 0;
	always@(negedge start)
	begin
		if(query == 2'b00)				
			if(a == 0)				
			begin
				message = 2'b01;	
				a = 1'b1;			
			end
			else
				message = 2'b11;	
		if(query == 2'b01)				
            		if(a == 0)				
			begin
                		message = 2'b01;	
				a = 1'b1;			
			end
            		else if(b == 0)			
			begin
                		message = 2'b10;	
				b = 1'b1;			
			end
			else 
				message = 2'b11;
		if(query == 2'b10)				
            		if(a == 0)				
			begin
                		message = 2'b01;	
				a = 1'b1;			
			end
            		else if(b == 0)			
			begin
                		message = 2'b10;	
				b = 1'b1;			
			end
			else 
				message = 2'b11;
		if(query == 2'b11)				
            		if(b == 0)			
			begin
                		message = 2'b10;	
				b = 1'b1;			
			end
			else 
				message = 2'b11;
	end
	always@(posedge clk)
	begin
	if(a == 1)
            c_a = c_a + 1;
        if(b == 1)
            c_b = c_b + 1;
        if(c_a == 15)
            a = 0;
        if(c_b == 15)
            b = 0;
	end
endmodule
