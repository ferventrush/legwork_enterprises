class AssetsController < ApplicationController

  def fetch
    if params[:char_id].blank? || params[:api_key].blank? || params[:key_id].blank?
      render :status => 500, :text => "Missing Params"
    else
        @assets = (Assets::getAssets(params[:char_id], params[:key_id], params[:api_key]))
        @assets = Assets::trimAssets(@assets)
        @items = Items::getItems(@assets)
        @merged_assets = @assets
        @merged_assets.each do |key, value|
          value[:name] = @items[value[:typeID].to_i].nil? ? "Unidentified Item" : @items[value[:typeID].to_i]
          next if !value[:contents]
          value[:contents].each do |content_key, content_value|
            content_value[:name] = @items[content_value[:typeID].to_i].nil? ? "Unidentified Item" : @items[content_value[:typeID].to_i]
          end
        end

        render json: @merged_assets
    end
  end
end
