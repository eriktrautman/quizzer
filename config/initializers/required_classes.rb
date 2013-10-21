  # # This is necessary because when ActiveRecord tries to
  # # deserialize the "queue" column of UserCategoryQueue,
  # # it doesn't yet know what a "card" object is, and throws
  # # an error.  For more info, see:
  # # http://stackoverflow.com/questions/13750342/yamlload-raises-undefined-class-module-error

  # require 'Card'