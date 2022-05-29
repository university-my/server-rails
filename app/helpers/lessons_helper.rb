module LessonsHelper

  # Get pair date from params or use today date
  def date_string_from(params)
    params[:date] || Date.today.strftime('%F')
  end

  # Get pair date from params or use today date
  def date_from(params)
    if params.key?(:date)
      params[:date].to_date
    else
      Date.today
    end
  end

  def self.min_date
    (DateTime.now - 1.year).strftime('%Y-%m-%d')
  end

  def self.max_date
    (DateTime.now + 1.year).strftime('%Y-%m-%d')
  end

  def self.random_image
    images = [
      "4 Multitasking.png",
      "6 Working at desk.png",
      "1 Working remotely.png",
      "7 Social Media.png",
      "8 Work and life balance.png",
      "dobrogo_vechora.png",
      "ua.png",
      "save.png"
    ]
    images.sample
  end

  def self.is_sticker(image)
    ["dobrogo_vechora.png", "ua.png", "save.png"].include? image
  end

end
