using Images, FileIO

function display_images()
    folder_path = "./data"
    files = readdir(folder_path)

    for image_file in files
        image_path = joinpath(folder_path, image_file)
        image = load(image_path)
        display(image)
    end
end

# Function to load images from a directory
function load_images()
    images = []
    for file in readdir("./data")
        img_path = joinpath(directory, file)
        push!(images, Gray.(load(img_path)))
    end
    return images
end


function load_images_as_tensor(folder_path, num_persons, num_images_per_person)
    # Assuming all images have the same dimensions
    first_image_path = joinpath(folder_path, readdir(folder_path)[1])
    first_image = load(first_image_path)
    img_height, img_width = size(first_image)

    images_tensor = Array{Float32,3}(undef, img_height * img_width, num_images_per_person, num_persons)

    files = readdir(folder_path)

    for (index, file_name) in enumerate(files)
        file_path = joinpath(folder_path, file_name)

        image = load(file_path)
        gray_image = Gray.(image)
        flat_image = reshape(gray_image, img_height * img_width) # Creating a vector from the image

        image_index = (index - 1) % num_images_per_person + 1
        subject_index = (index - 1) ÷ num_images_per_person + 1

        if subject_index > num_persons
            break
        end

        images_tensor[:, image_index, subject_index] = flat_image
    end

    return images_tensor
end