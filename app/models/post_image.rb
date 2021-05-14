class PostImage < ApplicationRecord

  belongs_to :user
  attachment :image

   has_many :post_comments, dependent: :destroy
   has_many :favorites, dependent: :destroy

   has_many :tag_maps, dependent: :destroy
   has_many :tags, through: :tag_maps

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  
end
