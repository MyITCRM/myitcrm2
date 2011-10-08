CKEDITOR.editorConfig = function( config )
{
	config.toolbar = 'MyToolbar';

	config.toolbar_MyToolbar =
	[
		{ name: 'basicstyles', items : [ 'Bold','Italic','Strike','-','RemoveFormat','-','Undo','Redo','-'
            ,'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote', '-','Link','Unlink','Anchor','-','Maximize',
            '-','Cut','Copy','Paste','PasteText','PasteFromWord','-','Scayt','-','Image','Table','HorizontalRule','NewPage','Preview' ] },
        { name: 'styles', items : [ 'Styles','Format' ] }
	];
};