actions :create, :delete
default_action :create

attribute :name, kind_of: String, default: nil
attribute :data, kind_of: Array, default: []
