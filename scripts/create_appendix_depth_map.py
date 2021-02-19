import sys
import os

images_dir = sys.argv[1]
# parent_dir = sys.argv[2]

# sips -Z 600 *.jpg
# ^ use that to resize

tpl = ""

with open('scripts/depth_img_appendix_template.txt', 'r') as file:
    tpl = file.read()


with open('scripts/appendix_output.txt', 'w') as file:
    for filename in os.listdir(images_dir):
        if filename.endswith(".png") or filename.endswith(".JPG"):
            out = tpl
            out = out.replace("$1", "%s/%s" % ("images/depth", filename))
            out = out.replace("$2", filename.replace(
                'map-', '').replace('.png', '\%'))
            file.write(out)
