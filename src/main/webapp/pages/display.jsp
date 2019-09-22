<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<html>
<head>
</head>
<script>
    var theChild;
    function showPdf(url) {
        if(theChild!=null) {
            if(getCurrentBrowserName() != 'msie') {
                theChild.close();
            }
        }
        theChild = popupPdf(url);
        theChild.focus();
    }

    function popupPdf(url) {
        alert('Attention: The document will be opened in another window. Please close window after printing or viewing!');
        var attributes = 'menubar=no,toolbar=no,scrollbars=yes,resizable=yes,fullscreen=no';
        attributes = attributes + ',width=' + (screen.availWidth - 150);
        attributes = attributes + ',height=' + (screen.availHeight - 250);
        attributes = attributes + ',screenX=50,screenY=50,left=10,top=10';
        var wOpen;
        wOpen = window.open(url, 'theChild', attributes);

//wOpen.focus();
        wOpen.moveTo(75,50);
        wOpen.resizeTo(screen.availWidth, screen.availHeight);

        return wOpen;

    }

    function getCurrentBrowserName() {
        var browserName = "";

        var ua = navigator.userAgent.toLowerCase();
        if ( ua.indexOf( "opera" ) != -1 ) {
            browserName = "opera";
        }
        else if ( ua.indexOf( "msie" ) != -1 ) {
            browserName = "msie";
        }
        else if ( ua.indexOf( "safari" ) != -1 ) {
            browserName = "safari";
        }
        else if ( ua.indexOf( "mozilla" ) != -1 ) {
            if ( ua.indexOf( "firefox" ) != -1 ) {
                browserName = "firefox";
            }
            else {
                browserName = "mozilla";
            }
        }
        else {
            browserName = "";
        }

        return browserName;
    }
    function showFile(blob){
        // It is necessary to create a new blob object with mime-type explicitly set
        // otherwise only Chrome works like it should
        var newBlob = new Blob([blob], {type: "application/pdf"})

        // IE doesn't allow using a blob object directly as link href
        // instead it is necessary to use msSaveOrOpenBlob
        if (window.navigator && window.navigator.msSaveOrOpenBlob) {
            window.navigator.msSaveOrOpenBlob(newBlob);
            return;
        }

        // For other browsers:
        // Create a link pointing to the ObjectURL containing the blob.
        const data = window.URL.createObjectURL(newBlob);
        var link = document.createElement('a');
        link.href = data;
        link.download="file.pdf";
        link.click();
        setTimeout(function(){
            // For Firefox it is necessary to delay revoking the ObjectURL
            window.URL.revokeObjectURL(data);
        }, 100);
    }
    async function getIt() {
        const response = await fetch('/downloadpdf/DownloadIt.do', {Headers:{'Content-Type': 'application/pdf'}});
        const myBlob = response.blob();
        myBlob.then(function(result){
            url=URL.createObjectURL(result);
            var a = document.createElement("a");
            document.body.appendChild(a);
            a.style = "display: none";
            a.href = url;
            a.download = 'lalala.pdf';
            a.target = '_blank';
            a.click();
            window.URL.revokeObjectURL(url);
        });
	}
</script>
<body>

	Download file from server - <html:link action="/DownloadIt">struts-tutorial.pdf</html:link>
	<p></p>
	<a href="#" onClick="showPdf('/downloadpdf/DownloadIt.do'); return false;">struts-tutorial.pdf</a>
	<p></p>
	<a href="#" onclick="getIt(); return false;">Download</a>
</body>
</html>