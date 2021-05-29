<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Brands.aspx.cs" Inherits="ACars.Brands" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />
    <table class="nav-justified">
    <tr>
        <td class="modal-sm" style="width: 120px">&nbsp;</td>
        <td style="width: 174px">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </td>
        <td rowspan="6" style="width: 180px">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="145px" Width="218px" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="exec SearchBrands;"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 120px">
            <asp:Label ID="Label1" runat="server" Text="Nome da Marca"></asp:Label>
        </td>
        <td style="width: 174px">
            <asp:TextBox ID="TextBox1" runat="server" Width="195px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 120px">
            <asp:Label ID="BrandID" runat="server" Visible="False"></asp:Label>
        </td>
        <td style="width: 174px">
            <asp:Button ID="Button1" runat="server" Text="Adicionar" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Atualizar" OnClick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" Text="Remover" OnClick="Button3_Click" />
            <asp:Button ID="Button4" runat="server" Text="Cancelar" OnClick="Button4_Click" />
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 120px; height: 36px;"></td>
        <td style="width: 174px; height: 36px;"></td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 120px">&nbsp;</td>
        <td style="width: 174px">&nbsp;</td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 120px">&nbsp;</td>
        <td style="width: 174px">&nbsp;</td>
    </tr>
</table>
    
</asp:Content>
