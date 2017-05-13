class Database
  def initialize
    @file = 'database.json'
    @data = JSON.parse(File.read(@file))
  end

  def [](key)
    @data[key]
  end

  def []=(key, value)
    @data[key] = value
  end

  def save
    File.open(@file, 'w+') do |f|
      f.write(@data.to_json)
    end
  end
end
