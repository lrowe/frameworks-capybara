#Adding no_proxy_host logic for Mechanize2 which uses this
#gem for it's HTTP client logic
#TODO: Grab from envirnment variable optionally, or provide list
class Net::HTTP::Persistent
  def connection_for uri
    Thread.current[@connection_key] ||= {}
    Thread.current[@request_key]    ||= Hash.new 0

    connections = Thread.current[@connection_key]

    net_http_args = [uri.host, uri.port]
    connection_id = net_http_args.join ':'
    #
    #Frameworks patch (and condition)
    if @proxy_uri and !uri.host.include? 'sandbox' then
      connection_id << @proxy_connection_id
      net_http_args.concat @proxy_args
    end

    unless connection = connections[connection_id] then
      connections[connection_id] = Net::HTTP.new(*net_http_args)
      connection = connections[connection_id]
      ssl connection if uri.scheme.downcase == 'https'
    end

    unless connection.started? then
      connection.set_debug_output @debug_output if @debug_output
      connection.open_timeout = @open_timeout if @open_timeout
      connection.read_timeout = @read_timeout if @read_timeout

      connection.start

      socket = connection.instance_variable_get :@socket

      if socket then # for fakeweb
        @socket_options.each do |option|
          socket.io.setsockopt(*option)
        end
      end
    end

    connection
  rescue Errno::ECONNREFUSED
    raise Error, "connection refused: #{connection.address}:#{connection.port}"
  rescue Errno::EHOSTDOWN
    raise Error, "host down: #{connection.address}:#{connection.port}"
  end
end
