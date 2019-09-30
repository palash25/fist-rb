require 'socket'

module Fist
  class FistClient
    attr_writer :conn

    def initialize(host, port)
      @host = host
      @port = port
    end

    def connect
      @conn = TCPSocket.new(@host, @port)
    end

    def version
      @conn.write("VERSION\r\n")
    end

    def index(doc, text)
      @conn.write("INDEX " << doc << " " << text << "\r\n")
    end

    def search text
      @conn.write("SEARCH " << text << "\r\n")
    end

    def delete text
      @conn.write("DELETE " << text << "\r\n")
    end

    def close
      @conn.write("EXIT\r\n")
    end
  end
end
