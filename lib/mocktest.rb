class Mocky
  
  def calls_the_other
    Other.new.message
  end
  
end


class Other
  
  def message
    return "this is the message, thank you!"
  end
  
end