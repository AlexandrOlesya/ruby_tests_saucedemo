# ruby_tests_saucedemo
To run all tests, use the command:
rspec name_folder 

To run a specific spec:
rspec name_file.rb

To run a specific test:
rspec name_file.rb:(line number)

To save logs in json format :
rspec name --format json  > results.json


Git flow:

git branch //make sure you're in the main
git pull
git checkout -b new_branch_name

Add change for project

git add .
git commit -m "Comment"
git push --set-upstream origin new_branch_name

git checkout main
git pull

For UI github:

create pull requests
add me for review

after rewiev:

merge
delete branch

For debugging

binding.pry // for breakpoint
