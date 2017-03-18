class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :rhesus

  def rhesus
    object.blood_type.rhesus
  end
end
