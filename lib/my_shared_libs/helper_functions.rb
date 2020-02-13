module HelperFunctions
    
    def generate_random_string
      source=("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a + ["_","-","."]
      key=""
      8.times{ key += source[rand(source.size)].to_s }
      key
    end        

end    