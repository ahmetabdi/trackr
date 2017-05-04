web: bin/rails server -p $PORT -e $RAILS_ENV
worker: sidekiq -c $RAILS_MAX_THREADS -q default -q mailers -q low_priority,1 -q high_priority,2
