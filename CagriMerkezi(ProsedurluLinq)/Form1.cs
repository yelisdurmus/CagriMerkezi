using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CagriMerkezi_ProsedurluLinq_
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Musteri git = new Musteri();
            git.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Tarife git = new Tarife();
            git.Show();
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Kampanyalar git = new Kampanyalar();
            git.Show();
            this.Hide();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Odeme git = new Odeme();
            git.Show();
            this.Hide();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Personeller git = new Personeller();
            git.Show();
            this.Hide();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Musteri git = new Musteri();
            git.Show();
            this.Hide();
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            Tarife git = new Tarife();
            git.Show();
            this.Hide();
        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            Odeme git = new Odeme();
            git.Show();
            this.Hide();
        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {
            Kampanyalar git = new Kampanyalar();
            git.Show();
            this.Hide();
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            Personeller git = new Personeller();
            git.Show();
            this.Hide();
        }

        private void pictureBox6_Click(object sender, EventArgs e)
        {
            Kayıtlar git = new Kayıtlar();
            git.Show();
            this.Hide();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Kayıtlar git = new Kayıtlar();
            git.Show();
            this.Hide();
        }

        private void pictureBox7_Click(object sender, EventArgs e)
        {
            Sube git = new Sube();
            git.Show();
            this.Hide();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Sube git = new Sube();
            git.Show();
            this.Hide();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            Birim git = new Birim();
            git.Show();
            this.Hide();
        }

        private void pictureBox8_Click(object sender, EventArgs e)
        {
            Birim git = new Birim();
            git.Show();
            this.Hide();
        }
    }
}
