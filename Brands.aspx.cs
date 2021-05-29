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
    public partial class Brands : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["ACars_DB"].ConnectionString;
        SqlConnection connection;
        SqlCommand command;

        public void LoadData()
        {
            if (Page.IsPostBack)
            {
                GridView1.DataBind();
            }
        }

        public void ClearAllData()
        {
            BrandID.Text = "";
            TextBox1.Text = "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            BrandID.Text = GridView1.SelectedRow.Cells[1].Text;
            TextBox1.Text = GridView1.SelectedRow.Cells[2].Text;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(TextBox1.Text))
            {
                using (connection = new SqlConnection(constring))
                {
                    connection.Open();
                    command = new SqlCommand("insert into Brand (Name) values (@name)", connection);
                    command.Parameters.AddWithValue("@name", TextBox1.Text);
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
            if (!String.IsNullOrEmpty(BrandID.Text))
            {
                if (!String.IsNullOrEmpty(TextBox1.Text))
                {
                    using (connection = new SqlConnection(constring))
                    {
                        connection.Open();
                        command = new SqlCommand("update Brand set Name=@name where " +
                            "Id=@Id", connection);
                        command.Parameters.AddWithValue("@Id", BrandID.Text);
                        command.Parameters.AddWithValue("@name", TextBox1.Text);
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
            else
            {
                lblMessage.Text = "Favor, selecione uma marca!";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(BrandID.Text))
            {
                using (connection = new SqlConnection(constring))
                {
                    connection.Open();
                    command = new SqlCommand("delete from Brand where Id=@Id", connection);
                    command.Parameters.AddWithValue("@Id", BrandID.Text);
                    command.ExecuteNonQuery();
                    connection.Close();

                    LoadData();
                    ClearAllData();
                }
            }
            else
            {
                lblMessage.Text = "Favor, escolha uma das marcas da lista!";
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            ClearAllData();
        }
    }
}