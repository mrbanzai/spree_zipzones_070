# This is mostly copied from the Spree Zone methods,
# with added support for zipcode zone members
Spree::Zone.class_eval do

def kind
  member = self.members.last
  case member && member.zoneable_type
  when "Spree::State"        then "state"
  when "Spree::Zone"         then "zone"
  when "Spree::Zipcode"      then "zipcode"
  else
    "country"
  end
end


# Check for whether an address.zipcode is available
def include?(address)
  return false unless address

  members.any? do |zone_member|
    case zone_member.zoneable_type
    when "Spree::Country"
      zone_member.zoneable_id == address.country_id
    when "Spree::State"
      zone_member.zoneable_id == address.state_id
    when "Spree::Zipcode"
      zone_member.zoneable.name == address.zipcode
    else
      false
    end
  end
end

# Indicates whether the specified zone falls entirely within the zone performing
# the check.
def contains?(target)
  return false if kind == 'state' && target.kind == 'country'
  return false if kind == 'zipcode' && ['country', 'state'].include?(target.kind)
  return false if zone_members.empty? || target.zone_members.empty?

  if kind == target.kind
    target.zoneables.each do |target_zoneable|
      return false unless zoneables.include?(target_zoneable)
    end
  else
    target.zoneables.each do |target_state|
      return false unless zoneables.include?(target_state.country)
    end
  end
  true
end

# Zipcode kind should be checked before state and country.
def self.match(address)
  return unless address
  zip_code = Spree::Zipcode.find_by_name(address.zipcode)
  [zip_code, address.state, address.country].each do |zoneable|
    next if zoneable.nil?
    if match = self.joins(:zone_members).merge(Spree::ZoneMember.for_zoneable(zoneable)).order('zone_members_count', 'created_at')
      return match.first
    end
  end
  return
end

end # Zone
