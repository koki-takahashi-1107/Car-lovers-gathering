class GoodsController < ApplicationController
  def search
    if params[:keyword].blank?
      # keyword がなければそのまま表示,検索はしない
    elsif params[:keyword].present? && params[:keyword].length < 2
      # keywordがあって2文字以下であればエラ-
      redirect_to rakuten_path, notice: '2文字以上入力してください'
    else
      # 3: 正常検索
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end
end
