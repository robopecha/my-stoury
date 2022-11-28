class SitesController < ApplicationController
  # this route is for map testing
  def index
    @sites = Site.all
    @markers = @sites.geocoded.map do |site|
      {
        lat: site.latitude,
        lng: site.longitude,
        info_window: render_to_string(partial: "info_window", locals: {site: site})
      }
    end
  end
end
