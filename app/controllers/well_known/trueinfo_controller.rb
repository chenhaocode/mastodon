# frozen_string_literal: true

module WellKnown
  class TrueInfoController < ActionController::Base
    include CacheConcern

    before_action { response.headers['Vary'] = 'Accept' }

    def index
      expires_in 3.days, public: true
      render_with_cache json: {}, serializer: TrueInfo::DiscoverySerializer, adapter: TrueInfo::Adapter, expires_in: 3.days, root: 'nodeinfo'
    end

    def show
      expires_in 30.minutes, public: true
      render_with_cache json: {}, serializer: TrueInfo::Serializer, adapter: TrueInfo::Adapter, expires_in: 30.minutes, root: 'nodeinfo'
    end
  end
end
