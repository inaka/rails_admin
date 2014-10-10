require 'rails_admin/config/fields/types/string'

module RailsAdmin
  module Config
    module Fields
      module Types
        class Lookup < RailsAdmin::Config::Fields::Base
          RailsAdmin::Config::Fields::Types.register(self)

          register_instance_option :partial do
            :form_enumeration
          end

          register_instance_option :pretty_value do
            value
          end

          register_instance_option :multiple? do
            false
          end

          register_instance_option :visible? do
            false
          end

          register_instance_option :searchable do
            true
          end

          register_instance_option :queryable? do
            false
          end

          def association_klass
            properties.name.to_s.sub("_id", "").capitalize
          end

          # Reader for the association's child model's configuration
          def associated_model_config
            @associated_model_config ||= RailsAdmin.config(association_klass)
          end
        end
      end
    end
  end
end
