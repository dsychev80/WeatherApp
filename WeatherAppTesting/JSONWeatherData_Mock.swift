//
//  JSONWeatherData_Mock.swift
//  WeatherAppTesting
//
//  Created by Denis Sychev on 07.12.2021.
//
import Foundation
@testable import WeatherApp

struct WeatherDataForTest {
static let rawData = """
{
"message" : 0,
"cod" : "200",
"cnt" : 40,
"list" : [
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 7.5999999999999996,
      "deg" : 151,
      "gust" : 16.550000000000001
    },
    "dt" : 1638867600,
    "snow" : {
      "3h" : 0.37
    },
    "dt_txt" : "2021-12-07 09:00:00",
    "main" : {
      "humidity" : 93,
      "feels_like" : -6.5499999999999998,
      "temp_min" : -0.29999999999999999,
      "temp_max" : -0.29999999999999999,
      "temp" : -0.29999999999999999,
      "pressure" : 1020,
      "temp_kf" : 0,
      "sea_level" : 1020,
      "grnd_level" : 1004
    },
    "weather" : [
      {
        "id" : 600,
        "main" : "Snow",
        "icon" : "13d",
        "description" : "небольшой снег"
      }
    ],
    "pop" : 0.56999999999999995,
    "sys" : {
      "pod" : "d"
    },
    "visibility" : 304
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 7.54,
      "deg" : 152,
      "gust" : 16.73
    },
    "dt" : 1638878400,
    "rain" : {
      "3h" : 3.6600000000000001
    },
    "dt_txt" : "2021-12-07 12:00:00",
    "main" : {
      "humidity" : 94,
      "feels_like" : -6.25,
      "temp_min" : -0.080000000000000002,
      "temp_max" : 0.35999999999999999,
      "temp" : -0.080000000000000002,
      "pressure" : 1020,
      "temp_kf" : -0.44,
      "sea_level" : 1020,
      "grnd_level" : 1003
    },
    "weather" : [
      {
        "id" : 501,
        "main" : "Rain",
        "icon" : "10d",
        "description" : "дождь"
      }
    ],
    "pop" : 0.96999999999999997,
    "sys" : {
      "pod" : "d"
    },
    "visibility" : 8093
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 7.9100000000000001,
      "deg" : 159,
      "gust" : 16.640000000000001
    },
    "dt" : 1638889200,
    "rain" : {
      "3h" : 0.46999999999999997
    },
    "dt_txt" : "2021-12-07 15:00:00",
    "main" : {
      "humidity" : 95,
      "feels_like" : -5.2400000000000002,
      "temp_min" : 0.81000000000000005,
      "temp_max" : 1.3700000000000001,
      "temp" : 0.81000000000000005,
      "pressure" : 1019,
      "temp_kf" : -0.56000000000000005,
      "sea_level" : 1019,
      "grnd_level" : 1002
    },
    "weather" : [
      {
        "id" : 500,
        "main" : "Rain",
        "icon" : "10n",
        "description" : "небольшой дождь"
      }
    ],
    "pop" : 0.68000000000000005,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 7.7699999999999996,
      "deg" : 163,
      "gust" : 16.960000000000001
    },
    "dt" : 1638900000,
    "rain" : {
      "3h" : 0.56999999999999995
    },
    "dt_txt" : "2021-12-07 18:00:00",
    "main" : {
      "humidity" : 96,
      "feels_like" : -3.8500000000000001,
      "temp_min" : 1.8400000000000001,
      "temp_max" : 1.8400000000000001,
      "temp" : 1.8400000000000001,
      "pressure" : 1017,
      "temp_kf" : 0,
      "sea_level" : 1017,
      "grnd_level" : 1002
    },
    "weather" : [
      {
        "id" : 500,
        "main" : "Rain",
        "icon" : "10n",
        "description" : "небольшой дождь"
      }
    ],
    "pop" : 0.62,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 7.0700000000000003,
      "deg" : 169,
      "gust" : 16.82
    },
    "dt" : 1638910800,
    "dt_txt" : "2021-12-07 21:00:00",
    "main" : {
      "humidity" : 96,
      "feels_like" : -2.75,
      "temp_min" : 2.48,
      "temp_max" : 2.48,
      "temp" : 2.48,
      "pressure" : 1018,
      "temp_kf" : 0,
      "sea_level" : 1018,
      "grnd_level" : 1002
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0.040000000000000001,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 6.1699999999999999,
      "deg" : 166,
      "gust" : 15.859999999999999
    },
    "dt" : 1638921600,
    "dt_txt" : "2021-12-08 00:00:00",
    "main" : {
      "humidity" : 93,
      "feels_like" : -2.1200000000000001,
      "temp_min" : 2.6800000000000002,
      "temp_max" : 2.6800000000000002,
      "temp" : 2.6800000000000002,
      "pressure" : 1017,
      "temp_kf" : 0,
      "sea_level" : 1017,
      "grnd_level" : 1002
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0.040000000000000001,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 5.7000000000000002,
      "deg" : 160,
      "gust" : 15.09
    },
    "dt" : 1638932400,
    "dt_txt" : "2021-12-08 03:00:00",
    "main" : {
      "humidity" : 93,
      "feels_like" : -2.27,
      "temp_min" : 2.3999999999999999,
      "temp_max" : 2.3999999999999999,
      "temp" : 2.3999999999999999,
      "pressure" : 1017,
      "temp_kf" : 0,
      "sea_level" : 1017,
      "grnd_level" : 1001
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 5.4100000000000001,
      "deg" : 154,
      "gust" : 14.48
    },
    "dt" : 1638943200,
    "dt_txt" : "2021-12-08 06:00:00",
    "main" : {
      "humidity" : 91,
      "feels_like" : -2.3999999999999999,
      "temp_min" : 2.1800000000000002,
      "temp_max" : 2.1800000000000002,
      "temp" : 2.1800000000000002,
      "pressure" : 1018,
      "temp_kf" : 0,
      "sea_level" : 1018,
      "grnd_level" : 1002
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04d",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "d"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 5.21,
      "deg" : 152,
      "gust" : 13.300000000000001
    },
    "dt" : 1638954000,
    "dt_txt" : "2021-12-08 09:00:00",
    "main" : {
      "humidity" : 90,
      "feels_like" : -0.97999999999999998,
      "temp_min" : 3.23,
      "temp_max" : 3.23,
      "temp" : 3.23,
      "pressure" : 1017,
      "temp_kf" : 0,
      "sea_level" : 1017,
      "grnd_level" : 1002
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04d",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "d"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 4.1600000000000001,
      "deg" : 137,
      "gust" : 10.07
    },
    "dt" : 1638964800,
    "dt_txt" : "2021-12-08 12:00:00",
    "main" : {
      "humidity" : 91,
      "feels_like" : -0.78000000000000003,
      "temp_min" : 2.9300000000000002,
      "temp_max" : 2.9300000000000002,
      "temp" : 2.9300000000000002,
      "pressure" : 1017,
      "temp_kf" : 0,
      "sea_level" : 1017,
      "grnd_level" : 1001
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04d",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "d"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 3.75,
      "deg" : 128,
      "gust" : 9.4800000000000004
    },
    "dt" : 1638975600,
    "dt_txt" : "2021-12-08 15:00:00",
    "main" : {
      "humidity" : 93,
      "feels_like" : -1.72,
      "temp_min" : 1.95,
      "temp_max" : 1.95,
      "temp" : 1.95,
      "pressure" : 1017,
      "temp_kf" : 0,
      "sea_level" : 1017,
      "grnd_level" : 1001
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 3.7200000000000002,
      "deg" : 125,
      "gust" : 8.9499999999999993
    },
    "dt" : 1638986400,
    "dt_txt" : "2021-12-08 18:00:00",
    "main" : {
      "humidity" : 95,
      "feels_like" : -1.6399999999999999,
      "temp_min" : 2,
      "temp_max" : 2,
      "temp" : 2,
      "pressure" : 1017,
      "temp_kf" : 0,
      "sea_level" : 1017,
      "grnd_level" : 1001
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 3.6899999999999999,
      "deg" : 117,
      "gust" : 8.3699999999999992
    },
    "dt" : 1638997200,
    "dt_txt" : "2021-12-08 21:00:00",
    "main" : {
      "humidity" : 96,
      "feels_like" : -1.6699999999999999,
      "temp_min" : 1.96,
      "temp_max" : 1.96,
      "temp" : 1.96,
      "pressure" : 1017,
      "temp_kf" : 0,
      "sea_level" : 1017,
      "grnd_level" : 1001
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 3.21,
      "deg" : 125,
      "gust" : 7.6799999999999997
    },
    "dt" : 1639008000,
    "dt_txt" : "2021-12-09 00:00:00",
    "main" : {
      "humidity" : 95,
      "feels_like" : -1.6599999999999999,
      "temp_min" : 1.6699999999999999,
      "temp_max" : 1.6699999999999999,
      "temp" : 1.6699999999999999,
      "pressure" : 1017,
      "temp_kf" : 0,
      "sea_level" : 1017,
      "grnd_level" : 1001
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 2.8799999999999999,
      "deg" : 127,
      "gust" : 6.5499999999999998
    },
    "dt" : 1639018800,
    "dt_txt" : "2021-12-09 03:00:00",
    "main" : {
      "humidity" : 96,
      "feels_like" : -1.79,
      "temp_min" : 1.3400000000000001,
      "temp_max" : 1.3400000000000001,
      "temp" : 1.3400000000000001,
      "pressure" : 1017,
      "temp_kf" : 0,
      "sea_level" : 1017,
      "grnd_level" : 1001
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 2.1299999999999999,
      "deg" : 117,
      "gust" : 4.3899999999999997
    },
    "dt" : 1639029600,
    "dt_txt" : "2021-12-09 06:00:00",
    "main" : {
      "humidity" : 95,
      "feels_like" : -1.27,
      "temp_min" : 1.1499999999999999,
      "temp_max" : 1.1499999999999999,
      "temp" : 1.1499999999999999,
      "pressure" : 1018,
      "temp_kf" : 0,
      "sea_level" : 1018,
      "grnd_level" : 1002
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04d",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "d"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 1.8,
      "deg" : 121,
      "gust" : 2.7999999999999998
    },
    "dt" : 1639040400,
    "dt_txt" : "2021-12-09 09:00:00",
    "main" : {
      "humidity" : 89,
      "feels_like" : 0.20000000000000001,
      "temp_min" : 2.0699999999999998,
      "temp_max" : 2.0699999999999998,
      "temp" : 2.0699999999999998,
      "pressure" : 1018,
      "temp_kf" : 0,
      "sea_level" : 1018,
      "grnd_level" : 1002
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04d",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "d"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 1.6299999999999999,
      "deg" : 24,
      "gust" : 1.8899999999999999
    },
    "dt" : 1639051200,
    "dt_txt" : "2021-12-09 12:00:00",
    "main" : {
      "humidity" : 90,
      "feels_like" : 0.34999999999999998,
      "temp_min" : 2.0099999999999998,
      "temp_max" : 2.0099999999999998,
      "temp" : 2.0099999999999998,
      "pressure" : 1019,
      "temp_kf" : 0,
      "sea_level" : 1019,
      "grnd_level" : 1003
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04d",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "d"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 2.4100000000000001,
      "deg" : 25,
      "gust" : 4.3099999999999996
    },
    "dt" : 1639062000,
    "dt_txt" : "2021-12-09 15:00:00",
    "main" : {
      "humidity" : 93,
      "feels_like" : -1.3200000000000001,
      "temp_min" : 1.3600000000000001,
      "temp_max" : 1.3600000000000001,
      "temp" : 1.3600000000000001,
      "pressure" : 1020,
      "temp_kf" : 0,
      "sea_level" : 1020,
      "grnd_level" : 1004
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 3.79,
      "deg" : 15,
      "gust" : 6.9900000000000002
    },
    "dt" : 1639072800,
    "dt_txt" : "2021-12-09 18:00:00",
    "main" : {
      "humidity" : 96,
      "feels_like" : -3.4100000000000001,
      "temp_min" : 0.58999999999999997,
      "temp_max" : 0.58999999999999997,
      "temp" : 0.58999999999999997,
      "pressure" : 1021,
      "temp_kf" : 0,
      "sea_level" : 1021,
      "grnd_level" : 1005
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 4.0999999999999996,
      "deg" : 8,
      "gust" : 7.2699999999999996
    },
    "dt" : 1639083600,
    "dt_txt" : "2021-12-09 21:00:00",
    "main" : {
      "humidity" : 93,
      "feels_like" : -4.8899999999999997,
      "temp_min" : -0.44,
      "temp_max" : -0.44,
      "temp" : -0.44,
      "pressure" : 1023,
      "temp_kf" : 0,
      "sea_level" : 1023,
      "grnd_level" : 1006
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 4.4199999999999999,
      "deg" : 16,
      "gust" : 7.8200000000000003
    },
    "dt" : 1639094400,
    "dt_txt" : "2021-12-10 00:00:00",
    "main" : {
      "humidity" : 90,
      "feels_like" : -6.4299999999999997,
      "temp_min" : -1.51,
      "temp_max" : -1.51,
      "temp" : -1.51,
      "pressure" : 1024,
      "temp_kf" : 0,
      "sea_level" : 1024,
      "grnd_level" : 1008
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 4.4000000000000004,
      "deg" : 17,
      "gust" : 8.7400000000000002
    },
    "dt" : 1639105200,
    "dt_txt" : "2021-12-10 03:00:00",
    "main" : {
      "humidity" : 91,
      "feels_like" : -8.8300000000000001,
      "temp_min" : -3.46,
      "temp_max" : -3.46,
      "temp" : -3.46,
      "pressure" : 1025,
      "temp_kf" : 0,
      "sea_level" : 1025,
      "grnd_level" : 1009
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 4.5099999999999998,
      "deg" : 31,
      "gust" : 9.7699999999999996
    },
    "dt" : 1639116000,
    "dt_txt" : "2021-12-10 06:00:00",
    "main" : {
      "humidity" : 86,
      "feels_like" : -9.4100000000000001,
      "temp_min" : -3.8599999999999999,
      "temp_max" : -3.8599999999999999,
      "temp" : -3.8599999999999999,
      "pressure" : 1028,
      "temp_kf" : 0,
      "sea_level" : 1028,
      "grnd_level" : 1011
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04d",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "d"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 4.7300000000000004,
      "deg" : 39,
      "gust" : 6.9500000000000002
    },
    "dt" : 1639126800,
    "dt_txt" : "2021-12-10 09:00:00",
    "main" : {
      "humidity" : 64,
      "feels_like" : -7.9900000000000002,
      "temp_min" : -2.6000000000000001,
      "temp_max" : -2.6000000000000001,
      "temp" : -2.6000000000000001,
      "pressure" : 1028,
      "temp_kf" : 0,
      "sea_level" : 1028,
      "grnd_level" : 1012
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04d",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "d"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 99
    },
    "wind" : {
      "speed" : 3.8799999999999999,
      "deg" : 36,
      "gust" : 7.2800000000000002
    },
    "dt" : 1639137600,
    "dt_txt" : "2021-12-10 12:00:00",
    "main" : {
      "humidity" : 63,
      "feels_like" : -7.5800000000000001,
      "temp_min" : -2.7599999999999998,
      "temp_max" : -2.7599999999999998,
      "temp" : -2.7599999999999998,
      "pressure" : 1029,
      "temp_kf" : 0,
      "sea_level" : 1029,
      "grnd_level" : 1013
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04d",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "d"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 87
    },
    "wind" : {
      "speed" : 4.1900000000000004,
      "deg" : 47,
      "gust" : 9.1199999999999992
    },
    "dt" : 1639148400,
    "dt_txt" : "2021-12-10 15:00:00",
    "main" : {
      "humidity" : 71,
      "feels_like" : -9.6300000000000008,
      "temp_min" : -4.2300000000000004,
      "temp_max" : -4.2300000000000004,
      "temp" : -4.2300000000000004,
      "pressure" : 1031,
      "temp_kf" : 0,
      "sea_level" : 1031,
      "grnd_level" : 1015
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 57
    },
    "wind" : {
      "speed" : 3.9500000000000002,
      "deg" : 55,
      "gust" : 8.9000000000000004
    },
    "dt" : 1639159200,
    "dt_txt" : "2021-12-10 18:00:00",
    "main" : {
      "humidity" : 73,
      "feels_like" : -10.039999999999999,
      "temp_min" : -4.7199999999999998,
      "temp_max" : -4.7199999999999998,
      "temp" : -4.7199999999999998,
      "pressure" : 1032,
      "temp_kf" : 0,
      "sea_level" : 1032,
      "grnd_level" : 1015
    },
    "weather" : [
      {
        "id" : 803,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "облачно с прояснениями"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 1
    },
    "wind" : {
      "speed" : 3.5099999999999998,
      "deg" : 68,
      "gust" : 8.6699999999999999
    },
    "dt" : 1639170000,
    "dt_txt" : "2021-12-10 21:00:00",
    "main" : {
      "humidity" : 72,
      "feels_like" : -10.31,
      "temp_min" : -5.25,
      "temp_max" : -5.25,
      "temp" : -5.25,
      "pressure" : 1033,
      "temp_kf" : 0,
      "sea_level" : 1033,
      "grnd_level" : 1016
    },
    "weather" : [
      {
        "id" : 800,
        "main" : "Clear",
        "icon" : "01n",
        "description" : "ясно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 1
    },
    "wind" : {
      "speed" : 3.3500000000000001,
      "deg" : 68,
      "gust" : 8.2400000000000002
    },
    "dt" : 1639180800,
    "dt_txt" : "2021-12-11 00:00:00",
    "main" : {
      "humidity" : 72,
      "feels_like" : -10.82,
      "temp_min" : -5.7999999999999998,
      "temp_max" : -5.7999999999999998,
      "temp" : -5.7999999999999998,
      "pressure" : 1034,
      "temp_kf" : 0,
      "sea_level" : 1034,
      "grnd_level" : 1017
    },
    "weather" : [
      {
        "id" : 800,
        "main" : "Clear",
        "icon" : "01n",
        "description" : "ясно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 0
    },
    "wind" : {
      "speed" : 3.8399999999999999,
      "deg" : 75,
      "gust" : 9.2100000000000009
    },
    "dt" : 1639191600,
    "dt_txt" : "2021-12-11 03:00:00",
    "main" : {
      "humidity" : 71,
      "feels_like" : -11.859999999999999,
      "temp_min" : -6.2800000000000002,
      "temp_max" : -6.2800000000000002,
      "temp" : -6.2800000000000002,
      "pressure" : 1034,
      "temp_kf" : 0,
      "sea_level" : 1034,
      "grnd_level" : 1017
    },
    "weather" : [
      {
        "id" : 800,
        "main" : "Clear",
        "icon" : "01n",
        "description" : "ясно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 2
    },
    "wind" : {
      "speed" : 4.0700000000000003,
      "deg" : 89,
      "gust" : 10.56
    },
    "dt" : 1639202400,
    "dt_txt" : "2021-12-11 06:00:00",
    "main" : {
      "humidity" : 68,
      "feels_like" : -12.09,
      "temp_min" : -6.3099999999999996,
      "temp_max" : -6.3099999999999996,
      "temp" : -6.3099999999999996,
      "pressure" : 1035,
      "temp_kf" : 0,
      "sea_level" : 1035,
      "grnd_level" : 1019
    },
    "weather" : [
      {
        "id" : 800,
        "main" : "Clear",
        "icon" : "01d",
        "description" : "ясно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "d"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 8
    },
    "wind" : {
      "speed" : 4.9800000000000004,
      "deg" : 109,
      "gust" : 8.9299999999999997
    },
    "dt" : 1639213200,
    "dt_txt" : "2021-12-11 09:00:00",
    "main" : {
      "humidity" : 52,
      "feels_like" : -9.5099999999999998,
      "temp_min" : -3.6800000000000002,
      "temp_max" : -3.6800000000000002,
      "temp" : -3.6800000000000002,
      "pressure" : 1036,
      "temp_kf" : 0,
      "sea_level" : 1036,
      "grnd_level" : 1019
    },
    "weather" : [
      {
        "id" : 800,
        "main" : "Clear",
        "icon" : "01d",
        "description" : "ясно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "d"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 6
    },
    "wind" : {
      "speed" : 3.8999999999999999,
      "deg" : 108,
      "gust" : 8.4700000000000006
    },
    "dt" : 1639224000,
    "dt_txt" : "2021-12-11 12:00:00",
    "main" : {
      "humidity" : 53,
      "feels_like" : -8.5899999999999999,
      "temp_min" : -3.5699999999999998,
      "temp_max" : -3.5699999999999998,
      "temp" : -3.5699999999999998,
      "pressure" : 1036,
      "temp_kf" : 0,
      "sea_level" : 1036,
      "grnd_level" : 1020
    },
    "weather" : [
      {
        "id" : 800,
        "main" : "Clear",
        "icon" : "01d",
        "description" : "ясно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "d"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 12
    },
    "wind" : {
      "speed" : 4.4100000000000001,
      "deg" : 108,
      "gust" : 10.949999999999999
    },
    "dt" : 1639234800,
    "dt_txt" : "2021-12-11 15:00:00",
    "main" : {
      "humidity" : 58,
      "feels_like" : -10.800000000000001,
      "temp_min" : -5.04,
      "temp_max" : -5.04,
      "temp" : -5.04,
      "pressure" : 1037,
      "temp_kf" : 0,
      "sea_level" : 1037,
      "grnd_level" : 1021
    },
    "weather" : [
      {
        "id" : 801,
        "main" : "Clouds",
        "icon" : "02n",
        "description" : "небольшая облачность"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 35
    },
    "wind" : {
      "speed" : 4.2800000000000002,
      "deg" : 113,
      "gust" : 10.93
    },
    "dt" : 1639245600,
    "dt_txt" : "2021-12-11 18:00:00",
    "main" : {
      "humidity" : 58,
      "feels_like" : -11.4,
      "temp_min" : -5.6100000000000003,
      "temp_max" : -5.6100000000000003,
      "temp" : -5.6100000000000003,
      "pressure" : 1039,
      "temp_kf" : 0,
      "sea_level" : 1039,
      "grnd_level" : 1022
    },
    "weather" : [
      {
        "id" : 802,
        "main" : "Clouds",
        "icon" : "03n",
        "description" : "переменная облачность"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 99
    },
    "wind" : {
      "speed" : 4.4299999999999997,
      "deg" : 125,
      "gust" : 11.81
    },
    "dt" : 1639256400,
    "dt_txt" : "2021-12-11 21:00:00",
    "main" : {
      "humidity" : 58,
      "feels_like" : -11.210000000000001,
      "temp_min" : -5.3600000000000003,
      "temp_max" : -5.3600000000000003,
      "temp" : -5.3600000000000003,
      "pressure" : 1040,
      "temp_kf" : 0,
      "sea_level" : 1040,
      "grnd_level" : 1023
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 99
    },
    "wind" : {
      "speed" : 4.1900000000000004,
      "deg" : 123,
      "gust" : 11.140000000000001
    },
    "dt" : 1639267200,
    "dt_txt" : "2021-12-12 00:00:00",
    "main" : {
      "humidity" : 64,
      "feels_like" : -11.44,
      "temp_min" : -5.7000000000000002,
      "temp_max" : -5.7000000000000002,
      "temp" : -5.7000000000000002,
      "pressure" : 1041,
      "temp_kf" : 0,
      "sea_level" : 1041,
      "grnd_level" : 1024
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 4.4100000000000001,
      "deg" : 128,
      "gust" : 11.390000000000001
    },
    "dt" : 1639278000,
    "dt_txt" : "2021-12-12 03:00:00",
    "main" : {
      "humidity" : 66,
      "feels_like" : -11.640000000000001,
      "temp_min" : -5.7199999999999998,
      "temp_max" : -5.7199999999999998,
      "temp" : -5.7199999999999998,
      "pressure" : 1041,
      "temp_kf" : 0,
      "sea_level" : 1041,
      "grnd_level" : 1024
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04n",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "n"
    },
    "visibility" : 10000
  },
  {
    "clouds" : {
      "all" : 100
    },
    "wind" : {
      "speed" : 4.4199999999999999,
      "deg" : 130,
      "gust" : 11.699999999999999
    },
    "dt" : 1639288800,
    "dt_txt" : "2021-12-12 06:00:00",
    "main" : {
      "humidity" : 65,
      "feels_like" : -11.5,
      "temp_min" : -5.5999999999999996,
      "temp_max" : -5.5999999999999996,
      "temp" : -5.5999999999999996,
      "pressure" : 1042,
      "temp_kf" : 0,
      "sea_level" : 1042,
      "grnd_level" : 1025
    },
    "weather" : [
      {
        "id" : 804,
        "main" : "Clouds",
        "icon" : "04d",
        "description" : "пасмурно"
      }
    ],
    "pop" : 0,
    "sys" : {
      "pod" : "d"
    },
    "visibility" : 10000
  }
],
"city" : {
  "sunset" : 1638882007,
  "country" : "RU",
  "id" : 484646,
  "coord" : {
    "lat" : 52.7211,
    "lon" : 41.451799999999999
  },
  "population" : 290933,
  "timezone" : 10800,
  "sunrise" : 1638853890,
  "name" : "Тамбов"
}
}
"""

static let jsonData = JSONWeatherData(list: [WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 600, main: "Snow", description: "небольшой снег", icon: "13d")], main: WeatherApp.MainWeatherInfo(temp: -0.9, feelsLike: -7.33, tempMin: -0.9, tempMax: -0.3, pressure: 1021, humidity: 87), wind: WeatherApp.Wind(speed: 7.6), dt: 1638867600.0, dtText: "2021-12-07 09:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 501, main: "Rain", description: "дождь", icon: "10d")], main: WeatherApp.MainWeatherInfo(temp: -0.16, feelsLike: -6.35, tempMin: -0.16, tempMax: 0.36, pressure: 1020, humidity: 91), wind: WeatherApp.Wind(speed: 7.54), dt: 1638878400.0, dtText: "2021-12-07 12:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 500, main: "Rain", description: "небольшой дождь", icon: "10n")], main: WeatherApp.MainWeatherInfo(temp: 1.37, feelsLike: -4.51, tempMin: 1.37, tempMax: 1.37, pressure: 1018, humidity: 95), wind: WeatherApp.Wind(speed: 7.91), dt: 1638889200.0, dtText: "2021-12-07 15:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 500, main: "Rain", description: "небольшой дождь", icon: "10n")], main: WeatherApp.MainWeatherInfo(temp: 1.84, feelsLike: -3.85, tempMin: 1.84, tempMax: 1.84, pressure: 1017, humidity: 96), wind: WeatherApp.Wind(speed: 7.77), dt: 1638900000.0, dtText: "2021-12-07 18:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: 2.48, feelsLike: -2.75, tempMin: 2.48, tempMax: 2.48, pressure: 1018, humidity: 96), wind: WeatherApp.Wind(speed: 7.07), dt: 1638910800.0, dtText: "2021-12-07 21:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: 2.68, feelsLike: -2.12, tempMin: 2.68, tempMax: 2.68, pressure: 1017, humidity: 93), wind: WeatherApp.Wind(speed: 6.17), dt: 1638921600.0, dtText: "2021-12-08 00:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: 2.4, feelsLike: -2.27, tempMin: 2.4, tempMax: 2.4, pressure: 1017, humidity: 93), wind: WeatherApp.Wind(speed: 5.7), dt: 1638932400.0, dtText: "2021-12-08 03:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: 2.18, feelsLike: -2.4, tempMin: 2.18, tempMax: 2.18, pressure: 1018, humidity: 91), wind: WeatherApp.Wind(speed: 5.41), dt: 1638943200.0, dtText: "2021-12-08 06:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: 3.23, feelsLike: -0.98, tempMin: 3.23, tempMax: 3.23, pressure: 1017, humidity: 90), wind: WeatherApp.Wind(speed: 5.21), dt: 1638954000.0, dtText: "2021-12-08 09:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: 2.93, feelsLike: -0.78, tempMin: 2.93, tempMax: 2.93, pressure: 1017, humidity: 91), wind: WeatherApp.Wind(speed: 4.16), dt: 1638964800.0, dtText: "2021-12-08 12:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: 1.95, feelsLike: -1.72, tempMin: 1.95, tempMax: 1.95, pressure: 1017, humidity: 93), wind: WeatherApp.Wind(speed: 3.75), dt: 1638975600.0, dtText: "2021-12-08 15:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: 2.0, feelsLike: -1.64, tempMin: 2.0, tempMax: 2.0, pressure: 1017, humidity: 95), wind: WeatherApp.Wind(speed: 3.72), dt: 1638986400.0, dtText: "2021-12-08 18:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: 1.96, feelsLike: -1.67, tempMin: 1.96, tempMax: 1.96, pressure: 1017, humidity: 96), wind: WeatherApp.Wind(speed: 3.69), dt: 1638997200.0, dtText: "2021-12-08 21:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: 1.67, feelsLike: -1.66, tempMin: 1.67, tempMax: 1.67, pressure: 1017, humidity: 95), wind: WeatherApp.Wind(speed: 3.21), dt: 1639008000.0, dtText: "2021-12-09 00:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: 1.34, feelsLike: -1.79, tempMin: 1.34, tempMax: 1.34, pressure: 1017, humidity: 96), wind: WeatherApp.Wind(speed: 2.88), dt: 1639018800.0, dtText: "2021-12-09 03:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: 1.15, feelsLike: -1.27, tempMin: 1.15, tempMax: 1.15, pressure: 1018, humidity: 95), wind: WeatherApp.Wind(speed: 2.13), dt: 1639029600.0, dtText: "2021-12-09 06:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: 2.07, feelsLike: 0.2, tempMin: 2.07, tempMax: 2.07, pressure: 1018, humidity: 89), wind: WeatherApp.Wind(speed: 1.8), dt: 1639040400.0, dtText: "2021-12-09 09:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: 2.01, feelsLike: 0.35, tempMin: 2.01, tempMax: 2.01, pressure: 1019, humidity: 90), wind: WeatherApp.Wind(speed: 1.63), dt: 1639051200.0, dtText: "2021-12-09 12:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: 1.36, feelsLike: -1.32, tempMin: 1.36, tempMax: 1.36, pressure: 1020, humidity: 93), wind: WeatherApp.Wind(speed: 2.41), dt: 1639062000.0, dtText: "2021-12-09 15:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: 0.59, feelsLike: -3.41, tempMin: 0.59, tempMax: 0.59, pressure: 1021, humidity: 96), wind: WeatherApp.Wind(speed: 3.79), dt: 1639072800.0, dtText: "2021-12-09 18:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -0.44, feelsLike: -4.89, tempMin: -0.44, tempMax: -0.44, pressure: 1023, humidity: 93), wind: WeatherApp.Wind(speed: 4.1), dt: 1639083600.0, dtText: "2021-12-09 21:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -1.51, feelsLike: -6.43, tempMin: -1.51, tempMax: -1.51, pressure: 1024, humidity: 90), wind: WeatherApp.Wind(speed: 4.42), dt: 1639094400.0, dtText: "2021-12-10 00:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -3.46, feelsLike: -8.83, tempMin: -3.46, tempMax: -3.46, pressure: 1025, humidity: 91), wind: WeatherApp.Wind(speed: 4.4), dt: 1639105200.0, dtText: "2021-12-10 03:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: -3.86, feelsLike: -9.41, tempMin: -3.86, tempMax: -3.86, pressure: 1028, humidity: 86), wind: WeatherApp.Wind(speed: 4.51), dt: 1639116000.0, dtText: "2021-12-10 06:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: -2.6, feelsLike: -7.99, tempMin: -2.6, tempMax: -2.6, pressure: 1028, humidity: 64), wind: WeatherApp.Wind(speed: 4.73), dt: 1639126800.0, dtText: "2021-12-10 09:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: -2.76, feelsLike: -7.58, tempMin: -2.76, tempMax: -2.76, pressure: 1029, humidity: 63), wind: WeatherApp.Wind(speed: 3.88), dt: 1639137600.0, dtText: "2021-12-10 12:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -4.23, feelsLike: -9.63, tempMin: -4.23, tempMax: -4.23, pressure: 1031, humidity: 71), wind: WeatherApp.Wind(speed: 4.19), dt: 1639148400.0, dtText: "2021-12-10 15:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 803, main: "Clouds", description: "облачно с прояснениями", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -4.72, feelsLike: -10.04, tempMin: -4.72, tempMax: -4.72, pressure: 1032, humidity: 73), wind: WeatherApp.Wind(speed: 3.95), dt: 1639159200.0, dtText: "2021-12-10 18:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 800, main: "Clear", description: "ясно", icon: "01n")], main: WeatherApp.MainWeatherInfo(temp: -5.25, feelsLike: -10.31, tempMin: -5.25, tempMax: -5.25, pressure: 1033, humidity: 72), wind: WeatherApp.Wind(speed: 3.51), dt: 1639170000.0, dtText: "2021-12-10 21:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 800, main: "Clear", description: "ясно", icon: "01n")], main: WeatherApp.MainWeatherInfo(temp: -5.8, feelsLike: -10.82, tempMin: -5.8, tempMax: -5.8, pressure: 1034, humidity: 72), wind: WeatherApp.Wind(speed: 3.35), dt: 1639180800.0, dtText: "2021-12-11 00:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 800, main: "Clear", description: "ясно", icon: "01n")], main: WeatherApp.MainWeatherInfo(temp: -6.28, feelsLike: -11.86, tempMin: -6.28, tempMax: -6.28, pressure: 1034, humidity: 71), wind: WeatherApp.Wind(speed: 3.84), dt: 1639191600.0, dtText: "2021-12-11 03:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 800, main: "Clear", description: "ясно", icon: "01d")], main: WeatherApp.MainWeatherInfo(temp: -6.31, feelsLike: -12.09, tempMin: -6.31, tempMax: -6.31, pressure: 1035, humidity: 68), wind: WeatherApp.Wind(speed: 4.07), dt: 1639202400.0, dtText: "2021-12-11 06:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 800, main: "Clear", description: "ясно", icon: "01d")], main: WeatherApp.MainWeatherInfo(temp: -3.68, feelsLike: -9.51, tempMin: -3.68, tempMax: -3.68, pressure: 1036, humidity: 52), wind: WeatherApp.Wind(speed: 4.98), dt: 1639213200.0, dtText: "2021-12-11 09:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 800, main: "Clear", description: "ясно", icon: "01d")], main: WeatherApp.MainWeatherInfo(temp: -3.57, feelsLike: -8.59, tempMin: -3.57, tempMax: -3.57, pressure: 1036, humidity: 53), wind: WeatherApp.Wind(speed: 3.9), dt: 1639224000.0, dtText: "2021-12-11 12:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 801, main: "Clouds", description: "небольшая облачность", icon: "02n")], main: WeatherApp.MainWeatherInfo(temp: -5.04, feelsLike: -10.8, tempMin: -5.04, tempMax: -5.04, pressure: 1037, humidity: 58), wind: WeatherApp.Wind(speed: 4.41), dt: 1639234800.0, dtText: "2021-12-11 15:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 802, main: "Clouds", description: "переменная облачность", icon: "03n")], main: WeatherApp.MainWeatherInfo(temp: -5.61, feelsLike: -11.4, tempMin: -5.61, tempMax: -5.61, pressure: 1039, humidity: 58), wind: WeatherApp.Wind(speed: 4.28), dt: 1639245600.0, dtText: "2021-12-11 18:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -5.36, feelsLike: -11.21, tempMin: -5.36, tempMax: -5.36, pressure: 1040, humidity: 58), wind: WeatherApp.Wind(speed: 4.43), dt: 1639256400.0, dtText: "2021-12-11 21:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -5.7, feelsLike: -11.44, tempMin: -5.7, tempMax: -5.7, pressure: 1041, humidity: 64), wind: WeatherApp.Wind(speed: 4.19), dt: 1639267200.0, dtText: "2021-12-12 00:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -5.72, feelsLike: -11.64, tempMin: -5.72, tempMax: -5.72, pressure: 1041, humidity: 66), wind: WeatherApp.Wind(speed: 4.41), dt: 1639278000.0, dtText: "2021-12-12 03:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.Weather(id: 804, main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: -5.6, feelsLike: -11.5, tempMin: -5.6, tempMax: -5.6, pressure: 1042, humidity: 65), wind: WeatherApp.Wind(speed: 4.42), dt: 1639288800.0, dtText: "2021-12-12 06:00:00")], city: WeatherApp.City(name: "Тамбов", coord: WeatherApp.Coordinates(lat: 52.7211, lon: 41.4518)))

}
