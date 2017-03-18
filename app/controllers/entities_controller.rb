class EntitiesController < ApplicationController

  def index
    entities = Entity.all
    render json:entities
  end

  def show
    id = params[:id]
  	entity = Entity.find(id)
  	render json:entity
  end

  def moyenne
  	country = params[:country]
  	city = params[:city]
  	rhesus = params[:rhesus]
  	entities = Entity.where(country:country, city: city, permanent:true).to_a
  	bloodtype = BloodType.find_by(rhesus:rhesus)
  	rhesus_id = bloodtype.id
  	total = 0
  	count = 0
  	mean = -1
  	if entities.present? then
  		entities.each do |entity|
			needs = entity.needs.find_by(blood_type_id:rhesus_id)
			total += needs.percent
			count += 1
		end
  	end
  	mean = total == 0 ? mean : total / count
  	render json: {mean: mean}
  end

  def nearest
    longitude = params[:longitude].to_f
    latitude = params[:latitude].to_f
    user_coord = [latitude, longitude]
    entities = Entity.all

    flying_distance = -1
    resEntity = nil
    entities.each do | entity |
      eLongitude = entity.longitude
      eLatitude = entity.latitude
      entity_coord = [eLatitude, eLongitude]
      newDistance = distance(user_coord, entity_coord)
      if flying_distance == -1 || flying_distance > newDistance then
        flying_distance = newDistance
        resEntity = entity
      end
    end
    render json: resEntity
  end

  def distance loc1, loc2
    puts "loc1"
    puts loc1[0]
    puts loc1[1]
    puts "loc2"
    puts loc2[0]
    puts loc2[1]
    rad_per_deg = Math::PI/180
    rkm = 6371
    rm = rkm * 1000

    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rm * c
  end
end
