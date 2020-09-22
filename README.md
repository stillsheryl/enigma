# Enigma

### Project Overview

In this project I used Ruby to create a tool for cracking an [encryption algorithm](https://backend.turing.io/module1/projects/enigma/encryption). Once on your local machine, the program is accessible from the command line and can be run to encode, decode, and crack messages.

### Program Design

The main class is the **Enigma** class which holds the methods used for encrypting, decrypting, and cracking a message. There are separate classes for the encrypt and decrypt keys, and they both use a module called Key Generator that holds methods used by both classes. The encrypt and decrypt key classes create a shift after calculating and adding together a shift from the key and date. These classes each produce an array with four different alphabets that are used in the Engima class for the encrypting and decrypting.

The Enigma class has methods that take in the message and optionally the date and key for translation. If a key is not provide it will create one at random, and if a date is not provided it will use today's date. Using the alphabets created, the methods will break down the message and read it letter by letter. If it is a recognized letter from the alphabet or a space it is read and rotates according to the key and its index, and if it's not a recognized letter it will not be altered and will not effect the index of the next recognized letter.

The crack method takes in a message, and knowing that the last 4 characters of every message are "  end" it checks every possible key to crack the code.

### Project Planning

In order to fully understand the problem before jumping in I wrote out a detailed list of the project requirements. I also broke down the encryption algorithm to make sure I understood it and was able to translate my name successfully as an example. I decided that after finding the final shifts I would create an array of the four alphabaets in the order needed for the A, B, C, and D shifts. This way I can iterate through them and find the corresponding translation.

I hit a roadblock when I was using the `with_index` enumerator because I was unable to put unrecognized characters in the code without effecting the index for translation. In order to solve for this I instead used the `each` enumerable and kept track of the index, only adding to it when a letter was in the recognized characters.

<img src="https://user-images.githubusercontent.com/7945439/93830618-ebeb0f80-fc2d-11ea-80c5-20b5e3dc9b40.jpg" alt="Enigma_Requirements" width="450"/>
<img src="https://user-images.githubusercontent.com/7945439/93830666-0d4bfb80-fc2e-11ea-824e-59a0cf4f5147.jpg" alt="Enigma_Algorithm" width="450"/>

### Self Assessment

**Functionality** (4/4)

This project meets all the requirements for the encryp, decrypt and crack methods, as well as successfully implements the command line interface for each.

**Object Oriented Programming** (4/4)

The code is organized in a way where classes have a single responsibility and a module is utilized to reduce the amount of repeated code for two methods that need similar data. Classes and methods are at a reasonable length after a lot of refactoring throughout the project and at the end.

**Ruby Conventions and Mechanics** (3.5/4)

The code is properly indented and methods, variables and classes are named in ways that describe their functionality. No method is longer that 10 lines and there are helper methods to keep from repeating code. Enumerables used are sufficient for the functionality needed, and the one I'm not sure about is the each for the crack. The tests were running in under 0.0037 seconds before the addition of the method, and although I included the break to stop the iterations when the data needed is found, there may be a faster way to find the code.

**Test Drive Development** (4/4)

There is a test, and sometimes multiple tests to test edge cases, for every method. The methods in the module are tested in each class where they are being used and tests were almost always created before implementation code. Mocks and stubs are used to account for randomness and for the date, and test coverage is at 100%.

**Version Control** (4/4)

The project has more than 100 commits and 15 branches because the code was committed in small chunks and the branches were used to track different areas of focus throughout the process. Comments were written to describe what each PR did, and I also commented on certain aspects of the PR before merging to highlight various things. Commit messages are clear and concise.

![Rakefile](https://user-images.githubusercontent.com/7945439/93835277-f57b7400-fc3b-11ea-9879-fc62b05b3c6b.png "Test Coverage")


Starter repository for the Turing School [Enigma](https://backend.turing.io/module1/projects/enigma/) project.
