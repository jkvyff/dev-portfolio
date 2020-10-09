3.times do |topicNum|
  Topic.create!(
    title: "Topic #{topicNum}"
  )
end

puts "3 Topics created"


10.times do |blogNum|
  Blog.create!(
    title: "My Blog Post number #{blogNum}",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    topic_id: Topic.last.id
  )
end

puts "10 blog posts created"


4.times do |skillNum|
  Skill.create!(
    title: "Rails #{skillNum}",
    percent_utilized: 25 
  )
end

puts "4 skills created"


7.times do |projectNum|
  Project.create!(
    title: "Project Number: #{projectNum}",
    subtitle: "Ruby on Rails",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident",
    main_image: "https://placehold.it/600x400",
    thumb_image: "https://placehold.it/350x200"
  )
end

2.times do |projectNum|
  Project.create!(
    title: "Project Number: #{projectNum + 7}",
    subtitle: "Node js",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident",
    main_image: "https://placehold.it/700x400",
    thumb_image: "https://placehold.it/350x200"
  )
end

puts "9 projects created"