require 'socket'
require 'erb'
require 'filereader.rb' 
require 'request_parser.rb'


class Kisa
  def initialize( port=80)
    @port = port #default port for HTTP is 80
  end
  def run
    server = TCPServer.open(@port) #set up 
    fr = Filereader.new()
    rp = Request_parser.new()
    loop{
    client = server.accept #wait for a client to connect
    request = client.gets #read client request 
    filename = rp.getfilename(request)
    if filename.eql?("/")#if client is getting the home page, return index
      file = fr.read("HTdocs/index.html")
    else# else, get the file that the client requested
      file = fr.read("HTdocs" + filename)
    end
    client.puts ERB.new(file).result(binding) #bind values to template if exists, then send the file content
    client.close #close connection and go back to the begining of the loop and wait for another client
    }
  end
end
