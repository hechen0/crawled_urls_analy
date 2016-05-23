require './url_models'

raise ArgumentError if ARGV.count != 2

file = ARGV[0]
raise "NO such file #{file}" unless File.exist?(file)

table = ARGV[1].capitalize
table = Object.const_get(table) # raise name error if table not exist

raw_text = IO.read(file)
lines = raw_text.gsub(/\r\n?/, "\n").chomp.lines

total = lines.count
current = 0

lines.each do |line|
  current = current + 1
  match = line.chomp.match(/(.+) (https?:.+)/)
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


  if current % 1000 == 0
    p "current status: #{current} / #{total}"
  end
end
