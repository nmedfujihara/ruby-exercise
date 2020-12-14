require 'socket'

socket = UNIXSocket.new "test_socket"
puts socket.gets  #=> Hello UNIXServer.

