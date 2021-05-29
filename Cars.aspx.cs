using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ACars
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["ACars_DB"].ConnectionString;
        SqlConnection connection;
        SqlCommand command;
        public void LoadData()
        {
            if (Page.IsPostBack)
            {
                GridView2.DataBind();
            }
        }

        public void ClearAllData()
        {
            CarID.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
        }


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            CarID.Text = GridView2.SelectedRow.Cells[1].Text;
            TextBox1.Text = HttpUtility.HtmlDecode(GridView2.SelectedRow.Cells[4].Text);
            TextBox2.Text = HttpUtility.HtmlDecode(GridView2.SelectedRow.Cells[5].Text);
            TextBox3.Text = HttpUtility.HtmlDecode(GridView2.SelectedRow.Cells[6].Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(TextBox1.Text))
            {
                using (connection = new SqlConnection(constring))
                {
                    connection.Open();
                    command = new SqlCommand("insert into Car (FKIdBrand, Model, Year, Color)" +
                        " values (@FKIdBrand, @Model, @Year, @Color)", connection);
                    command.Parameters.AddWithValue("@FKIdBrand", DropDownList1.SelectedItem.Value);
                    command.Parameters.AddWithValue("@Model", TextBox1.Text);
                    command.Parameters.AddWithValue("@Year", TextBox2.Text);
                    command.Parameters.AddWithValue("@Color", TextBox3.Text);
                    command.ExecuteNonQuery();
                    connection.Close();

                    LoadData();
                    ClearAllData();
                }
            }
            else
            {
                lblMessage.Text = "Insira um nome!";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(CarID.Text))
            {
                if (!String.IsNullOrEmpty(TextBox1.Text) ||
                    !String.IsNullOrEmpty(TextBox2.Text) ||
                    !String.IsNullOrEmpty(TextBox3.Text))
                {
                    using (connection = new SqlConnection(constring))
                    {
                        connection.Open();
                        command = new SqlCommand("update Car set FKIdBrand=@FKIdBrand, " +
                            "Model=@Model, Year=@Year, Color=@Color where " +
                            "Id=@Id", connection);
                        command.Parameters.AddWithValue("@Id", CarID.Text);
                        command.Parameters.AddWithValue("@FKIdBrand", DropDownList1.SelectedItem.Value);
                        command.Parameters.AddWithValue("@Model", TextBox1.Text);
                        command.Parameters.AddWithValue("@Year", TextBox2.Text);
                        command.Parameters.AddWithValue("@Color", TextBox3.Text);
                        command.ExecuteNonQuery();
                        connection.Close();

                        LoadData();
                        ClearAllData();
                    }
                }
                else
                {
                    lblMessage.Text = "Insira os campos!";
                }

            }
            else
            {
                lblMessage.Text = "Favor, escolha um dos carros já cadastrados!";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(CarID.Text))
            {
                using (connection = new SqlConnection(constring))
                {
                    connection.Open();
                    command = new SqlCommand("delete from Car where Id=@Id", connection);
                    command.Parameters.AddWithValue("@Id", CarID.Text);
                    command.ExecuteNonQuery();
                    connection.Close();

                    LoadData();
                    ClearAllData();
                }
            }
            else
            {
                lblMessage.Text = "Favor, escolha um dos carros já cadastrados!";
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            ClearAllData();
        }
    }
}