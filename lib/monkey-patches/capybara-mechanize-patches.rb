require 'capybara/mechanize/cucumber' 
require 'uri'

class Capybara::Mechanize::Driver

  #With Capybara 1.x Capybara::Mechanize now just uses the reset! method in
  #Capybara::RackTest::Driver which simply blats the @browser.  This is kind of
  #ok as we don't have the overhead of opening a real browser.  However this means
  #that our global settings e.g. proxy, ssl get blatted as well.
  def reset!
    browser.agent.cookie_jar.clear!
    browser.reset_host!
  end

  #Patch in cookie handling support for mechanize via Capybara::Mechanize
  def cookies
    cookies = []

    browser.agent.cookie_jar.jar.each do |domain|
      domain[1].each do |path|
        path[1].each do |cookie|
          cookies.push({
            :name => cookie[1].name,
            :value => cookie[1].value,
            :domain => cookie[1].domain,
            :secure => cookie[1].secure,
            :expires => cookie[1].expires,
            :path => cookie[1].path
          })
        end
      end
    end
    cookies
  end

  def cookie_named(name)
    cookies.find { |c| c[:name] == name }
  end

  def delete_cookie(cookie_name)
    browser.agent.cookie_jar.jar.each do |domain|
      domain[1].each do |path|
        path[1].each do |cookie|
          if cookie[0] == cookie_name
            browser.agent.cookie_jar.jar[domain[0]][path[0]].delete(cookie[0])
          end
        end
      end
    end
  end

  def delete_all_cookies
    browser.agent.cookie_jar.clear!
  end

  FakeURI = Struct.new(:host)
  def add_cookie(attribs)
    c = Mechanize::Cookie.new(attribs[:name],attribs[:value])
    c.domain = attribs[:domain]
    c.path = '/'
    c.expires = attribs[:expires]
    c.secure = attribs[:secure]
    browser.agent.cookie_jar.add(FakeURI.new(c.domain),c)
  end
end
