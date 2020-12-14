require 'socket'

socket_name = "test_socket"
File.unlink socket_name if File.exist?(socket_name) && File.socket?(socket_name)

server = UNIXServer.new socket_name
loop {
  client = server.accept
  client.puts "Hello UNIXServer."
  client.close
}
