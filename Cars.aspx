<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="ACars.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
<br /><br />
    <table class="nav-justified">
    <tr>
        <td class="modal-sm" style="width: 120px">&nbsp;</td>
        <td style="width: 174px">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </td>
        <td rowspan="6" style="width: 180px">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id,IdMarca" DataSourceID="SqlDataSource2" Height="145px" Width="218px" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                    <asp:BoundField DataField="IdMarca" HeaderText="IdMarca" SortExpression="IdMarca" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
                    <asp:BoundField DataField="Ano" HeaderText="Ano" SortExpression="Ano" />
                    <asp:BoundField DataField="Cor" HeaderText="Cor" SortExpression="Cor" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SearchCars" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Car]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 120px">
            <asp:Label ID="Label3" runat="server" Text="Modelo"></asp:Label>
        </td>
        <td style="width: 174px">
            <asp:TextBox name="Model" ID="TextBox1" runat="server" Width="195px"></asp:TextBox>
        </td>
    </tr>
    
    <tr>
        <td class="modal-sm" style="width: 120px; height: 36px;">
            <asp:Label ID="Label4" runat="server" Text="Ano"></asp:Label>
        </td>
        <td style="width: 174px; height: 36px;">
            <asp:TextBox ID="TextBox2" runat="server" Width="197px"></asp:TextBox>
        </td>
    </tr>
    
    <tr>
        <td class="modal-sm" style="width: 120px">
            <asp:Label ID="Label5" runat="server" Text="Color"></asp:Label>
        </td>
        <td style="width: 174px">
            <asp:TextBox ID="TextBox3" runat="server" Width="197px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 120px">Marca</td>
        <td style="width: 174px">
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name], [Id] FROM [Brand]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="modal-sm" style="width: 120px">
            <asp:Label ID="CarID" runat="server" Visible="False"></asp:Label>
        </td>
        <td style="width: 174px">
            <asp:Button ID="Button5" runat="server" Text="Adicionar" OnClick="Button1_Click" style="height: 26px" />
            <asp:Button ID="Button6" runat="server" Text="Atualizar" OnClick="Button2_Click" />
            <asp:Button ID="Button7" runat="server" Text="Remover" OnClick="Button3_Click" />
            <asp:Button ID="Button8" runat="server" Text="Cancelar" OnClick="Button4_Click" />
        </td>
    </tr>
    
</table>
</asp:Content>


