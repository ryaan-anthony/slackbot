class RandomImage
  def self.success!
    random 'success'
  end

  def self.fail!
    random 'fail'
  end

  def self.random(type)
    Filesystem.new('images.json')[type].sample
  end
end
