class RandomImage
  def self.success!
    random 'success'
  end

  def self.fail!
    random 'fail'
  end

  def self.random(type)
    Database.new('images.json')[type].sample
  end
end
