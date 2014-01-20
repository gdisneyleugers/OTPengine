require "xmlrpc/server"
require "webrick"
s = XMLRPC::Server.new(8111)
server = XMLRPC::CGIServer.new(8111)

file = File.open('OTP')  do |file|
  server.mount "/", WEBrick::HTTPServlet::FileHandler, './'
  trap('INT') { server.stop }
  server.start
end
s.serve && server.serve