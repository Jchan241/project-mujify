# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# Note: If a preference is set here it will be stored within the cache & database upon initialization.
#       Just removing an entry from this initializer will not make the preference value go away.
#       Instead you must either set a new value or remove entry, clear cache, and remove database entry.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
  config.currency = 'USD'
  config.logo = 'logo/Migu-logo big U.svg'
end


# Configure Spree Dependencies
#
# Note: If a dependency is set here it will NOT be stored within the cache & database upon initialization.
#       Just removing an entry from this initializer will make the dependency value go away.
#
Spree.dependencies do |dependencies|
  # Example:
  # Uncomment to change the default Service handling adding Items to Cart
  # dependencies.cart_add_item_service = 'MyNewAwesomeService'
end


Spree.user_class = "Spree::User"



# attachment_config = {
#   s3_credentials: {
#     access_key_id:     ENV['AKIA25ZSEP2Q5B7FT2XE'],
#     secret_access_key: ENV['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'],
#     bucket:            ENV['arn:aws:s3:::project-mujify']
#   },

#   storage:        :s3,
#   s3_region:      ENV['S3_REGION'],
#   s3_headers:     { "Cache-Control" => "max-age=31557600" },
#   s3_protocol:    "https",
#   bucket:         ENV['arn:aws:s3:::project-mujify'],
#   url:            ":s3_domain_url",

#   path:           "/:class/:id/:style/:basename.:extension",
#   default_url:    "/:class/:id/:style/:basename.:extension",
# }

# attachment_config.each do |key, value|
#   Spree::Image.attachment_definitions[:attachment][key.to_sym] = value
# end
