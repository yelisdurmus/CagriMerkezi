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
    public partial class Tarife : Form
    {
        public Tarife()
        {
            InitializeComponent();
        }
        CagriMerkeziUygulamaDataContext baglanti = new CagriMerkeziUygulamaDataContext();
        private void button1_Click(object sender, EventArgs e)
        {
            int mno = Convert.ToInt32(comboBox1.Text);
            string ad = textBox1.Text;
            string durum = comboBox2.Text;
            decimal ucret = Convert.ToDecimal(textBox2.Text);
            string baslangic = dateTimePicker1.Text;
            string bitis = dateTimePicker2.Text;
            baglanti.TarifeEkle(mno, ad, durum, ucret, baslangic, bitis);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void goruntule()
        {
            var listele = baglanti.TarifeListele();
            baglanti.SubmitChanges();
            dataGridView1.DataSource = listele.ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            comboBox1.Text = satir.Cells["MusteriNo"].Value.ToString();
            textBox1.Text = satir.Cells["TAd"].Value.ToString();
            textBox1.Tag = satir.Cells["TarifeNo"].Value;
            comboBox2.Text = satir.Cells["TDurum"].Value.ToString();
            textBox2.Text = satir.Cells["TUcret"].Value.ToString();
            dateTimePicker1.Text = satir.Cells["BaslangicTarihi"].Value.ToString();
            dateTimePicker2.Text = satir.Cells["BitisTarihi"].Value.ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int id = (int)textBox1.Tag;
            baglanti.TarifeSil(id);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int tno = (int)textBox1.Tag;
            int mno = Convert.ToInt32(comboBox1.Text);
            string ad = textBox1.Text;
            string durum = comboBox2.Text;
            decimal ucret = Convert.ToDecimal(textBox2.Text);
            string baslangic = dateTimePicker1.Text;
            string bitis = dateTimePicker2.Text;
            baglanti.TarifeYenile(tno,mno, ad, durum, ucret, baslangic, bitis);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            goruntule();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            groupBox1.Visible = true;
        }

        private void button6_Click(object sender, EventArgs e)
        {
            if (checkBox1.Checked == true)
            {
                string ad = textBox1.Text;
                var listele = baglanti.TAdaGoreAra(ad);
                dataGridView1.DataSource = listele.ToList();
            }
            if (checkBox2.Checked == true)
            {
                string tur = comboBox2.Text;
                var listele1 = baglanti.TDurumeGoreAra(tur);
                dataGridView1.DataSource = listele1.ToList();
            }
        }

        private void Tarife_Load(object sender, EventArgs e)
        {
            groupBox1.Visible = false;
            comboBox1.DataSource = baglanti.Musterilers.ToList();
            comboBox1.ValueMember = "MusteriNo";
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Form1 git = new Form1();
            git.Show();
            this.Hide();
        }
    }
}
