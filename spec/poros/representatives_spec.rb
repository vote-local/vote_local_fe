require 'rails_helper'

RSpec.describe 'Representatives poro' do

  describe 'it has attributes ' do
    it 'has many attributes' do

      null = nil
      
      info_hash = {
          id: null,
          type: "representative",
          attributes: {
            name: "Jared Polis",
            party: "Democratic Party",
            url: "https://www.colorado.gov/governor/",
            photo_url: "no photo found",
            office_name: "Governor of Colorado",
            twitter_handle: "jaredpolis"
          }
        }

      representative = Representatives.new(info_hash)

      expect(representative.name).to eq('Jared Polis')
      expect(representative.party).to eq('Democratic Party')
      expect(representative.url).to eq('https://www.colorado.gov/governor/')
      expect(representative.photo_url).to eq("no photo found")
      expect(representative.office_name).to eq("Governor of Colorado")
      expect(representative.twitter_handle).to eq("jaredpolis")

    end
  end
end
