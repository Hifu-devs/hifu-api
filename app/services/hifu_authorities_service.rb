class HifuAuthoritiesService

    def conn
      Faraday.new(url: 'https://hifu-authorities-service.herokuapp.com')
    end

    def authority_info(waypoint)
      conn.get("/sheriff?lat=#{waypoint.latitude}&long=#{waypoint.longitude}")
    end

  end
