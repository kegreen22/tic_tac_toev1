class AHash
  attr_reader :buckets

  def initialize   # create empty buckets
    @buckets = []
  end

  def assign_or_find_index(akey)   # takes the object id and ensures the index, via modulo, falls between 0 and 100
    generate_function(akey) % 100
  end

  def generate_function(akey)   # function to create unique number for each key
    akey = akey.to_sym
    akey.object_id    # use object id (is unique) to generate unique number
  end

  def insert(akey, val)   #
    index = assign_or_find_index(akey)
    buckets[index] ||= []
    buckets[index] << [akey, val]
  end

  def find(akey)
    index = assign_or_find_index(akey)
    buckets[index].each do |k_v_pair|
      if k_v_pair[0] == akey
        return k_v_pair[1]
      end
    end
  end

end

# test
cities = AHash.new
cities.insert('New York City', 'NYC')
cities.insert('Chicago', 'CHI')
puts cities.find('Chicago')