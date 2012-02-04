$(document).ready(function() {
	var textArea = document.getElementById('comment_text_area');
	if(textArea != null) 
		new nicEditor({iconsPath : '/images/nicEditorIcons.gif'}).panelInstance('comment_text_area');
});
