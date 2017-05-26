web: puma -C config/puma.rb
worker: sidekiq -c $RAILS_MAX_THREADS -q default -q mailers -q low_priority,1 -q high_priority,2
