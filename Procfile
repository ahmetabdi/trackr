web: puma -C config/puma.rb
worker: sidekiq -c 10 -q default -q mailers -q low_priority,1 -q high_priority,2
