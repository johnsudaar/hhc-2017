class EntitySerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :city, :street, :post_code
end