# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

  validates :title, presence: true


  belongs_to :author,
  class_name: :User,
  foreign_key: :user_id

  has_many :post_subs,
  class_name: :PostSub,
  foreign_key: :post_id
  
  has_many :subs,
  through: :post_subs,
  source: :sub
end
