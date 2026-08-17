defmodule DummyAsh.Projects.Task do
  use Ash.Resource,
    otp_app: :dummyash,
    domain: DummyAsh.Projects,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "tasks"
    repo Dummyash.Repo
  end

  actions do
    defaults [:read, create: [:title, :description]]
  end

  attributes do
    uuid_primary_key :id

    attribute :title, :string do
      allow_nil? false
      public? true
    end

    attribute :description, :string do
      allow_nil? false
      public? true
    end

    timestamps()
  end

  relationships do
    belongs_to :project, DummyAsh.Projects.Project
  end
end
