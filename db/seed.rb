category = Dmap::Category.new(
	:name 				=>	"Main"
)
category.save

post = Dmap::Post.new(
	:category_id		=> category.id,
	:user_id 			=> 1,
	:user_type			=> "SimpleUser::User",
	:title				=> "Hello, world!",
	:description 		=> "This is your first post, welcome aboard!",
	:description_short	=> "This is your first post",
	:active				=> true,
	:published_at		=> Time.now()

)
post.save