using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Bank_2.Admin
{
    public partial class AdminForm : Form
    {
        public AdminForm()
        {
            InitializeComponent();
        }

        private void btn_Add_Data_toTable_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            //connection.ConnectionString = (@"Data Source=Server2;Initial Catalog=Chat_WPF;User=Student;Integrated Security=False;");//аудитория
            connection.ConnectionString = (@"Data Source=DMITRY-ПК;Initial Catalog=Bank;User=Dmitry-ПК\Dmitry;Integrated Security=SSPI;");//дом
            connection.Open();
            string query = "select * from [User] join User_Login_Pass on [User].Id=User_Login_Pass.Id join Wallet on User_Login_Pass.Id=Wallet.Id";
            SqlCommand command = new SqlCommand(query, connection);
            SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            connection.Close();
        }
    }
}
