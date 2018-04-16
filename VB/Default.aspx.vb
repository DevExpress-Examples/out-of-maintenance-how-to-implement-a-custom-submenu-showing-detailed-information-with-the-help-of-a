Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Xml
Imports DevExpress.Web

Partial Public Class _Default
    Inherits System.Web.UI.Page


    Private items_Renamed As New List(Of String())()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

    End Sub

    Protected Sub subPopup_Init(ByVal sender As Object, ByVal e As EventArgs)
        ASPxPopupControl2.PopupElementID = MySubMenu.ClientID
    End Sub

    Protected Sub submenu_ItemDatabound(ByVal sender As Object, ByVal e As MenuItemEventArgs)
        Dim iUrl As String = e.Item.Image.Url
        e.Item.Image.Url = String.Empty

        Dim descr As String = TryCast(DataBinder.Eval(e.Item.DataItem, "description"), String)

        items_Renamed.Add(New String() { iUrl, descr })
    End Sub

    Protected Sub subMenu_JSProperties(ByVal sender As Object, ByVal e As CustomJSPropertiesEventArgs)
        e.Properties("cpItems") = items_Renamed.ToArray()
    End Sub
End Class