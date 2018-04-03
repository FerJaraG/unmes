require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://onemonth.cl'
SitemapGenerator::Sitemap.create do
  add '/home', :changefreq => 'weekly', :priority => 1
  add '/calendario', :changefreq => 'weekly', :priority => 0.5
  add '/welcome', :changefreq => 'weekly', :priority => 1
  add '/us', :changefreq => 'monthly', :priority => 0.7
  add '/blog', :changefreq => 'daily', :priority => 1

  add '/programador', :changefreq => 'weekly', :priority => 1
  add '/programador/inscripcion', :changefreq => 'weekly', :priority => 1
  add '/ctostartup', :changefreq => 'weekly', :priority => 1
  add '/ctostartup/inscripcion', :changefreq => 'weekly', :priority => 1

end
SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks