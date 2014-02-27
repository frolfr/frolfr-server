desc 'removes seed data'
task clear_seed: [:environment] do
  Hole.destroy_all
  HolePosition.destroy_all
  Course.destroy_all
  Round.destroy_all
  User.destroy_all
  Scorecard.destroy_all
  ScorecardHole.destroy_all 
end
