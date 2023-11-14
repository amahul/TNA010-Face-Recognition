using Pkg
Pkg.add("Images")
Pkg.add("FileIO")

function display_images()

    print("display_images")
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