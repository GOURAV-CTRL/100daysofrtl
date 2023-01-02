module Digital_Clock(
    Clk_1sec, reset, seconds,
    minutes,
    hours);

input Clk_1sec;  
    input reset;

output [5:0] seconds;
    output [5:0] minutes;
    output [4:0] hours;
//Internal variables.
    reg [5:0] seconds;
    reg [5:0] minutes;
    reg [4:0] hours; 

   
    always @(posedge(Clk_1sec) or posedge(reset))
    begin
        if(reset == 1'b1) begin  
            //reset the time.
            seconds = 0;
            minutes = 0;
            hours = 0;  end
        else if(Clk_1sec == 1'b1) begin  //at the beginning of each second
            seconds = seconds + 1; //increment sec
            if(seconds == 60) begin //check for max value of sec
                seconds = 0;  //reset seconds
                minutes = minutes + 1; //increment minutes
                if(minutes == 60) begin //check for max value of min
                    minutes = 0;  //reset minutes
                    hours = hours + 1;  //increment hours
                   if(hours ==  24) begin  //check for max value of hours
                        hours = 0; //reset hours
                    end 
                end
            end     
        end
    end     

endmodule