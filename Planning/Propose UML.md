![Project_structure](https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/blob/ab4f006f46b35b5ebf5d6607b1171075e213affb/Planning/Project_Structure.png)

# Usage 
Every GUI has a element communicator, with has one ore more ML-models. It give the unedited input into the communicator by calling the predict function.
The format function ensures, that every ML-model gets the correct input. It also desides, who to deal with uncompleted data.
!May insert a new class for that!
If more than one ML-model is used, the analyser function decides the output. The output should contain the name of the disease
or the concrete diagnosis (e.g. heart disease yes/no).

### Note 1
Since data formatter. communicator and model can differ a lot. The advantage of the UML is to have a clear structure of project
rather than enable to work faster through principles of inheriting.
### Note 2
The communicator has more ML-models, so  ml-models of different datasets (e.g. multiple datasets of heart disease), 
or different ml-models of the same dataset can be included.

Link to the file:
https://drive.google.com/file/d/1sfNvuwkeTD6Io1x483EUpjJxcepRB-Hn/view?usp=sharing
