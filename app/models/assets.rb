class Assets
  ASSET_ROUTE = '/char/AssetList.xml.aspx'

  def self.getAssets(char_id, key_id, api_key)
    tries = 0
    opts = {
      "characterID" => char_id,
      "keyID"       => key_id,
      "vcode"       => api_key
    }

    begin
      response    = HTTParty.get("#{ApplicationController::BASE_URL}#{ASSET_ROUTE}", :query => opts).body.force_encoding("UTF-8")
      @assets_xml = Ox.load(response).locate("eveapi/result/rowset/row")
    rescue
      tries += 1

      unless tries == 3
        sleep 0.1
        retry
      end
    end
  end

  def self.trimAssets(assets)
    @asset_hash = {}
    assets.each do |asset|
      @asset_hash[asset.itemID] = hashify(asset.attributes)
      next if asset.nodes.first.nil?
      contents = asset.nodes.first.nodes
      @asset_hash[asset.itemID][:contents] = {}
      contents.each do |content|
        @asset_hash[asset.itemID][:contents][content.itemID] = hashify(content.attributes)
      end
    end
    @asset_hash
  end

  def self.hashify(hashable)
    hashable.slice(:locationID, :typeID, :quantity)
  end
end