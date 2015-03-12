<html>

<body>
	<hr class="soften">
	<div class="container">
		<div id="grid"></div>
	</div>
</body>

<script>
Ext.application({
    name: 'Fiddle',

    launch: function() {

/**********Define a new model named nomenclature**********/
		Ext.define('Nomenclatures', 
		{
			extend : 'Ext.data.Model',
			fields : [ 
				{name : 'id', type : 'int', useNull : true}, 
				'systemNameGammeDescription','nameNomenclature', 'description','nameGamme','descriptionGamme','site','system']
		});


/**********Define a new store named nomenclaturesStore for storing the datas from database**********/
		var nomenclaturesStore = Ext.create('Ext.data.Store', 
		{
			autoLoad : true, model : 'Nomenclatures', remoteFilter : 'true', remoteSort : 'true',
			groupField: 'site',
			proxy : 
			{
				type : 'ajax',
				api : { read : '<c:url value="/nomenclature/list"/>' },
				reader : { type : 'json', root : 'data', successProperty : 'success' },
			}
		});


/**********Define a checkbox**********/
		var sm = new Ext.selection.CheckboxModel();



/**********Define a list for Grid**********/
		var nomenclaturesList = Ext.create('Ext.grid.Panel',
		{
			title:'Liste Nomenclatures', id:'nomenclaturesList',store : nomenclaturesStore, frame : true, height : 500, selModel : sm, iconCls : 'Table',


/**********Define every column**********/
			columns : 
			[
				{ 	text : 'id',id:'id',name:'id', flex : 1, sortable : true, filterable: true, dataIndex : 'id', hideable: true,hidden:true},
				{ 	text : 'Nom', flex : 1, sortable : true, filterable: true, dataIndex : 'nameNomenclature', hideable: false, 
					renderer : function(value, metaData, record, rowIndex, colIndex, store) 
					{
						return '<a href="<c:url value="/nomenclature/admin/view/"/>' + record.get('id') + '">' + value + '</a>';
					}
				}, 
				{ text : 'Site', flex : 1, sortable : true, filterable: true, dataIndex : 'site' },
				{
	          		text: 'Système de Gamme',width:200, sortable : true, filterable: true, sortable : true,
	      			dataIndex: 'system'
	      	  	},  
	      	  	{
	          		text: 'Nom de Gamme',width:200, sortable : true, filterable: true, sortable : true,
	      			dataIndex: 'nameGamme'
	      	  	},  
			  	{ text : 'Version de Gamme', width:200, sortable : true, filterable: true, dataIndex : 'descriptionGamme' ,
	      	  	},
				{ text : 'Description', flex : 1, sortable : true, filterable: true, dataIndex : 'description' }
			],
			dockedItems : 
			[{
					xtype:'toolbar',
					dock: 'top',
					displayInfo:true,
					items: [{
/**********Define a button for export the Excel file**********/
	                    xtype: 'button',
	                    iconCls:'PageExcel',
	                    text: 'Extraction',
	                    handler: function(b, e) {
	                        b.up('grid').downloadExcelXml();
	                    }
	                }]
				}
			]
		});
		
		
		
/****************************Main panel************************************/
		var nomenclaturePanel = Ext.create('Ext.panel.Panel', {
    		bodyPadding: 5,  
    	    items:[{
    	    	xtype:"fieldset",
    	    	layout:"form",
    	    	items:[{
    	    		xtype: 'form',
    	    		id:'editForm',
    	    		items:[
						nomenclaturesList
    	    		]
    	    	}]
    	    }]
    	    
    	});
		

	
		nomenclaturePanel.render('grid');
    }
});

</script>

</html>