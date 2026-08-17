defmodule DummyAsh.Projects do
  use Ash.Domain,
    otp_app: :dummyash

  resources do
    resource DummyAsh.Projects.Project
    resource DummyAsh.Projects.Task
  end
end
