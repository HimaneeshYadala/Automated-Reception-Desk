# Automated-Reception-Desk
Our project aims to design an automated reception desk for hospitals. The system has an easy-to-use interface allowing patients to check in and make appointments with doctors based on their needs. It can be integrated with the hospital's software and provide real-time updates on doctor availability for a convenient and satsifying experience.

## Team Details:
<details>
<summary>Details</summary>
<br>
Semester: 3rd sem B.tech CSE<br> 
Section: S2<br>

1. 221CS251, Srivatsan Suresh, srivatsansuresh.221cs251@nitk.edu.in, 9449820314
2. 221CS258, Vaibhav Anurag, anuragvaibhav.221cs258@nitk.edu.in,  79799 15189
3. 221CS264, Himaneesh Yadala, himaneeshyadala.221cs264@nitk.edu.in, 97399 55000

</details>

## Abstract:
<details>
<summary>Details</summary>
<br>
	
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

</details>

## Working
<details>
<summary>Details</summary>
<br>

For Query 0, if the input is '0,' the system promptly checks if Doctor A is available. If Doctor A is free, the system assigns the patient to Doctor A and provides a two-bit response to indicate Doctor A's readiness for consultation. However, if Doctor A is currently occupied, the system politely informs the patient about a short wait.

For Query 3, when the input is '3,' the system checks the availability of Doctor B. If Doctor B is ready, the system assigns the patient to Doctor B and provides a two-bit output to confirm Doctor B's readiness for consultation. If Doctor B is not available, the patient is informed about a brief waiting period.

Queries 1 and 2 are slightly different; when the input is '1' or '2,' the system assesses the availability of both Doctor A and Doctor B. If both doctors are free, the system efficiently assigns the patient to the first available doctor and provides a two-bit output specifying which doctor is ready for consultation. If both doctors are currently occupied, the system courteously informs the patient about a short waiting time.

![image](https://github.com/HimaneeshYadala/Automated-Reception-Desk/assets/113039145/759056ef-87d4-48ab-98ab-922c538c184d)
![image](https://github.com/HimaneeshYadala/Automated-Reception-Desk/assets/113039145/a49ac621-ee7a-446e-86a8-4c929dbc1b0a)



</details>

## Logisim Circuit Diagram: 

<details>
<summary>Details</summary>
<br>

Main Logisim Circuit:
![image](https://github.com/HimaneeshYadala/Automated-Reception-Desk/assets/113039145/232ca715-5439-4aaf-b3ff-a66cf31d99cf)

Logisim Component Circuits: 
![image](https://github.com/HimaneeshYadala/Automated-Reception-Desk/assets/113039145/c7986a58-a65e-46d4-b887-c49da6869861)
![image](https://github.com/HimaneeshYadala/Automated-Reception-Desk/assets/113039145/7162c5e7-acd4-48e3-b991-4401d2b17ad8)
![image](https://github.com/HimaneeshYadala/Automated-Reception-Desk/assets/113039145/e954e7b9-31f9-49b1-a37e-4774ab341259)
![image](https://github.com/HimaneeshYadala/Automated-Reception-Desk/assets/113039145/140c98df-9314-4c60-983f-9321eef17ecb)
	

</details>

## Verilog Code:
<details>
<summary>Details</summary>
<br>
Main Code:
	
```
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
```
Testbench Code:

 ```
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

```
</details>
