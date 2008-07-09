Rails::Generator::Commands::Create.class_eval do
  
  def route_resource(*resources)
    resource_list = resources.map { |r| r.to_sym.inspect }.join(', ')
    sentinel = 'ActionController::Routing::Routes.draw do |map|'

    logger.route "map.resource #{resource_list}"
    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
        "#{match}\n  map.resource #{resource_list}\n"
      end
    end
  end
  
  def route_one_plural_resource_with_options(resource, options = {})
     sentinel = 'ActionController::Routing::Routes.draw do |map|'
     
     newroute = "map.resources #{resource.to_sym.inspect}"

     if options &&
       newroute << ', ' + options.inspect[/^\{(.*)\}$/, 1]
     end
     
     logger.route newroute

     unless options[:pretend]
       gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
         "#{match}\n  #{newroute}\n"
       end
     end
   end
  

  # extended interpretation of options so that this:
  #
  #   m.route_name('activate', '/activate/:activation_code', {:controller => controller_controller_name, :action => 'activate', :activation_code => nil})
  #
  # generates:
  #
  #   route  map.activate '/activate/:activation_code', :controller => 'sessions', :action => 'activate', :activation_code=>nil
  #
  def route_name(name, path, options = {})
    sentinel = 'ActionController::Routing::Routes.draw do |map|'
    
    newroute = "map.#{name} '#{path}'"
    if controller = options.delete(:controller)
      newroute << ", :controller => '#{controller}'"
    end
    if action = options.delete(:action)
      newroute << ", :action => '#{action}'"
    end
    unless options.empty?
      newroute << ', ' + options.inspect[/\{(.*)\}/, 1]
    end
    logger.route newroute
        
    # logger.route "map.#{name} '#{path}', :controller => '#{options[:controller]}', :action => '#{options[:action]}'"
    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
        "#{match}\n  #{newroute}"
      end
    end
  end
end

Rails::Generator::Commands::Destroy.class_eval do
  def route_resource(*resources)
    resource_list = resources.map { |r| r.to_sym.inspect }.join(', ')
    look_for = "\n  map.resource #{resource_list}\n"
    logger.route "map.resource #{resource_list}"
    gsub_file 'config/routes.rb', /(#{look_for})/mi, ''
  end
  
  def route_name(name, path, options = {})
    look_for =   "\n  map.#{name} '#{path}', :controller => '#{options[:controller]}', :action => '#{options[:action]}'"
    logger.route "map.#{name} '#{path}',     :controller => '#{options[:controller]}', :action => '#{options[:action]}'"
    gsub_file    'config/routes.rb', /(#{look_for})/mi, ''
  end
end

Rails::Generator::Commands::List.class_eval do
  def route_resource(*resources)
    resource_list = resources.map { |r| r.to_sym.inspect }.join(', ')
    logger.route "map.resource #{resource_list}"
  end
  
  def route_name(name, path, options = {})
    logger.route "map.#{name} '#{path}', :controller => '{options[:controller]}', :action => '#{options[:action]}'"
  end
end
