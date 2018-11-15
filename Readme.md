<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx](./VB/Default.aspx))
<!-- default file list end -->
# How to implement a custom submenu, showing detailed information, with the help of ASPxPopupControl


<p>This example shows how to implement a submenu showing an image and description hint. The top-level menu is implemented by a simple <a href="http://documentation.devexpress.com/#AspNet/clsDevExpressWebASPxMenuASPxMenutopic"><u>ASPxMenu</u></a>. On the <a href="http://help.devexpress.com/#AspNet/DevExpressWebASPxMenuScriptsASPxClientMenuBase_ItemMouseOvertopic"><u>ItemMouseOver</u></a> event, it shows a popup with another menu containing items that imitate subitem behavior. When you move the mouse over these items, an image to the right displays a corresponding picture and a hint popup also appears near this sub-menu.</p><p><br />
All <a href="http://documentation.devexpress.com/#AspNet/clsDevExpressWebASPxPopupControlASPxPopupControltopic"><u>ASPxPopups</u></a> use the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxPopupControlASPxPopupControl_PopupElementIDtopic"><u>PopupElementID</u></a> property to set an ID of the anchor element. Then, they are displayed simply by calling the client-side <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxPopupControlScriptsASPxClientPopupControlBase_Showtopic"><u>Show</u></a> method. Their position is determined by <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxPopupControlASPxPopupControl_PopupVerticalAligntopic"><u>PopupVerticalAlign</u></a> and <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxPopupControlASPxPopupControl_PopupHorizontalAligntopic"><u>PopupHorizontalAlign</u></a>.</p><p>The submenu is bound to an XML file containing text, description, and image URL data. The submenu's item text is set according to the "text" attribute in an XML file. An image URL is also set automatically, but cleared in the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxMenuASPxMenuBase_ItemDataBoundtopic"><u>ItemDataBound</u></a> event in order not to show this image in the menu item. The description and image URL are passed to the client side using <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxMenuASPxMenuBase_JSPropertiestopic"><u>CustomJSProperties</u></a> of the submenu. But first we need to fill a List with this data, because we don't know total items count to initialize the size of an array. Then, we convert this List to the array and set CustomJSProperties.</p><p><br />
We also need to call setInterval to hide a hint in 4 seconds, because a menu item is its anchor and MouseOut <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxPopupControlASPxPopupControl_CloseActiontopic"><u>CloseAction</u></a> doesn't work automatically.</p><p><br />
And finally we need to manually specify PopupElementID of the submenu popup, because it is contained outside of the first ASPxPopupControl.</p>

<br/>


