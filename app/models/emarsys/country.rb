module Emarsys
  class Country
    def find_code(country)
      codes[country.optionize.to_sym] || nil
    end

    # each country and their corresponding
    # integer value in the emarsys db
    def codes
      {
        afghanistan: 1,
        albania: 2,
        algeria: 3,
        andorra: 4,
        angola: 5,
        antigua_and_barbuda: 6,
        argentina: 7,
        armenia: 8,
        australia: 9,
        austria: 10,
        azerbaijan: 11,
        bahamas: 12,
        bahrain: 13,
        bangladesh: 14,
        barbados: 15,
        belarus: 16,
        belgium: 17,
        belize: 18,
        benin: 19,
        bhutan: 20,
        bolivia: 21,
        bosnia_and_herzegovina: 22,
        botswana: 23,
        brazil: 24,
        brunei_darussalam: 25,
        bulgaria: 26,
        burkina_faso: 27,
        burma: 28,
        burundi: 29,
        cambodia: 30,
        cameroon: 31,
        canada: 32,
        cape_verde: 33,
        central_african_republic: 34,
        chad: 35,
        chile: 36,
        china: 37,
        colombia: 38,
        comoros: 39,
        congo: 40,
        congo_democratic_republic_of_the: 41,
        costa_rica: 42,
        cote_d_ivoire: 43,
        croatia: 44,
        cuba: 45,
        cyprus: 46,
        czech_republic: 47,
        denmark: 48,
        djibouti: 49,
        dominica: 50,
        dominican_republic: 51,
        ecuador: 52,
        egypt: 53,
        el_salvador: 54,
        equatorial_guinea: 55,
        eritrea: 56,
        estonia: 57,
        ethiopia: 58,
        fiji: 59,
        finland: 60,
        france: 61,
        gabon: 62,
        gambia_the: 63,
        georgia: 64,
        germany: 65,
        ghana: 66,
        greece: 67,
        grenada: 68,
        guatemala: 69,
        guinea: 70,
        guinea_bissau: 71,
        guyana: 72,
        haiti: 73,
        honduras: 74,
        hungary: 75,
        iceland: 76,
        india: 77,
        indonesia: 78,
        iran: 79,
        iraq: 80,
        ireland: 81,
        israel: 82,
        italy: 83,
        jamaica: 84,
        japan: 85,
        jordan: 86,
        kazakhstan: 87,
        kenya: 88,
        kiribati: 89,
        korea_north: 90,
        korea_south: 91,
        kuwait: 92,
        kyrgyzstan: 93,
        laos: 94,
        latvia: 95,
        lebanon: 96,
        lesotho: 97,
        liberia: 98,
        libya: 99,
        liechtenstein: 100,
        lithuania: 101,
        luxembourg: 102,
        macedonia: 103,
        madagascar: 104,
        malawi: 105,
        malaysia: 106,
        maldives: 107,
        mali: 108,
        malta: 109,
        marshall_islands: 110,
        mauritania: 111,
        mauritius: 112,
        mexico: 113,
        micronesia: 114,
        moldova: 115,
        monaco: 116,
        mongolia: 117,
        morocco: 118,
        mozambique: 119,
        myanmar: 120,
        namibia: 121,
        nauru: 122,
        nepal: 123,
        the_netherlands: 124,
        new_zealand: 125,
        nicaragua: 126,
        niger: 127,
        nigeria: 128,
        norway: 129,
        oman: 130,
        pakistan: 131,
        palau: 132,
        panama: 134,
        papua_new_guinea: 135,
        paraguay: 136,
        peru: 137,
        philippines: 138,
        poland: 139,
        portugal: 140,
        qatar: 141,
        romania: 142,
        russia: 143,
        rwanda: 144,
        st_kitts_and_nevis: 145,
        st_lucia: 146,
        st_vincent_and_the_grenadines: 147,
        samoa: 148,
        san_marino: 149,
        são_tomé_and_príncipe: 150,
        saudi_arabia: 151,
        senegal: 152,
        serbia: 153,
        seychelles: 154,
        sierra_leone: 155,
        singapore: 156,
        slovakia: 157,
        slovenia: 158,
        solomon_islands: 159,
        somalia: 160,
        south_africa: 161,
        spain: 162,
        sri_lanka: 163,
        sudan: 164,
        suriname: 165,
        swaziland: 166,
        sweden: 167,
        switzerland: 168,
        syria: 169,
        taiwan: 170,
        tajikistan: 171,
        tanzania: 172,
        thailand: 173,
        togo: 174,
        tonga: 175,
        trinidad_and_tobago: 176,
        tunisia: 177,
        turkey: 178,
        turkmenistan: 179,
        tuvalu: 180,
        uganda: 181,
        ukraine: 182,
        united_arab_emirates: 183,
        united_kingdom: 184,
        united_states_of_america: 185,
        uruguay: 186,
        uzbekistan: 187,
        vanuatu: 188,
        vatican_city: 189,
        venezuela: 190,
        vietnam: 191,
        western_sahara: 192,
        yemen: 193,
        yugoslavia: 194,
        zaire: 195,
        zambia: 196,
        zimbabwe: 197,
        greenland: 198,
        virgin_islands: 199,
        canary_islands: 201,
        montenegro: 202,
        gibraltar: 203,
        netherlands_antilles: 204,
        hong_kong: 205,
        macau: 206,
        east_timor: 258,
        kosovo: 259
      }
    end
  end
end