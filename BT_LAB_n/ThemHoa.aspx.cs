using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


namespace BT_LAB_n
{
    public partial class ThemHoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btSave_Click(object sender, EventArgs e)
        {
            string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["HoaTuoiDBConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(chuoi_ket_noi);
            conn.Open();
            string sql = "insert into hoa(tenhoa,gia,hinh,maloai,ngaydang,soluongxem)" +
                "values (@tenhoa,@gia,@hinh,@maloai,@ngaydang,@soluongxem)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            //
            cmd.Parameters.AddWithValue("@tenhoa", txtTenHoa.Text);
            cmd.Parameters.AddWithValue("@gia", txtGia.Text);

            if (FHinh.HasFile)
            {

                //xử lý upload hình
                string duong_dan = Server.MapPath("~/Hinh_San_Pham/") + FHinh.FileName;
                FHinh.SaveAs(duong_dan);
                cmd.Parameters.AddWithValue("@hinh", FHinh.FileName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@hinh", "no_image.pmg");
            }

            cmd.Parameters.AddWithValue("@ngaydang", txtNgayCapNhat.Text);
            cmd.Parameters.AddWithValue("@soluongxem", 0);
           

            if (cmd.ExecuteNonQuery() > 0)
                Response.Redirect("ThemHoa.aspx");
            else
                lbThongBao.Text = "Thao tác thêm nhân viên Thất bại";
        }
    }
}