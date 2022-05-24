# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://my-university.com.ua"

SitemapGenerator::Sitemap.create do

  # Universities
  University.where(is_hidden: false).find_each do |university|
    add university_path(university.url), :priority => 0.8, :changefreq => 'monthly'
  end

  # Static pages
  add about_path, :priority => 0.6, :changefreq => 'monthly'
  add cooperation_path, :priority => 0.6, :changefreq => 'monthly'
  add contacts_path, :priority => 0.6, :changefreq => 'monthly'
  add privacy_policy_path, :priority => 0.6, :changefreq => 'monthly'
  add terms_of_service_path, :priority => 0.6, :changefreq => 'monthly'
  add ios_path, :priority => 0.7, :changefreq => 'monthly'
  add android_path, :priority => 0.6, :changefreq => 'monthly'
  add telegram_channels_path, :priority => 0.6, :changefreq => 'monthly'

end
