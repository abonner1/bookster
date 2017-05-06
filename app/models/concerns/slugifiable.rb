module Slugifiable
  module ClassMethods
    def find_by_slug(slug)
      self.all.find {|instance| instance.slug == slug}
    end
  end

  module InstanceMethods
    def slug
      self.username.gsub(/ /, "-")
    end
  end
end
