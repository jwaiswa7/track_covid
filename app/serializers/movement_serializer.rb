class MovementSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :address

  def created_at
    object.created_at.strftime('%d/%m/%y , %I:%M %p')
  end
end
