class AssetsController < ApplicationController

  def fetch
    if params[:char_id].blank? || params[:api_key].blank? || params[:key_id].blank?
      render :status => 500, :text => "Missing Params"
    else
        @assets = (Assets::getAssets(params[:char_id], params[:key_id], params[:api_key]))
        render json: Assets::trim_assets(@assets)
    end
  end
end
