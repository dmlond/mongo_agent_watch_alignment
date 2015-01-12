FROM dmlond/mongo_agent_alignment
MAINTAINER Darin London <darin.london@duke.edu>

USER root
ADD watch_alignment.rb /usr/local/bin/watch_alignment.rb
RUN ["chmod", "777", "/usr/local/bin/watch_alignment.rb"]
USER bwa_user
CMD ["/usr/local/bin/watch_alignment.rb"]
