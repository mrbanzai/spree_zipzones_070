Spree::State.class_eval do
  has_many :zipcodes, :order => 'name ASC'
end
