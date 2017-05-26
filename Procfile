web: bin/rails s -p 3000 -b '0.0.0.0'
worker: sidekiq -c $RAILS_MAX_THREADS -q default -q mailers -q low_priority,1 -q high_priority,2
