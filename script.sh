`` #!/bin/bash

# Array of eight-ball answers
answers=("Yes" "No" "Maybe" "Ask again later" "Cannot predict now" "You are a skid")

# Function to generate a random rainbow color ANSI code
random_rainbow_color() {
  # Array of rainbow colors
  rainbow_colors=("31" "33" "32" "36" "34" "35")  # ANSI color codes for rainbow colors
  # Generate a random index for the rainbow color
  index=$((RANDOM % ${#rainbow_colors[@]}))
  # Get the ANSI color code at the random index
  color_code="${rainbow_colors[index]}"
  echo "$color_code"
}

# Function to shake the eight-ball and get a random answer
shake_eight_ball() {
  # Generate a random index for the answer
  index=$((RANDOM % ${#answers[@]}))
  # Get the answer at the random index
  answer="${answers[index]}"

  # Get a random rainbow color ANSI code
  color_code=$(random_rainbow_color)

  # Print the answer in the rainbow color
  echo -e "\e[${color_code}m$answer\e[0m"
}

# Display a welcome message
echo "Welcome to  Magic Eight-Ball! Ask your yes-or-no questions."

# Main loop to handle user questions
while true; do
  # Prompt the user for a question
  read -p "Your question (or press Enter to quit): " question

  # Check if the user entered a question
  if [ -z "$question" ]; then
    echo "Goodbye!"
    break
  fi

  # Shake the eight-ball and get a rainbow-colored answer
  magic_answer=$(shake_eight_ball)
  echo "Magic Eight-Ball says: $magic_answer"
done
``
