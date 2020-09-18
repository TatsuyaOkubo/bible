class TrashChannel < ApplicationCable::Channel
  def subscribed
    stream_from "trash_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
