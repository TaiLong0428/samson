# frozen_string_literal: true
class DeleteBadDeployGroupsStages < ActiveRecord::Migration[4.2]
  def up
    DeployGroupsStage.where('stage_id not IN (?)', Stage.pluck(:id)).delete_all
    DeployGroupsStage.where('deploy_group_id not IN (?)', DeployGroup.pluck(:id)).delete_all
  end

  def down
  end
end
