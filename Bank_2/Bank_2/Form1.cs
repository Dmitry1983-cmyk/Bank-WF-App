using Bank_2.Admin;
using Bank_2.Registr;
using Bank_2.User;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Bank_2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btn_Reg_Click(object sender, EventArgs e)
        {
            RegistrationForm reg_f = new RegistrationForm();
            reg_f.Show();
        }

        private void btn_Enter_Click(object sender, EventArgs e)
        {
            UserBalansForm us_bal_f = new UserBalansForm();
            if (check_Admin.Checked != true)
            {

                if (txt_Login.Text != "")
                {
                    if (txt_Pass.Text != "")
                    {
                        SqlConnection connection = new SqlConnection();
                        //connection.ConnectionString = (@"Data Source=Server2;Initial Catalog=Chat_WPF;User=Student;Integrated Security=False;");//аудитория
                        connection.ConnectionString = (@"Data Source=DMITRY-ПК;Initial Catalog=Bank;User=Dmitry-ПК\Dmitry;Integrated Security=SSPI;");//дом
                        connection.Open();
                        string com_chek = $"select * from [User] join User_Login_Pass on [User].Id=User_Login_Pass.Id join Wallet on User_Login_Pass.Id=Wallet.Id join Photo_table on Wallet.Id=Photo_table.Id where Логин='{txt_Login.Text}' and Пароль='{txt_Pass.Text}'";//четыре табл в одной проверка на существующие Лог и Пасс
                        SqlCommand command = new SqlCommand(com_chek, connection);
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            us_bal_f.lab_last_name.Text = reader[1].ToString();
                            us_bal_f.lab_num_card.Text = reader[13].ToString();
                            us_bal_f.lab_balans.Text = reader[14].ToString();

                            byte[] img = (byte[])(reader[16]);
                            us_bal_f.pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
                            if (img == null)
                                us_bal_f.pictureBox1.Image = null;
                            else
                            {
                                MemoryStream ms = new MemoryStream(img);
                                us_bal_f.pictureBox1.Image = Image.FromStream(ms);
                            }

                            connection.Close();
                            us_bal_f.Show();
                            txt_Login.Clear();
                            txt_Pass.Clear();
                        }
                    }
                    else
                    {
                        MessageBox.Show("Неверный пароль");
                        txt_Login.Clear();
                        txt_Pass.Clear();
                    }
                }
                else
                {
                    MessageBox.Show("Неверный логин ");
                    txt_Login.Clear();
                    txt_Pass.Clear();
                }
            }
            else
            {
                if (txt_Login.Text != "")
                {
                    if (txt_Pass.Text != "")
                    {
                        SqlConnection connection_Admin = new SqlConnection();
                        //connection.ConnectionString = (@"Data Source=Server2;Initial Catalog=Chat_WPF;User=Student;Integrated Security=False;");//аудитория
                        connection_Admin.ConnectionString = (@"Data Source=DMITRY-ПК;Initial Catalog=Bank;User=Dmitry-ПК\Dmitry;Integrated Security=SSPI;");//дом
                        connection_Admin.Open();
                        string com_chek_ad = $"select *from AdminBank where Login_Admin='{txt_Login.Text}' and Pass_Admin='{txt_Pass.Text}'";//проверка на существующие Лог и Пасс
                        SqlCommand command_Admin = new SqlCommand(com_chek_ad, connection_Admin);
                        SqlDataReader reader_ad = command_Admin.ExecuteReader();
                        if (reader_ad.Read())
                        {
                            connection_Admin.Close();

                            AdminForm ad_f = new AdminForm();
                            ad_f.Show();
                            txt_Login.Clear();
                            txt_Pass.Clear();
                            check_Admin.Checked = false;
                        }
                    }
                    else
                    {
                        MessageBox.Show("Неверный пароль");
                        txt_Login.Clear();
                        txt_Pass.Clear();
                    }

                }

                else
                {
                    MessageBox.Show("Неверный логин ");
                    txt_Login.Clear();
                    txt_Pass.Clear();
                }
            }
        }
    }
}
