require 'socket'

server = TCPServer.new 10080
loop {
  client = server.accept
  client.puts "HELLO TCPServer"
  client.close
}
