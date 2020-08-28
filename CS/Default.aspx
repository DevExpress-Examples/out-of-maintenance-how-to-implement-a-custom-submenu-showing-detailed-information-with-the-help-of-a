<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web" TagPrefix="dx" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to implement a custom submenu, showing detailed information, with the help of ASPxPopupControl</title>
	<script type="text/javascript">
		function showItem(s, e) {
			hintLabel.SetText(subMenu.cpItems[e.item.index][1]);
			hintPopup.Show();
			window['popupHider'] = setTimeout(function () {
				hintPopup.Hide();
			}, 4000);
			previewImage.SetImageUrl(subMenu.cpItems[e.item.index][0]);
		}
		function hideItem() {
			hintLabel.SetText('');
			hintPopup.Hide();
			clearInterval(window['popupHider']);
			previewImage.SetImageUrl('');
		}
		function onMouseOver(s,e) {
			menuPopup.Show();
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/menu.xml" XPath="*/item">
			</asp:XmlDataSource>
			<dx:ASPxMenu ID="ASPxMenu1" runat="server"  ClientInstanceName="mainMenu">
				<Items>
					<dx:MenuItem Name="MainItem" Text="MainItem">
					</dx:MenuItem>
				</Items>
				<ClientSideEvents ItemMouseOver="onMouseOver" />
			</dx:ASPxMenu>
		</div>
		<dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server"
			ShowHeader="False" ClientInstanceName="menuPopup" CloseAction="MouseOut"
			PopupAnimationType="Slide" PopupElementID="ASPxMenu1" PopupHorizontalAlign="LeftSides"
			PopupVerticalAlign="Below" Width="449" Height="266">
			<ContentCollection>
				<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
					<table>
						<tr>
							<td valign="top">
								<dx:ASPxMenu ID="MySubMenu" runat="server" DataSourceID="XmlDataSource1" Orientation="Vertical"
									ClientInstanceName="subMenu" OnItemDataBound="submenu_ItemDatabound" OnCustomJSProperties="subMenu_JSProperties">
									<ClientSideEvents ItemMouseOver="showItem" ItemMouseOut="hideItem" />
								</dx:ASPxMenu>

							</td>
							<td>
								<dx:ASPxImage ID="ASPxImage1" runat="server" ClientInstanceName="previewImage" Height="240"
									Width="320">
								</dx:ASPxImage>
							</td>
						</tr>
					</table>
				</dx:PopupControlContentControl>
			</ContentCollection>
		</dx:ASPxPopupControl>
		<dx:ASPxPopupControl ID="ASPxPopupControl2" runat="server" 
			ShowHeader="False" ClientInstanceName="hintPopup" DisappearAfter="4000" PopupAnimationType="Fade"
			CloseAction="MouseOut" PopupHorizontalAlign="OutsideRight"
			PopupVerticalAlign="TopSides" OnInit="subPopup_Init">
			<ContentCollection>
				<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
					<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="" ClientInstanceName="hintLabel">
					</dx:ASPxLabel>
				</dx:PopupControlContentControl>
			</ContentCollection>
		</dx:ASPxPopupControl>
	</form>
</body>
</html>
