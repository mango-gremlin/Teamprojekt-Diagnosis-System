<img width="825" alt="Bildschirm­foto 2023-05-11 um 12 39 31" src="https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/assets/116288221/5d3f392a-56df-4ca8-a3ee-e1b3b1d8e746">



# Usage 
Every GUI has a element communicator, with has one ore more ML-models. It give the unedited input into the communicator by calling the predict function.
The format function ensures, that every ML-model gets the correct input. It also desides, who to deal with uncompleted data.
!May insert a new class for that!
If more than one ML-model is used, the analyser function decides the output. The output should contain the name of the disease
or the concrete diagnosis (e.g. heart disease yes/no).
Every ml-model has a dataFormatter, that ensures the data has the correct format to train the data.

### Note 1
Since data formatter. communicator and model can differ a lot. The advantage of the UML is to have a clear structure of project
rather than enable to work faster through principles of inheriting.
### Note 2
The communicator has more ML-models, so  ml-models of different datasets (e.g. multiple datasets of heart disease), 
or different ml-models of the same dataset can be included.

Link to the file:
https://drive.google.com/file/d/1sfNvuwkeTD6Io1x483EUpjJxcepRB-Hn/view?usp=sharing
