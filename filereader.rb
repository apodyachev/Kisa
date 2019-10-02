class Filereader
  def initialize()
  end
  def read(filename)
    file = File.open(filename, "r")
    page = file.read# read file and return content 
    file.close
    return page
  rescue #if file does not exist, then send a 404 page
    file = File.open("error/404.html", "r")
    page = file.read
    file.close
    return page
  end
end
