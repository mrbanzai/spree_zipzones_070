Spree::Address.class_eval do
  def zipcode_base
    return zipcode[0, 5] if country.try(:iso) == 'US'
    zipcode
  end
end