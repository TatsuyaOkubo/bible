class DisplayChannel < ApplicationCable::Channel
  def subscribed
    stream_from "display_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
