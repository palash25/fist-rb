require 'socket'

class FistClient
    def initialize(host, port)
        @host = host
        @port = port
    end

    def connect
        @conn = TCPSocket.new @host, @port
    end

    def version
        @conn.write("VERSION\r\n")
    end

    def close
        @conn.close
    end
end


#fc = FistClient.new("localhost", "5575")
#fc.connect
#fc.version
#fc.close
