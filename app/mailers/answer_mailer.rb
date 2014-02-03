class AnswerMailer < ActionMailer::Base
  default from: "jefcurtis@gmail.com"

  def notify_owner (comment)
    @comment = comment
    @discussion = comment.discussion
    @sending_user = current_user
    recieving_users = @discussion.user
    mail(to:@user.email, subject: "Your discussion has been completed. #{@discussion.name}" )
  end

end
