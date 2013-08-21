Spree::ZoneMember.class_eval do
  scope :for_zoneable, ->(zoneable) do
    where(:zoneable_id => zoneable.id, :zoneable_type => zoneable.class.name )
  end
end