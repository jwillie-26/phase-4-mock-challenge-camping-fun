class CamperDetailSerializer < ActiveModel::Serializer
    attributes :id, :name, :age
    has_many :activities
  
    def activities
      object.activities.as_json(only: [:id, :name, :difficulty])
    end
  end