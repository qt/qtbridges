= a backend in some language =

#include <QtQuickIntegration>


ValueType myGlobalValue;

SomeReturnType MyFunction() {
	...
	return myFunctionResult; 
}

class MyBackend {
	<...>
	// in each language we support a give selection of types
	// which are can be imported in Qt Quick
	string nameStr;
	ValueType myValue;
	ArrayType myArray;
	ListType myList;
	// some other data model types which are popular in a given language
	OtherDataModelType myOtherDataModel;
}

// a main in the backend or some soft of init function, since main()
// and the event loop are in Qt

main() {

	initQtQuick();
	MyBackend backend;
	exportForQtQuick(backend);
	exportForQtQuick();
}
	


= Qt Quick UI for this backend =

import LanguageIntegration
import MyBackend

ApplicationWindow {

	someUIValue: MyBackend.getValue();

    Connections {
        target: MyBackend
        function onMyFunction() {
            // some action
        }
    }

<...>
        ListView {
            id: listView
            model: myBackend.myList
            delegate: Control {
                <...>
            }
            <...>
        }
<...>
    Button {
        id: callButton
        text: "Call a function in the backend"
                onReleased: MyFunction()
    }
 
}
