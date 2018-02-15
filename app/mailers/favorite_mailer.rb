class FavoriteMailer < ApplicationMailer

    default from: "mlopez@fundacionidea.org.mx"

    def new_comment(user, post, comment)
        headers["Message-ID"] = "<comments/#{comment.id}@my_bloccit.com"
        headers["In-Reply-To"] = "<post/#{post.id}@my_bloccit.com"
        headers["References"] = "<post/#{post.id}@my_bloccit.com"
        @user = user
        @post = post
        @comment = comment
        mail(to: user.email, subject: "New comment on #{post.title}")
    end

    def new_post(user, post)
        headers["Message-ID"] = "<post/#{post.id}@my_bloccit.com>"
        headers["In-Reply-To"] = "<post/#{post.id}@my_bloccit.com>"
        headers["References"] = "<post/#{post.id}@my_bloccit.com>"
        @user = user
        @post = post
        mail(to: user.email, subject: "You have automatically favorited, and are following, your post titled #{post.title}")
    end

end
