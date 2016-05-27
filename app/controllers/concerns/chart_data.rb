module ChartData
  extend ActiveSupport::Concern

  module ClassMethods
    def generate_data(parameters)
      labels, height, weight, neck, shoulders, chest, biceps, forearm, waist, hip, thigh, calf  =
          [], [], [], [], [], [], [], [], [], [], [], []
      parameters.each do |param|
        labels << param.date
        height << param.height
        weight << param.weight
        neck << param.neck
        shoulders << param.shoulders
        chest << param.chest
        biceps << param.biceps
        forearm << param.forearm
        waist << param.waist
        hip << param.hip
        thigh << param.thigh
        calf << param.calf
      end
      standard = {
          fill: false,
          lineTension: 0.1,
          borderCapStyle: 'butt',
          borderDash: [],
          borderDashOffset: 0.0,
          borderJoinStyle: 'miter',
          pointBackgroundColor: '#fff',
          pointBorderWidth: 1,
          pointHoverRadius: 5,
          pointHoverBorderColor: 'rgba(220,220,220,1)',
          pointHoverBorderWidth: 2,
          pointRadius: 1,
          pointHitRadius: 10,
      }
      data = {
          labels: labels,
          datasets: [
              {
                  label: 'Ріст',
                  backgroundColor: 'rgba(75,192,192,0.4)',
                  borderColor: 'rgba(75,192,192,1)',
                  pointBorderColor: 'rgba(75,192,192,1)',
                  pointHoverBackgroundColor: 'rgba(75,192,192,1)',
                  data: height
              },
              {
                  label: 'Вага',
                  backgroundColor: 'rgba(45, 0, 80, 0.6)',
                  borderColor: 'rgba(45, 0,80, 0.6)',
                  pointBorderColor: 'rgba(100, 215,255, 0.6)',
                  pointHoverBackgroundColor: 'rgba(45, 0,80, 0.6)',
                  data: weight
              },
              {
                  label: 'Шия',
                  backgroundColor: 'rgba(110, 80, 0, 0.6)',
                  borderColor: 'rgba(110, 80, 0, 0.6)',
                  pointBorderColor: 'rgba(110, 80, 0, 0.6)',
                  pointHoverBackgroundColor: 'rgba(110, 80, 0, 1)',
                  data: neck
              },
              {
                  label: 'Плечі',
                  backgroundColor: 'rgba(210, 110, 10, 0.6)',
                  borderColor: 'rgba(210, 110, 10, 0.6)',
                  pointBorderColor: 'rgba(210, 110, 10, 0.6)',
                  pointHoverBackgroundColor: 'rgba(210, 110, 10, 1)',
                  data: shoulders
              },
              {
                  label: 'Груди',
                  backgroundColor: 'rgba(255, 0, 0, 0.6)',
                  borderColor: 'rgba(255, 0, 0, 0.6)',
                  pointBorderColor: 'rgba(255, 0, 0, 0.6)',
                  pointHoverBackgroundColor: 'rgba(255, 0, 0, 1)',
                  data: chest
              },
              {
                  label: 'Біцепс',
                  backgroundColor: 'rgba(0, 255, 0, 0.6)',
                  borderColor: 'rgba(0, 255, 0, 0.6)',
                  pointBorderColor: 'rgba(0, 255, 0, 0.6)',
                  pointHoverBackgroundColor: 'rgba(0, 255, 0, 1)',
                  data: biceps
              },
              {
                  label: 'Передпліччя',
                  backgroundColor: 'rgba(255, 90, 255, 0.6)',
                  borderColor: 'rgba(255, 90, 255, 0.6)',
                  pointBorderColor: 'rgba(255, 90, 255, 0.6)',
                  pointHoverBackgroundColor: 'rgba(255, 90, 255, 1)',
                  data: forearm
              },
              {
                  label: 'Талія',
                  backgroundColor: 'rgba(100, 100, 200, 0.6)',
                  borderColor: 'rgba(100, 100, 200, 0.6)',
                  pointBorderColor: 'rgba(100, 100, 200, 0.6)',
                  pointHoverBackgroundColor: 'rgba(100, 100, 200, 1)',
                  data: waist
              },
              {
                  label: 'Бедра',
                  backgroundColor: 'rgba(0, 0, 255, 0.6)',
                  borderColor: 'rgba(0, 0, 255, 0.6)',
                  pointBorderColor: 'rgba(0, 0, 255, 0.6)',
                  pointHoverBackgroundColor: 'rgba(0, 0, 255, 1)',
                  data: hip
              },
              {
                  label: 'Стегно',
                  backgroundColor: 'rgba(0, 0, 0, 0.6)',
                  borderColor: 'rgba(0, 0, 0, 0.6)',
                  pointBorderColor: 'rgba(0, 0, 0, 0.6)',
                  pointHoverBackgroundColor: 'rgba(0, 0, 0, 1)',
                  data: thigh
              },
              {
                  label: 'Литка',
                  backgroundColor: 'rgba(255, 130, 0, 0.8)',
                  borderColor: 'rgba(255, 130, 0, 0.8)',
                  pointBorderColor: 'rgba(255, 130, 0, 0.8)',
                  pointHoverBackgroundColor: 'rgba(255, 130, 0, 1)',
                  data: calf
              }
          ]
      }
      data[:datasets].each do |set|
        set.merge!(standard)
      end
      data
    end
  end
end