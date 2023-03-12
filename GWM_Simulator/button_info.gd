#Le fichier qui permet de gérer le clic sur le bouton d'informations

extends TextureButton


#Appelée lors du clic sur le bouton d'informations, permet d'afficher le tutoriel
func _on_button_info_pressed():
	get_node("../info").visible = true
