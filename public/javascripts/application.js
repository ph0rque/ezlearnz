// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

  function process_page_edit( elObj ){
    
    var jQElObj    =  jQuery(elObj);
    var jQEditObj  =  jQuery('div.edit, li.edit, span.edit');
    
    if( jQElObj.attr( 'editEnabled' ) != 'true' ){
    
      jQElObj.addClass( 'active' ).attr( 'editEnabled', 'true' );      
      jQEditObj.show();
    
    } else {      
    
      jQElObj.removeClass( 'active' ).attr( 'editEnabled', 'false' );
      jQEditObj.hide();
    
    }
    
  }
