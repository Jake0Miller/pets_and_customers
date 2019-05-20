class Pet
  attr_reader :name, :type

  def initialize(attr)
    @name = attr[:name]
    @type = attr[:type]
    @fed = false
  end

  def feed
    @fed = true
  end

  def fed?
    @fed
  end
end
