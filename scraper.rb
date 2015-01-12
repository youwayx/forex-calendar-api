require "mechanize"

mechanize= Mechanize.new
page = mechanize.get("http://dailyfx.com/calendar")
date = ""
bc=0;
scraped = false;
page.search('tr').each do |row|
	counter = 0;
	time = ""
	currency = ""
	actual = ""
	name = ""
	impact = ""
	actual = ""
	forecast =  ""
	previous = ""
	flag = false
	row.css('td').each do |data|
		
		if (counter ==0 && data.to_s[4..8]!="align")
			flag = true
			break
		end
		if (counter ==0)
			d = data.css(".e-cal-date span").text
			if (d.length>5)
				d=d.delete!("\n")
				d=d.delete!(" ")[3..-1]
				date=d+".2015"
				# if (Event.where({:date => date}).first!=nil)
				# 	scraped = true;
				# else
					todayDate = Date.today
					today = todayDate.strftime("%b")+todayDate.day.to_s+"."+todayDate.year.to_s
					puts today==date
				# end

			end
		elsif (counter ==1)
			time = data.text[0..4].delete(" ").delete("\n")
			if (time == "")
				time = "All Day"
			end
			
		elsif (counter ==2)
			a = data.css("div")
			currency = a.to_s[20..22]
		
		elsif(counter ==3)
			name = data.text
			#puts event
		elsif(counter ==4)
			impact = data.to_s[24..26]
			if (impact == "hig")
				impact = "high"
			end
			impact.capitalize!
			#puts actual + "." + impact
		elsif (counter ==5)
			actual = data.text
		elsif (counter ==6)
			forecast = data.text
		elsif (counter ==7)
			previous == data.text
		end
		
		counter+=1
		
		#puts data
	end
	if (!flag)
		if (!scraped)
			# event = Event.new;
			# event.date = date
			# event.impact = impact
			# event.currency = currency
			# event.time =  time
			# event.name = name
			# event.actual = actual
			# event.forecast = forecast
			# event.previous = previous
			# event.save
		end

	end
end