require "ap"

class Automobile
  attr_reader :features
  
  def initialize
    @features = Hash.new(0)
    yield self if block_given?
  end
  
  def self.available_feature(*feature_names)
    feature_names.each do |feature_name|
      method_name = "add_#{feature_name}"
      define_method(method_name) do |options = { qty: 1 }|
        add_feature(feature_name, options)
      end      
    end
  end
  
private  
  
  def add_feature(feature_name, options = {})
    qty = options[:qty] || 1
    @features[feature_name] += qty
  end
end

class Batmobile < Automobile  
  available_feature :batphone, :bat_beam, :bat_ray, :mobile_bat_computer
end

custom_batmobile = Batmobile.new do |bm|
  bm.add_batphone
  bm.add_bat_beam(qty: 2)
  bm.add_bat_ray
end

ap custom_batmobile
