require './url_models'

raw_text = IO.read("qdaily.urls")
lines = raw_text.gsub(/\r\n?/, "\n").chomp.lines

total = lines.count
current = 0

lines.each do |line|
  match = line.chomp.match(/(.+) (http:.+)/)
  next unless match
  title = match[1]

  url = URI.parse match[2]
  scheme = url.scheme
  host = url.host
  url_path = url.path
  url_query = url.query
  url_fragment = url.fragment

  record = {
    title: title,
    scheme: scheme,
    host: host,
    url_path: url_path,
    url_query: url_query,
    url_fragment: url_fragment
  }

  Qdaily.create(record)

  current = current + 1

  if current % 1000 == 0
    p "current status: #{current} / #{total}"
  end
end
