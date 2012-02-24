class Phone

  def initialize
    super
    @contacts = {}
  end
  
  def add_contact(name, number)
    @contacts[name] = number
  end

  def call_contact(name)
    call(@contacts[name])
  end
  
  def call(number)
    puts "Calling #{number}"
  end

private

  def method_missing(method, *args)
    string_method = method.to_s
    return super unless string_method =~ /^call_\w+$/
    send :call_contact, get_contact_name(string_method)
  end
    
  def get_contact_name(string_method)
    /call_(\w+)/.match(string_method)[1]
  end
end

p = Phone.new
p.add_contact("george", "077")
p.call_george
