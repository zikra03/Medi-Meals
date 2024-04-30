from flask import Flask, request, jsonify
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import random
import requests
from PIL import Image
from fpdf import FPDF
import os

app = Flask(__name__)

# Load the clinical dataset
clinical_data = pd.read_excel('clinical.xlsx')

# Map categorical GI values to numerical values in clinical dataset
gi_mapping = {'Low': 1, 'Moderate': 2, 'High': 3}
clinical_data['GI'] = clinical_data['GI'].map(gi_mapping)

# Fill missing values with the mean
clinical_data['GI'] = clinical_data['GI'].fillna(clinical_data['GI'].mean())

# Concatenate relevant columns into a single feature
clinical_data['features'] = clinical_data.astype(str).agg(' '.join, axis=1)

# Initialize the TF-IDF Vectorizer for clinical data
tfidf_vectorizer_clinical = TfidfVectorizer()

# Fit and transform the feature for clinical data
tfidf_matrix_clinical = tfidf_vectorizer_clinical.fit_transform(clinical_data['features'])

# Load the food dataset
food_data = pd.read_excel('Food Dataset.xlsx')

#  Map categorical GI values to numerical values in food dataset
food_data['GI'] = food_data['GI'].map(gi_mapping)

# Fill missing values with an empty string
food_data['GI'] = food_data['GI'].fillna('')

# Convert 'GI' column to string type
food_data['GI'] = food_data['GI'].astype(str)

# Concatenate relevant columns into a single feature
food_data['features'] = food_data['Meal Type'] + ' ' + food_data['Preference'] + ' ' + food_data['Allergy'] + ' ' + food_data['GI']

# Initialize the TF-IDF Vectorizer for food data
tfidf_vectorizer_food = TfidfVectorizer(vocabulary=tfidf_vectorizer_clinical.vocabulary_)

# Fit and transform the feature for food data
tfidf_matrix_food = tfidf_vectorizer_food.fit_transform(food_data['features'])

# Calculate cosine similarity between clinical data and food data
cosine_similarities = cosine_similarity(tfidf_matrix_clinical, tfidf_matrix_food)

# Get indices of similar dishes for each clinical data point
similar_indices_clinical = [list(similarities.argsort()[-20:][::-1]) for similarities in cosine_similarities]

def recommend_dish(user_input):
    # Transform user input using TF-IDF Vectorizer
    user_tfidf = tfidf_vectorizer_clinical.transform([user_input])

    # Calculate cosine similarity between user input and all dishes in food dataset
    similarity_scores_food = cosine_similarity(user_tfidf, tfidf_matrix_food)

    # Get indices of similar dishes
    similar_indices_food = similarity_scores_food.argsort()[0][-20:][::-1]  # Top 20 similar dishes from food dataset

    # Get recommendations from selected dishes
    recommended_dishes_info = food_data.iloc[similar_indices_food][['Dish Name', 'Carbs', 'Protein', 'Fats', 'Fiber', 'Calories', 'Image']].values.tolist()

    return recommended_dishes_info

# Function to generate a PDF of the weekly diet plan
def generate_pdf(weekly_diet_plan):
    pdf = FPDF()
    pdf.set_auto_page_break(auto=True, margin=15)
    pdf.set_font("Arial", size=12)

    # Colors for days
    colors = {'Monday': (255, 255, 0), 'Tuesday': (255, 165, 0), 'Wednesday': (255, 69, 0),
              'Thursday': (255, 0, 0), 'Friday': (128, 0, 128), 'Saturday': (0, 0, 255), 'Sunday': (0, 128, 0)}

    for day, meals in weekly_diet_plan.items():
        pdf.add_page()

        # Set background color for the day
        pdf.set_fill_color(*colors[day])

        # Add day header
        pdf.set_font("Arial", size=16)
        pdf.cell(200, 10, txt=f"{day} Diet Plan", ln=True, align='C', fill=True)

        # Set font for dish details
        pdf.set_font("Arial", size=12)

        # Add dishes
        for meal, dish in meals.items():
            pdf.ln(10)
            pdf.cell(200, 10, txt=f"{meal}: {dish[0]}", ln=True)
            pdf.cell(200, 10, txt=f"Carbs: {dish[1]}", ln=True)
            pdf.cell(200, 10, txt=f"Protein: {dish[2]}", ln=True)
            pdf.cell(200, 10, txt=f"Fats: {dish[3]}", ln=True)
            pdf.cell(200, 10, txt=f"Fiber: {dish[4]}", ln=True)
            pdf.cell(200, 10, txt=f"Calories: {dish[5]}", ln=True)
            # Download the image and add to PDF
            image_url = dish[6]
            print(f"Downloading image: {image_url}")
            image_path = f"image_{day}_{meal}.jpg"
            response = requests.get(image_url)
            if response.status_code == 200:
                with open(image_path, 'wb') as f:
                    f.write(response.content)
                # Calculate the x-coordinate for the image to be on the right side
                image_width= 50
                image_x = pdf.w - image_width - 10  # Adjust 10 as needed for spacing
                # Add the image to the PDF at the calculated position
                pdf.image(image_path, x=image_x, y=pdf.get_y(), w=image_width)
                os.remove(image_path)
                pdf.ln(10)
            else:
                print(f"Failed to download image: {image_url}")

    pdf.output("weekly_diet_plan.pdf")

# Function to take user input for generating the diet plan
def take_user_input():
    age_options = ['1', '2', '3', '4'] 
    gender_options = ['1', '2']
    hba1c_levels_options = ['1', '2', '3']
    exercise_options = ['1', '2', '3']
    glucose_level_options = ['1', '2', '3']
    allergy_options = ['1', '2', '3', '4', '5', '6']
    preference_options = ['1', '2', '3', '4']

    age = input("Enter your age(1 for 15-30,2 for 31-45,3 for 46-60,4 for 60 above): ").strip()
    gender = input("Enter your gender (1 for Male, 2 for Female): ").strip()
    hba1c_levels = input("Enter your HbA1c level (1 for Below 5.7%, 2 for 5.7% to 6.4%, 3 for 6.5% or higher): ").strip()
    exercise = input("Enter your exercise frequency (1 for Daily, 2 for Moderate (3-4 days/week), 3 for No Exercise): ").strip()
    glucose_level = input("How often does your glucose level go high? (1 for Frequently, 2 for Often, 3 for Rarely): ").strip()
    allergy = input("Enter your allergy (1 for Gluten, 2 for Dairy, 3 for Nuts, 4 for Seafood, 5 for Egg, 6 for No Allergy): ").strip()
    preference = input("Enter your preference (1 for Veg, 2 for NonVeg, 3 for Vegan, 4 for Jain): ").strip()

    user_input = f"{age} {gender} {hba1c_levels} {exercise} {glucose_level} {allergy} {preference}"

    return user_input

# Function to recommend a weekly diet plan
def recommend_weekly_diet(user_input):
    # Define the preferences and requirements for each day of the week
    weekly_plan = {
        'Monday': 'Breakfast,Lunch,Dinner',
        'Tuesday': 'Breakfast,Lunch,Dinner',
        'Wednesday': 'Breakfast,Lunch,Dinner',
        'Thursday': 'Breakfast,Lunch,Dinner',
        'Friday': 'Breakfast,Lunch,Dinner',
        'Saturday': 'Breakfast,Lunch,Dinner',
        'Sunday': 'Breakfast,Lunch,Dinner',
    }

    # Initialize an empty diet plan for the week
    weekly_diet_plan = {}

    # Generate diet plan for each day of the week
    for day, meals in weekly_plan.items():
        meals = meals.split(',')
        daily_dishes = {}
        for meal in meals:
            # Get recommendations based on user inputs for the current day and meal
            user_input_meal = f"{user_input} {meal} No Preference No Allergy"
            recommended_dishes = recommend_dish(user_input_meal)
            # Randomly select one dish from recommendations
            selected_dish = random.choice(recommended_dishes) if recommended_dishes else ['No dish found', '', '', '', '', '', '']
            daily_dishes[meal] = selected_dish

        # Add daily diet plan to the weekly diet plan
        weekly_diet_plan[day] = daily_dishes

    return weekly_diet_plan

@app.route('/recommend-diet', methods=['POST'])
def recommend_diet():
    user_input = request.json  # Get user input from JSON request
    weekly_diet_plan = recommend_weekly_diet(user_input)
    return jsonify(weekly_diet_plan)  # Return recommended diet plan as JSON response

if __name__ == '__main__':
    app.run(debug=True)  # Run the app in debug mode
