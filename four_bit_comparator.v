module four_bit_comparator(
    Data_in_A,  //input A
    Data_in_B,  //input B
    less,       //high when A is less than B
    equal,       //high when A is equal to B
     greater         //high when A is greater than B    
    );

    //what are the input ports.
    input [3:0] Data_in_A;
    input [3:0] Data_in_B;
    //What are the output ports.
    output less;
     output equal;
     output greater;
     //Internal variables
     reg less;
     reg equal;
     reg greater;

    //When the inputs and A or B are changed execute this block
    always @(Data_in_A or Data_in_B)
     begin
        if(Data_in_A > Data_in_B)   begin  //check if A is bigger than B.
            less = 0;
            equal = 0;
            greater = 1;    end
        else if(Data_in_A == Data_in_B) begin //Check if A is equal to B
            less = 0;
            equal = 1;
            greater = 0;    end
        else    begin //Otherwise - check for A less than B.
            less = 1;
            equal = 0;
            greater =0;
        end 
    end
endmodule
