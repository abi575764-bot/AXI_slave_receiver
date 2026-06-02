/*
 * AXI4-Lite Slave Receiver Example for Tiny Tapeout
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

    // AXI-Lite signals mapped to pins
    wire        awvalid = ui_in[0];
    wire        wvalid  = ui_in[1];
    wire        bready  = ui_in[2];

    wire [4:0]  awaddr  = ui_in[7:3];

    wire [7:0]  wdata   = uio_in;

    reg         awready;
    reg         wready;
    reg         bvalid;

    reg [7:0]   slave_reg;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            awready   <= 1'b0;
            wready    <= 1'b0;
            bvalid    <= 1'b0;
            slave_reg <= 8'h00;
        end
        else begin

            awready <= 1'b0;
            wready  <= 1'b0;

            if (awvalid && wvalid && !bvalid) begin
                awready <= 1'b1;
                wready  <= 1'b1;

                case (awaddr)
                    5'h00: slave_reg <= wdata;
                    default: slave_reg <= slave_reg;
                endcase

                bvalid <= 1'b1;
            end

            if (bvalid && bready)
                bvalid <= 1'b0;
        end
    end

    // Outputs
    assign uo_out[7:0] = slave_reg;

    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    wire _unused = &{ena, 1'b0};

endmodule
