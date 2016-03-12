class SitemapsController < ApplicationController

  def show
    # Redirect to CloudFront and S3
    redirect_to 'https://s3-us-west-2.amazonaws.com/leaguedraw/sitemap/sitemap.xml'
  end

end