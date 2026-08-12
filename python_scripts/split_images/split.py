import os
from PIL import Image

OUTPUT_DIR = "splits"
def split_image(image_path, split_direction="vertical"):
    # Open the image
    img = Image.open(image_path)
    width, height = img.size

    if split_direction == "vertical":
        # Define bounding boxes for left and right halves
        left_half = img.crop((0, 0, width // 2, height))
        right_half = img.crop((width // 2, 0, width, height))
        
        right_name = f"{image_path}_right.png"
        left_name = f"{image_path}_left.png"
        
        # Save the pieces
        left_half.save(f"{OUTPUT_DIR}/{right_name}")
        right_half.save(f"{OUTPUT_DIR}/{left_name}")
        print(f"Image {image_path} split into {right_name} and {left_name}.")

if __name__ == "__main__":
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    og_files = [f for f in os.listdir("./") if f.lower().endswith(".jpg")]
    for file in og_files:
        split_image(file)