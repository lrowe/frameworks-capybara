=begin
require 'mechanize'
class Mechanize
  def set_ssl_client_certification(clientcert, clientkey, cacert)
    @agent.cert, @agent.key = clientcert, clientkey
    @agent.ca_file = cacert if cacert
  end
# Fetches the URL passed in and returns a page.
  def get(uri, parameters = [], referer = nil, headers = {})
    method = :get

    if Hash === uri then
      options = uri
      location = Gem.location_of_caller.join ':'
      warn "#{location}: Mechanize#get with options hash is deprecated and will be removed October 2011"

      raise ArgumentError, "url must be specified" unless uri = options[:url]
      parameters = options[:params] || []
      referer    = options[:referer]
      headers    = options[:headers]
      method     = options[:verb] || method
    end

    #FRAMEWORKS-PATCH - CHANGE LOGIC in 'if' so that =~ becomes !~ in order for 
    #referer to be set correctly.
    referer ||=
      if uri.to_s !~ %r{\Ahttps?://}
        Page.new(nil, {'content-type'=>'text/html'})
      else
        current_page || Page.new(nil, {'content-type'=>'text/html'})
      end

    # FIXME: Huge hack so that using a URI as a referer works.  I need to
    # refactor everything to pass around URIs but still support
    # Mechanize::Page#base
    unless referer.is_a?(Mechanize::File)
      referer = referer.is_a?(String) ?
      Page.new(URI.parse(referer), {'content-type' => 'text/html'}) :
        Page.new(referer, {'content-type' => 'text/html'})
    end

    # fetch the page
    headers ||= {}
    page = @agent.fetch uri, method, headers, parameters, referer
    add_to_history(page)
    yield page if block_given?
    page
  end

end

#This patch disables the validity checking done by Mechanize2 against Cookies
#It attempts to validate using RFC2965 - and our cookies fail by these rules.
#NOTE - Most 'normal' browsers don't seem to care
class Mechanize::CookieJar
  def add(uri, cookie)
    #return unless valid_cookie_for_uri?(uri, cookie)

    normal_domain = cookie.domain.downcase

    @jar[normal_domain] ||= {} unless @jar.has_key?(normal_domain)

    @jar[normal_domain][cookie.path] ||= {}
    @jar[normal_domain][cookie.path][cookie.name] = cookie

    cookie
  end
end
=end
