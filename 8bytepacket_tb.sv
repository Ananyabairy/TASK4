module tb_packet;

EthPacket pkt;

covergroup cg;
    cp_len : coverpoint pkt.len {
        bins len4 = {4};
        bins len5 = {5};
        bins len6 = {6};
        bins len7 = {7};
        bins len8 = {8};
    }
endgroup

cg cov;

initial begin

    pkt = new();
    cov = new();

    repeat(5) begin

        if(!pkt.randomize())
            $display("Randomization Failed");

        $display("Packet Length = %0d", pkt.len);

        foreach(pkt.payload[i])
            $display("payload[%0d] = %0d", i, pkt.payload[i]);

        cov.sample();

        $display("-----------------------");

        #10;

    end

    $display("Coverage = %0.2f %%", cov.get_coverage());

    $finish;

end

endmodule
