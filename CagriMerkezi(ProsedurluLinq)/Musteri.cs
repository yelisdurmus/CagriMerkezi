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
    public partial class Musteri : Form
    {
        public Musteri()
        {
            InitializeComponent();
        }
        CagriMerkeziUygulamaDataContext baglanti = new CagriMerkeziUygulamaDataContext();
        private void button4_Click(object sender, EventArgs e)
        {
            Goruntule();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string ad = textBox1.Text;
            string tur = comboBox1.Text;
            string telefon = maskedTextBox1.Text;
            string adres = textBox2.Text;
            int puan = Convert.ToInt32(textBox3.Text);
            baglanti.MusteriEkle(ad, tur, telefon, adres, puan);
            baglanti.SubmitChanges();
            Goruntule();
        }

        private void Goruntule()
        {
            var listele =baglanti.MusteriListele();
            baglanti.SubmitChanges();
            dataGridView1.DataSource = listele.ToList();

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Text = satir.Cells["AdSoyad"].Value.ToString();
            textBox1.Tag = satir.Cells["MusteriNo"].Value;
            comboBox1.Text = satir.Cells["Türü"].Value.ToString();
            maskedTextBox1.Text = satir.Cells["Telefon"].Value.ToString();
            textBox2.Text = satir.Cells["Adres"].Value.ToString();
            textBox3.Text = satir.Cells["Puan"].Value.ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int id = (int)textBox1.Tag;
            baglanti.MusteriSil(id);
            baglanti.SubmitChanges();
            Goruntule();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int no = (int)textBox1.Tag;
            string ad = textBox1.Text;
            string tur = comboBox1.Text;
            string telefon = maskedTextBox1.Text;
            string adres = textBox2.Text;
            int puan = Convert.ToInt32(textBox3.Text);
            baglanti.MusteriYenile(no, ad, tur, telefon, adres, puan);
            baglanti.SubmitChanges();
            Goruntule();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            groupBox1.Visible = true;
        }

        private void Musteri_Load(object sender, EventArgs e)
        {
            groupBox1.Visible = false;
        }

        private void button6_Click(object sender, EventArgs e)
        {
            if (checkBox1.Checked == true)
            {
                string ad = textBox1.Text;
                var listele = baglanti.AdaGoreAra(ad);
                dataGridView1.DataSource = listele.ToList();
            }
            if (checkBox2.Checked == true)
            {
                string tur = comboBox1.Text;
                var listele1 = baglanti.TureGoreAra(tur);
                dataGridView1.DataSource = listele1.ToList();
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Form1 git = new Form1();
            git.Show();
            this.Hide();
        }
    }
}
