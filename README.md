# ExportExcel
Export any ExtJs Grid to Excel



This example extracts the data of a GridPanel's Store, and uses the ColumnModel to construct an XML Excel document, converts it to Base64, and loads it into a data URL in a link.

You can click the link, and "Extraction" the grid straight into Excel.



Structure of Maven project:

src
｜
｜
｜main
    |
    |
    |java
    |resources
    |webapp
        |
        |
        |META-INF
        |resources
            |
            |
            |js
                |
                |
                |base64.js
                |exportExcel.js
                |ext-all.js
                |ext.all.custom.js
        |WEB-INF
            |
            |
            |jsp
                |
                |
                |nomenclature
                    |
                    |
                    |list.jsp
