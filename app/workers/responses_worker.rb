class ResponsesWorker 
include Sidekiq::Worker


def perform(test_file)
  binding.pry
  @test = Test.create(test_params)
end



end