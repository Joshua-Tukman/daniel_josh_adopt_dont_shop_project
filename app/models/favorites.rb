class Favorites
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def total_count
    @contents.count
  end

  def add_pet(pet_id)
      @contents[pet_id.to_s] = 1
  end

  def pet_collection
    @contents.keys
  end

end
