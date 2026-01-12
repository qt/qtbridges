# Qt Bridges Overview Documentation

The `doc` folder contains the sources for building Qt Bridges
overview documentation.

### Building the HTML documentation

    mkdir -p doc/build
    cd doc/build
    </path/to/Qt>/bin/qt-cmake -GNinja ..
    ninja html_docs

The output is then generated under `/html` in the build directory.

### Building the documentation for Qt Assistant

Building the documentation for Qt Assistant is useful when you need to check the table of content
(TOC) navigation for the project.

To be able to build the documentation for the Qt Assistant (a `.qch` file), perform the steps from
[Building the HTML documentation](#building-the-html-documentation) section. Once the documentation
can be built correctly, run:

    ninja qch_docs

As a result, the `qtbridges.qch` file is generated in the `/build` folder. Add this file to
Qt Assistant to navigate the newly built documentation locally.
