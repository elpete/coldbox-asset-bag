component {

    property name="head";
    property name="footer";

    function init() {
        variables.head = [];
        variables.footer = [];
        return this;
    }

    function addAsset( asset, location ) {
        if ( canAddAsset( asset ) ) {
            variables[ location ].append( asset );
        }
        return this;
    }

    function addAssetToHead( asset ) {
        return addAsset( asset, "head" );
    }

    function addJavascriptToHead( filepath ) {
        return addAssetToHead(
            new JavascriptAsset( filepath )
        );
    }

    function addInlineJavascriptToHead( content ) {
        return addAssetToHead(
            new InlineJavascriptAsset( content )
        );
    }

    function addAssetToFooter( asset ) {
        return addAsset( asset, "footer" );
    }

    function addJavascriptToFooter( filepath ) {
        return addAssetToFooter(
            new JavascriptAsset( filepath )
        );
    }

    function addInlineJavascriptToFooter( content ) {
        return addAssetToFooter(
            new InlineJavascriptAsset( content )
        );
    }

    function getHeadContent() {
        return variables.head;
    }

    function getFooterContent() {
        return variables.footer;
    }

    function renderHead() {
        return getHeadContent().map( function( asset ) {
            return asset.toString();
        } ).toList( chr( 10 ) );
    }

    function renderFooter() {
        return getFooterContent().map( function( asset ) {
            return asset.toString();
        } ).toList( chr( 10 ) );
    }

    function canAddAsset( asset ) {
        for ( var headAsset in variables.head ) {
            if ( headAsset.isSameAs( asset ) ) {
                return false;
            }
        }
        for ( var footerAsset in variables.footer ) {
            if ( footerAsset.isSameAs( asset ) ) {
                return false;
            }
        }
        return true;
    }

}
