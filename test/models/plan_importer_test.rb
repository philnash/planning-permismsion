require 'test_helper'

class PlanImporterTest < ActiveSupport::TestCase
  test 'it turns a CSV with one line into a Plan' do
    assert_difference 'Plan.count' do
      importer = PlanImporter.new(:path => Rails.root + 'test/fixtures/plan_example.csv')
      importer.import
    end
  end

  test 'it inputs the right data to the object' do
    importer = PlanImporter.new(:path => Rails.root + 'test/fixtures/plan_example.csv')
    importer.import
    plan = Plan.last
    assert_equal '2008/0128', plan.remote_id
    assert_equal '166/168 Stoke Newington High Street London N16 7JL', plan.address
    assert_equal 'Installation of an externally illuminated fascia and projecting hanging sign', plan.description
  end

  test 'it does not duplicate plans' do
    assert_difference 'Plan.count', 1 do
      importer = PlanImporter.new(:path => Rails.root + 'test/fixtures/plan_example.csv')
      2.times { importer.import }
    end
  end
end
