class Recipe
  attr_reader :name, :description, :prep_time, :done

  def initialize(name, description, prep_time = nil, done = nil)
    @name = name
    @description = description
    @prep_time = prep_time
    @done = done == "true" ? true : false
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = !@done
  end

end
