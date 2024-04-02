<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TraCuu.aspx.cs" Inherits="BT_LAB_n.TraCuu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-inline mb-2">
        Giá Bán Từ <asp:TextBox ID="txtGiaTu" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvGiaTu" runat="server"
            ErrorMessage="Chưa Nhập dữ liệu" ControlToValidate="txtGiaTu" ForeColor="Red">(*)
        </asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cpvGiaTu" runat="server"
            ErrorMessage="Nhập sai dữ liệu" ControlToCompare="txtGiaTu" ControlToValidate="txtGiaDen" ForeColor="Red" Operator="GreaterThanEqual">(*)</asp:CompareValidator>
        <asp:TextBox ID="txtGiaDen" runat="server" CssClass="form-control" ></asp:TextBox>

        Đến <asp:Button ID="btTraCuu" runat="server" Text="Tìm Kiếm" CssClass="btn btn-secondary" />
        <asp:RequiredFieldValidator ID="rfvGiaDen" runat="server"
            ErrorMessage="Chưa Nhập Giá đến" ControlToValidate="txtGiaDen" ForeColor="Red">(*)

        </asp:RequiredFieldValidator>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <div class="row">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="dsHoaTheoGia">
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
    </div>


     <div class="row">
        <asp:Repeater ID="prHoa" runat="server" DataSourceID="dsHoaTheoGia">
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

    <asp:SqlDataSource ID="dsHoaTheoGia" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" 
        SelectCommand="SELECT * FROM [Hoa] WHERE (([Gia] &gt;= @Gia) AND ([Gia] &lt;= @Gia2))">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtGiaTu" Name="Gia" PropertyName="Text" Type="Double" />
            <asp:ControlParameter ControlID="txtGiaDen" Name="Gia2" PropertyName="Text" Type="Double" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
