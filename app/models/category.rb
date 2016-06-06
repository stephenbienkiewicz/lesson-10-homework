class Category < ActiveRecord::Base
  has_many :restaurant_categories
  has_many :restaurants, through: :restaurant_categories
end
