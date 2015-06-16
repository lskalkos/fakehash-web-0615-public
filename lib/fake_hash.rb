class FakeHashWrapper < Hash

  # write code here

  def initialize
    @hash = Hash.new
  end

  def []=(key, value)
    new_key = key.is_a?(Symbol) ? key : key.to_sym
    @hash[new_key] = value
  end

  def [](key)
    new_key = key.is_a?(Symbol) ? key : key.to_sym
    @hash[new_key]
  end

  def keys
    @hash.keys.sort!{|x,y| y <=> x }
  end

  def first_letter(letter)
    @hash.each_with_object([]) do |(key, value), array|
      array << value if key[0] == letter
    end
  end

  def each
    @hash.each{|key, value| yield key, value}
  end

end