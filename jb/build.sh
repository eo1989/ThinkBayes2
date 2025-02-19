# Build the Jupyter book version

# make the asciidoc version of the preface
pandoc -t asciidoc --wrap none --atx-headers preface.md > preface.asciidoc

# if adding chapters, update _toc.yml

# copy notebooks
cp ../soln/chap[0-2]*.ipynb .
cp ../soln/redline.ipynb .
cp ../examples/vaccine2.ipynb .
cp ../examples/usb.ipynb .
cp ../examples/sister.ipynb .
cp ../examples/bayes_dice.ipynb .
cp ../examples/radiation.ipynb .
cp ../examples/hospital.ipynb .
cp ../examples/hospital_birth_rate.ipynb .
cp ../soln/utils.py .

# add tags to hide the solutions
python prep_notebooks.py

# build the HTML version
jb build .

# push it to GitHub
ghp-import -n -p -f _build/html
