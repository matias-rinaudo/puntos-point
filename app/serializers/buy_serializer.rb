class BuySerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :product
  belongs_to :customer
end
