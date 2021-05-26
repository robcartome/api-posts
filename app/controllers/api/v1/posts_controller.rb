# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: %i[show update destroy]
      # GET /posts
      def index
        posts = Post.all
        render json: { status: 'success', data: posts }, status: :ok
      end

      def show
        render json: { status: 'success', data: @post }, status: 200
      end

      def create
        post = Post.new(post_params)
        if post.save
          render json: { status: 'created', data: post }, status:	:created
        else
          render json: { status: 'fail', message: post.errors.full_messages }, status:	422
        end
      end

      def destroy
        @post.destroy
        render json: { status: 'deleted', data: @post }, status:	:ok
      end

      private

      def post_params
        params.require(:post).permit(:name, :description)
      end

      def set_post
        @post = Post.find(params[:id])
      end
    end
  end
end
