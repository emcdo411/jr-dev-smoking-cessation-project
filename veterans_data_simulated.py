import json
import os
import random
from datetime import datetime, timedelta

# Hardcoded coaching tips
COACHING_TIPS = [
    "Consider setting small, achievable goals to reduce cigarette use.",
    "Try nicotine replacement therapy to ease withdrawal symptoms.",
    "Engage in physical activities to manage stress and cravings.",
    "Join a support group to share experiences and stay motivated."
]

# Generate simulated data for 10 veterans
def generate_veteran_data(num_records=10):
    statuses = ["Active", "Quit", "In Progress", "Relapsed"]
    data = []
    for i in range(1, num_records + 1):
        record = {
            "id": i,
            "name": f"Veteran {chr(64 + i)}",
            "age": random.randint(40, 55),
            "enrollment_date": (datetime.now() - timedelta(days=random.randint(30, 365))).strftime("%Y-%m-%d"),
            "progress_score": random.randint(10, 100),
            "smoking_status": random.choice(statuses),
            "coaching_notes": random.choice(COACHING_TIPS)
        }
        data.append(record)
    return data

# Validate data for missing fields
def validate_data(data):
    required_fields = ["id", "name", "age", "enrollment_date", "progress_score", "smoking_status", "coaching_notes"]
    for record in data:
        for field in required_fields:
            if field not in record:
                raise ValueError(f"Missing field '{field}' in record {record.get('id', 'unknown')}")
    return True

# Save data to JSON file
def save_to_json(data, output_path):
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, 'w') as f:
        json.dump(data, f, indent=4)
    print(f"✅ JSON created at: {output_path}")

if __name__ == "__main__":
    project_path = "C:/Users/Veteran/Documents/VaSmokingCessationApp"  # Replace with user input
    output_file = os.path.join(project_path, "data", "veterans_data.json")
    try:
        veteran_data = generate_veteran_data()
        validate_data(veteran_data)
        save_to_json(veteran_data, output_file)
    except Exception as e:
        print(f"❌ Error: {str(e)}")
