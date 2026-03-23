module Spree
  module Api
    module V2
      module DataFeeds
        class GoogleController < ::Spree::Api::V2::BaseController
          def rss_feed
            presenter = settings.class.presenter_class.new(settings)
            send_data presenter.call, filename: 'products.rss', type: 'text/xml'
          end

          private

          def settings
            @settings ||= Spree::DataFeed::Google.find_by!(store: current_store, slug: params[:slug], active: true)
          end
        end
      end
    end
  end
end
