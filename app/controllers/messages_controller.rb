class MessagesController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @user = current_user
    @message = Message.new(message_params)
    @message.user = @user
    @message.project = @project
    if @message.save
      ProjectChannel.broadcast_to(
        @project,
        render_to_string(partial: "message", locals: {message: @message})
      )
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
