// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: 900
    height: 600
    minimumWidth: 500
    minimumHeight: 300
    visible: true
    title: qsTr("Sidebar and content")

    SplitView {
        anchors.fill: parent

        // Side column
        Pane {
            SplitView.preferredWidth: 220
            SplitView.minimumWidth: 140
            SplitView.maximumWidth: 400

            ListView {
                id: sidebar
                anchors.fill: parent
                model: [qsTr("Inbox"), qsTr("Drafts"), qsTr("Sent"), qsTr("Trash")]
                currentIndex: 0
                delegate: ItemDelegate {
                    required property int index
                    required property string modelData
                    width: ListView.view.width
                    text: modelData
                    highlighted: ListView.isCurrentItem
                    onClicked: sidebar.currentIndex = index
                }
            }
        }

        // Main column
        Pane {
            SplitView.fillWidth: true

            Label {
                text: qsTr("Showing: %1").arg(sidebar.currentItem
                                              ? sidebar.currentItem.text : "")
                font.pixelSize: 20
            }
        }
    }
}
