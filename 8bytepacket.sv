class EthPacket;

    // Dynamic payload array
    rand byte payload[];

    // Length variable
    rand int len;

    // Length constraint
    constraint len_range {
        len inside {[4:8]};
    }

    // Payload size must match length
    constraint payload_size {
        payload.size() == len;
    }

    // Function to print packet
    function void display();

        $display("Packet Length = %0d", len);

        foreach(payload[i])
            $display("payload[%0d] = %0d", i, payload[i]);

    endfunction

endclass
