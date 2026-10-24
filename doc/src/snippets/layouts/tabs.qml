// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: 700
    height: 500
    minimumWidth: 400
    minimumHeight: 300
    visible: true
    title: qsTr("Tabs")

    header: TabBar {
        id: bar
        TabButton { text: qsTr("Overview") }
        TabButton { text: qsTr("Data") }
        TabButton { text: qsTr("Settings") }
    }

    StackLayout {
        anchors.fill: parent
        currentIndex: bar.currentIndex

        Pane { Label { text: qsTr("Overview page") } }
        Pane { Label { text: qsTr("Data page") } }
        Pane { Label { text: qsTr("Settings page") } }
    }
}
