using Images, FileIO

function display_images()

    folder_path = "./data"
    new_extension = ".gif"
    files = readdir(folder_path)

    for image_file in files
        image_path = joinpath(folder_path, image_file)
        image = load(image_path)
        display(image)
    end
end

function append_extension_to_files(folder_path, new_extension=".gif")
    files = readdir(folder_path)

    for file in files
        old_path = joinpath(folder_path, file)
        new_path = old_path * new_extension
        mv(old_path, new_path)
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