
module conv_1d #(
    parameter int D = 640,
    parameter int K = 3
) (
    input  byte data   [D],
    input  byte kernel [K],
    output byte result [D]
);

    always_comb begin

        int data_i;

        for (int i = 0; i < D; i +=1) begin
            result[i] = 0;
        end

        for (int i = 0; i < D; i +=1) begin
            for (int j = 0; j < K; j += 1) begin

                data_i = i - K / 2 + j;

                if (data_i < 0 || data_i >= D)
                    result[i] += data[-data_i] * kernel[j];
                else
                    result[i] += data[data_i] * kernel[j];

            end
        end
    end

endmodule
