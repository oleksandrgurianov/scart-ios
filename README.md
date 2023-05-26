### [High Fidelity Prototype](https://www.figma.com/file/CF7hGdtcXMTenxJPcFFBlz/SCART?type=design&t=D00ky1FgVGo0NLZg-1)

# SCART – iOS App

### Primary front-end features:

- Camera view

- Image Picker view

- Results view

  - Image

  - Pop-up

  - Text

  - Buttons


### Primary back-end features:

- object recognition of the captured picture using CoreML and Vision

- custom pre-trained ML Model (e.g., ArtClassifier) based on a Training Dataset of 35 pictures for 5 paintings (7 pictures per painting) and a Testing Dataset of 5 pictures for 5 paintings (1 picture per painting)

- implementation of prevention for incorrect art recognition by utilizing a confidence threshold of 0.8 (80%)


### Known bugs:

- occasional recognition of artworks in images that do not contain any

- occasional misclassification of artworks in the application


### Areas of improvement:

- addressing known issues

- implementation of the whole High Fidelity Prototype functionality within the actual application

- incorporation of additional features based on feedback received during the application's presentation
