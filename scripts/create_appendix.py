import sys
import os

images_dir = sys.argv[1]
# parent_dir = sys.argv[2]

# sips -Z 600 *.jpg
# ^ use that to resize

tpl = ""

with open('scripts/img_appendix_template.txt', 'r') as file:
    tpl = file.read()


with open('scripts/appendix_output.txt', 'w') as file:
    for filename in os.listdir(images_dir):
        if filename.endswith(".png") or filename.endswith(".JPG"):
            out = tpl
            out = out.replace("$1", "%s/%s" % (images_dir, filename))
            file.write(out)
