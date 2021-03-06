class CommentsController < ApplicationController
    include CommentsHelper 
    
    def create
        @comment = Comment.new(comment_params)
        @comment.article_id = params[:article_id]
        @comment.save
        redirect_to article_path(@comment.article_id)
    end
    
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        flash.notice = "Comment deleted!"
        redirect_to article_path(@article)
    end
end
