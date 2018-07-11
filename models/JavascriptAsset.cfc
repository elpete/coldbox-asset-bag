component accessors="true" {

    property name="content";

    function init( content ) {
        variables.content = arguments.content;
        return this;
    }

    function toString() {
        return '<script type="text/javascript" src="#content#"></script>';
    }

    function isSameAs( otherAsset ) {
        return isInstanceOf( otherAsset, "JavascriptAsset" ) &&
            ( getContent() == otherAsset.getContent() );
    }

}
