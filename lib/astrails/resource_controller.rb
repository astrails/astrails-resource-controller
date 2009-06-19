module Astrails
  class ResourceController < ApplicationController
    unloadable
    resource_controller

    def self.inherited(subclass)
      super
      subclass.class_eval do
        ::ResourceController::NAME_ACCESSORS.each { |accessor| send(accessor, controller_name.singularize.underscore) }
      end
    end

    def per_page
      [(params[:per_page] || 20).to_i, 100].min
    end

    def page
      params[:page]
    end

    def collection
      end_of_association_chain.paginate(:page => page, :per_page => per_page)
    end
  end
end
