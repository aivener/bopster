# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	
	User.destroy_all
	Goal.destroy_all
	Report.destroy_all
	Friendship.destroy_all

	salman = User.create(
		email: "salman@ixperience.co.za", 
		password: "12345678", 
		password_confirmation: "12345678", 
		name: "Salman Ansari", 
		age: 29, 
		gender: "male", 
		parent_id: "nil", 
		bio: "Instructor at iXperience, cat lover, ruby enthusiast, and youtube phenom.", 
		role: "parent", 
		avatar: "http://us.cdn4.123rf.com/168nwm/red33/red331301/red33130100068/17223378-cute-baby-triceratops-dinosaur-illustration.jpg")

	ruby = User.create(
		email: "ruby@ixperience.co.za", 
		password: "12345678", 
		password_confirmation: "12345678", 
		name: "Ruby", 
		age: 2, 
		gender: "female", 
		parent_id: salman.id, 
		bio: "The favorite of the iX staff, and the perfect snuggle buddy.", 
		role: "kid", 
		avatar: "http://www.clipartbest.com/cliparts/di8/XKg/di8XKgXie.png")

	cat_friends_goal = Goal.create(
		title: "Make new cat friends", 
		description: "Branch out from the iX community and meet new cats!", 
		kid_id: ruby.id, 
		target: 7, 
		unit: "times", 
		progress: 2, 
		prize: "Extra nap time", 
		status: 0, 
		prize_status: -1)

	toys_goal = Goal.create(
		title: "Play with toys", 
		description: "Enjoy the fun new toys we bought you!", 
		kid_id: ruby.id, 
		target: 10, 
		unit: "times", 
		progress: 5, 
		prize: "Yummy cat treats!", 
		status: 0, 
		prize_status: -1)

	sits_fits_goal = Goal.create(
		title: "See if it fits, then sits", 
		description: "No description necessary.", 
		kid_id: ruby.id, 
		target: 5, 
		unit: "times", 
		progress: 0, 
		prize: "Snuggle with Salman", 
		status: 0, 
		prize_status: -1)

	cat_friends_report_1 = Report.create(
		amount: 4, 
		kid_id: ruby.id, 
		goal_id: cat_friends_goal.id, 
		status: 0)

	cat_friends_report_2 = Report.create(
		amount: 1, 
		kid_id: ruby.id, 
		goal_id: cat_friends_goal.id, 
		status: 0)


	sits_fits_report_1 = Report.create(
		amount: 1, 
		kid_id: ruby.id, 
		goal_id: cat_friends_goal.id, 
		status: 0)



	terry = User.create(
		email: "terry_robertson@mail.com", 
		password: "12345678", 
		password_confirmation: "12345678", 
		name: "Terry Robertson", 
		age: 45, 
		gender: "female", 
		parent_id: "nil", 
		bio: "Works part-time for an accounting business, otherwise loves taking care of her kids and gardening.", 
		role: "parent", 
		avatar: "http://i160.photobucket.com/albums/t165/doomxkitty/dinoblue.png")

	katie = User.create(
		email: "soccerluver776@mail.com", 
		password: "12345678", 
		password_confirmation: "12345678", 
		name: "Katie Robertson", 
		age: 8, 
		gender: "female", 
		parent_id: terry.id, 
		bio: "I love playing soccer and hangin with my friends. School sux.", 
		role: "kid", 
		avatar: "http://us.cdn4.123rf.com/168nwm/blamb/blamb1111/blamb111100019/11431458-a-cute-pink-cartoon-dinosaur.jpg")

	bobby = User.create(
		email: "cooldude45@mail.com", 
		password: "12345678", 
		password_confirmation: "12345678", 
		name: "Bobby Robertson", 
		age: 12, 
		gender: "male", 
		parent_id: terry.id, 
		bio: "Biggest computer games champion out there. No one can compare to me.", 
		role: "kid", 
		avatar: "http://us.cdn4.123rf.com/168nwm/red33/red331301/red33130100068/17223378-cute-baby-triceratops-dinosaur-illustration.jpg")

	read_books_goal = Goal.create(
		title: "Read books", 
		description: "Read a little bit each night so you can finish a book.", 
		kid_id: katie.id, 
		target: 20, 
		unit: "hours", 
		progress: 4, 
		prize: "Extra dessert!", 
		status: 0, 
		prize_status: -1)

	do_homework_goal = Goal.create(
		title: "Finish homework", 
		description: "Do all of your homework before it's due.", 
		kid_id: katie.id, 
		target: 10, 
		unit: "hours", 
		progress: 7, 
		prize: "Later bedtime on Friday!", 
		status: 0, 
		prize_status: -1)

	read_books_report_1 = Report.create(
		amount: 4.5, 
		kid_id: katie.id, 
		goal_id: read_books_goal.id, 
		status: 0)

	do_homework_report_1 = Report.create(
		amount: 2.5, 
		kid_id: katie.id, 
		goal_id: do_homework_goal.id, 
		status: 0)


	go_outside_goal = Goal.create(
		title: "Play outside", 
		description: "Play a sport, ride your bike, run, etc.", 
		kid_id: bobby.id, 
		target: 10, 
		unit: "hours", 
		progress: 3.5, 
		prize: "More computer time on Saturday", 
		status: 0, 
		prize_status: -1)

	go_outside_report_1 = Report.create(
		amount: 0.5, 
		kid_id: bobby.id, 
		goal_id: go_outside_goal.id, 
		status: 0)

	kid_friendship_1 = Friendship.create(
		requester_id: bobby.id,
		receiver_id: katie.id,
		status: "Pending",
		)







