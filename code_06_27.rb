require 'socket'

socket = TCPSocket.new "localhost", 10080
while line = socket.gets
  puts line   #=> HELLO TCPServer
end
