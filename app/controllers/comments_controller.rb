# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_comment

  def new
    @message = Message.find(params[:id])
    @comment = Comment.new
  end

  def create
    @comment.comments.build(comment_params)
    if @comment.save
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end

  def find_comment
    @comment = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @comment = Message.find_by_id(params[:message_id]) if params[:message_id]
  end
end
