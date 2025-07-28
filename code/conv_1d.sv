
module conv_1d #(
    parameter int D = 640,
    parameter int K = 3
) (
    input  byte data   [D + 2 * K],
    input  byte kernel [K],
    output byte result [D]
);

    initial begin
        for (int i = 0; i < D + 2 * K; i +=1) begin
            result[i] = 0;
        end
    end

    always_comb begin

        for (int i = K; i < D; i +=1) begin
            for (int j = 0; j < K; j += 1) begin
                result[i] += data[i - K + j] * kernel[j];
            end
        end
    end

endmodule
