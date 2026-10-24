// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: 800
    height: 500
    minimumWidth: 480
    minimumHeight: 300
    visible: true
    title: qsTr("Master-detail")

    // Replace this with a model exposed by your backend
    ListModel {
        id: items
        ListElement { name: "Alice"; email: "alice@example.com" }
        ListElement { name: "Bob"; email: "bob@example.com" }
        ListElement { name: "Carol"; email: "carol@example.com" }
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        ListView {
            id: list
            Layout.preferredWidth: 240
            Layout.fillHeight: true
            clip: true
            model: items
            currentIndex: 0
            delegate: ItemDelegate {
                required property int index
                required property string name
                width: ListView.view.width
                text: name
                highlighted: ListView.isCurrentItem
                onClicked: list.currentIndex = index
            }
            ScrollBar.vertical: ScrollBar {}
        }

        ToolSeparator { Layout.fillHeight: true }

        Pane {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                visible: list.currentIndex >= 0
                spacing: 8

                Label {
                    text: list.currentIndex >= 0 ? items.get(list.currentIndex).name : ""
                    font.pixelSize: 22
                }
                Label {
                    text: list.currentIndex >= 0 ? items.get(list.currentIndex).email : ""
                }
            }
            Label {
                anchors.centerIn: parent
                visible: list.currentIndex < 0
                text: qsTr("Select an item")
                opacity: 0.6
            }
        }
    }
}
