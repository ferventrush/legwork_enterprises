class Items
  def self.getItems(item_hash)
    query_set = items_to_query(item_hash)
    @client = Mongo::Client.new(ENV["MONGOLAB_URI"])
    @items = @client[:items].find({:itemID => {"$in" => query_set.to_a}}).to_a
    return hashify(@items)
  end

  def self.items_to_query(item_hash)
    items = Set.new
    item_hash.each do |key, value|
      items << value[:typeID].to_i
      next if !value[:contents]
      value[:contents].each do |content_key, content_value|
        items << content_value[:typeID].to_i
      end
    end
    items
  end

  def self.hashify(items)
    hash = Hash.new
    items.each do |item|
      hash[item["itemID"]] = item["Name"]
    end
    hash
  end
end
