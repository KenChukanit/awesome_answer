# rails g controller likes --no-assets --no-helper --no-controller-specs --no-views-specs --skip-template-engine
# this controller is generated by using above 👆🏻command
class LikesController < ApplicationController

    def create
        question = Question.find params[:question_id]
        like = Like.new question: question, user: current_user
        if !can?(:like, question)
            flash[:alert] = 'Youcan not ;ike your own question'
        elsif  like.save
            flash[:notice] = 'Questiion liked'
        else   
            flash[:alert] = like.errors.full_messages.join(', ')
        end
        redirect_to question_path(question)
    end
    
    def destroy
        like = current_user.likes.find params[:id]
        if !can?(:destroy, like)
            flash[:alert] = 'You cannott destroy a like you do not own'
        elsif like.destroy
            flash[:notice] = "Question unlike"
        else
            flash[:alert] = "Could not unlike the question"
        end
        redirect_to question_path(like.question)
    end
end