<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ThemHoa.aspx.cs" Inherits="BT_LAB_n.ThemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <h2 class="btn btn-info"> Thêm mới sản phẩm</h2>
   <div class="row mt-3 mb-2">
       <div class="col-md-2">Danh Mục</div>
       <div class="co;-md-10">
           <asp:DropDownList ID="drDanhMuc" runat="server" DataSourceID="sdThemHoa" AutoPostBack="True" DataTextField="TenLoai" DataValueField="MaLoai"></asp:DropDownList>
       </div>
   </div>
      <div class="row mb-2">
       <div class="col-md-2">Tên hoa</div>
       <div class="co;-md-10">
           <asp:TextBox ID="txtTenHoa" CssClass="form-control" runat="server"></asp:TextBox>
       </div>
   </div>
      <div class="row mb-2">
       <div class="col-md-2">Giá</div>
       <div class="co;-md-10">
           <asp:TextBox ID="txtGia" CssClass="form-control" runat="server" ></asp:TextBox>
       </div>
   </div>
      <div class="row mb-2">
       <div class="col-md-2">Ngày cập nhật</div>
       <div class="co;-md-10">
           <asp:TextBox ID="txtNgayCapNhat" CssClass="form-control" runat="server"></asp:TextBox>
       </div>
   </div>
     <div class="row mb-2">
       <div class="col-md-2">Hình</div>
       <div class="co;-md-10">
           <asp:FileUpload ID="FHinh" runat="server" />
       </div>
   </div>
    <div class="col-md-2"></div>
       <div class="col-md-10">
           <asp:Button ID="btSave" runat="server" Text="Lưu" CssClass= "btn btn-primary" OnClick="btSave_Click"/> 
           <asp:Label ID="lbThongBao" runat="server" Text="" ForeColor="#cc3354" ></asp:Label>
       </div>
    <asp:SqlDataSource ID="sdThemHoa" runat="server"
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Loai] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>
            <asp:ControlParameter ControlID="drDanhMuc" Name="MaLoai" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
     </asp:SqlDataSource>
</asp:Content>
