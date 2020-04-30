class HotSpot < ApplicationRecord

	geocoded_by :address
    after_validation :geocode

    has_many :movements
    
	def address
		[street, city, state, country].compact.join(', ')
	end

	def short_address
		[street, city, state, identification].compact.join(', ')
	end

	def status
		"green"
	end

	def generate_qr_code
	  qrcode = RQRCode::QRCode.new(id)
      
      png = qrcode.as_png(
        bit_depth: 1,
        border_modules: 4,
        color_mode: ChunkyPNG::COLOR_GRAYSCALE,
        color: 'black',
        file: nil,
        fill: 'white',
        module_px_size: 6,
        resize_exactly_to: false,
        resize_gte_to: false,
        size: 240
      )  

      IO.binwrite(Rails.root.join('public','qr_codes',"#{id}.png"), png.to_s)
	end
end
