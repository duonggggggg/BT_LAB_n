<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="BT_LAB_n.XemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-inline">
        chon danh muc<asp:DropDownList ID="ddLoai" AutoPostBack="true" runat="server" DataSourceID="dsTheLoai" DataTextField="TenLoai" DataValueField="MaLoai"></asp:DropDownList>
    </div>
    <div class="row">
        <asp:Repeater ID="prHoa" runat="server" DataSourceID="dsHoa">
            <ItemTemplate>
                <div class="col-md-3 text-center">
                    <a href="#">
                        <img src="Hinh_San_Pham/<%# Eval("Hinh") %>" style="width:80%;object-fit:cover"/>
                    </a>
                    <br />
                    <%# Eval ("TenHoa") %> <br />
                    Gia Ban: <span style="color:red; font-weight:"></span> <%# Eval("Gia","{0:#,##0} Đồng") %> <br />
                    <asp:Button ID="btAddToCart" runat="server" Text="Add To Cart" CssClass="btn btn-success" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <asp:SqlDataSource ID="dsHoa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>"
        SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddLoai" Name="MaLoai" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsTheLoai" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>"
        SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
</asp:Content>
