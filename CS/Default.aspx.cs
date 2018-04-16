using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page
{
    List<String[]> items = new List<String[]>();
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void subPopup_Init(object sender, EventArgs e) {
        ASPxPopupControl2.PopupElementID = MySubMenu.ClientID;
    }

    protected void submenu_ItemDatabound(object sender, MenuItemEventArgs e)
    {        
        String iUrl = e.Item.Image.Url;
        e.Item.Image.Url = String.Empty;

        String descr = DataBinder.Eval(e.Item.DataItem, "description") as String;

        items.Add(new String[] { iUrl, descr });
    }

    protected void subMenu_JSProperties(object sender, CustomJSPropertiesEventArgs e)
    {
        e.Properties["cpItems"] = items.ToArray();
    }
}