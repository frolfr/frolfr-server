desc 'removes seed data'
task clear_seed: [:environment] do
  Hole.destroy_all
  Course.destroy_all
  Round.destroy_all
  User.destroy_all
  Scorecard.destroy_all
  Turn.destroy_all 
end
