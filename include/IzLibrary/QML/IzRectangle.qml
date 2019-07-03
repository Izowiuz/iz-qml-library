import QtQuick 2.12
import QtQuick.Controls.Material 2.12

Rectangle {
	radius: 2
	color: Material.theme === Material.Dark
		   ? Material.background
			 //Material.color(Material.Grey, Material.Shade800)
		   : "white"
	border.width: 1
	border.color : Material.theme === Material.Dark
				   ? Material.color(Material.Grey, Material.Shade700)
				   : Material.color(Material.Grey, Material.Shade300)
}
