class Request_parser
  def initialize()
  end
  def getfilename(request)
    parts = request.split# GET /Filename HTTP/1.1
    return parts[1]
  end
end