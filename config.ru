# config.ru
require "rubygems"
require "bundler"
Bundler.require(:default)

map "/" do
  use Rack::Static, urls: ["/assets"], root: Dir.pwd

  run lambda { |env|
    headers = {
      "Content-Type"  => "text/html",
      "Cache-Control" => "public, max-age=86400"
    }
    body = File.open("#{Dir.pwd}/index.html", File::RDONLY).read

    [200, headers, [body]]
  }
end