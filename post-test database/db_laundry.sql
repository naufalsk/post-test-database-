-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 16 Sep 2022 pada 04.55
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `id` int(10) NOT NULL,
  `id_user` int(10) DEFAULT NULL,
  `nama_outlet` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `nomor_telepon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `outlet`
--

INSERT INTO `outlet` (`id`, `id_user`, `nama_outlet`, `alamat`, `nomor_telepon`, `created_at`, `updated_at`) VALUES
(1, 1, 'mylaundry', 'jakarta', '081257489018', '2022-09-16 02:46:32', '2022-09-16 02:46:32'),
(2, 2, 'mylaundry', 'bekasi', '081295748391', '2022-09-16 02:46:32', '2022-09-16 02:46:32'),
(3, 3, 'mylaundry', 'tangerang', '081248674839', '2022-09-16 02:46:32', '2022-09-16 02:46:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id` int(10) NOT NULL,
  `nama_paket` varchar(255) DEFAULT NULL,
  `harga` varchar(255) DEFAULT NULL,
  `satuan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id`, `nama_paket`, `harga`, `satuan`, `created_at`, `updated_at`) VALUES
(1, 'laundry1', '20000', 'pakaian', '2022-09-16 02:39:02', '2022-09-16 02:39:02'),
(2, 'laundry2', '17000', 'pakaian', '2022-09-16 02:39:02', '2022-09-16 02:39:02'),
(3, 'laundry3', '15000', 'pakaian', '2022-09-16 02:39:02', '2022-09-16 02:39:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(10) NOT NULL,
  `id_user` int(10) DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `id_user`, `no_telepon`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 1, '081238572918', 'bekasi', '2022-09-16 02:44:10', '2022-09-16 02:44:10'),
(2, 2, '081237584928', 'tangerang', '2022-09-16 02:44:10', '2022-09-16 02:44:10'),
(3, 3, '081249385729', 'jakarta', '2022-09-16 02:44:10', '2022-09-16 02:44:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(10) NOT NULL,
  `id_pesanan` int(10) DEFAULT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  `jumlah_paket` varchar(255) DEFAULT NULL,
  `subtotal` varchar(255) DEFAULT NULL,
  `bukti_transfer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `id_pesanan`, `tanggal_bayar`, `jumlah_paket`, `subtotal`, `bukti_transfer`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-12-20', '15', '20000', 'tf1.png', '2022-09-16 02:29:58', '2022-09-16 02:29:58'),
(2, 2, '2022-12-15', '10', '14000', 'tf2.png', '2022-09-16 02:29:58', '2022-09-16 02:29:58'),
(3, 3, '2022-11-22', '13', '17000', 'tf3.png', '2022-09-16 02:29:58', '2022-09-16 02:29:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(10) NOT NULL,
  `id_user` int(10) DEFAULT NULL,
  `id_outlet` int(10) DEFAULT NULL,
  `id_paket` int(10) DEFAULT NULL,
  `status_pesanan` enum('diproses','selesai') DEFAULT NULL,
  `status_pembayaran` enum('lunas','belum lunas') DEFAULT NULL,
  `tanggal_pemesanan` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id`, `id_user`, `id_outlet`, `id_paket`, `status_pesanan`, `status_pembayaran`, `tanggal_pemesanan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'diproses', 'lunas', '2022-10-03', '2022-09-16 02:33:34', '2022-09-16 02:33:34'),
(2, 2, 2, 2, 'selesai', 'lunas', '2022-10-24', '2022-09-16 02:33:34', '2022-09-16 02:33:34'),
(3, 3, 3, 3, 'diproses', 'belum lunas', '2022-09-28', '2022-09-16 02:33:34', '2022-09-16 02:33:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `level` enum('admin','petugas','pelanggan') DEFAULT NULL,
  `email_verified_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `level`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'asep', 'asep@gmail.com', 'user1', 'admin', '2022-09-16 02:42:36', 'pass1', 'EHIEUWFJQ128H', '2022-09-16 02:42:36', '2022-09-16 02:42:36'),
(2, 'didi', 'didi@gmail.com', 'user2', 'petugas', '2022-09-16 02:42:36', 'pass2', 'EHFEQIF1928AA', '2022-09-16 02:42:36', '2022-09-16 02:42:36'),
(3, 'sucipto', 'sucipto@gmail.com', 'user3', 'pelanggan', '2022-09-16 02:42:36', 'pass3', 'EAFAEIOFJ12W23', '2022-09-16 02:42:36', '2022-09-16 02:42:36');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users` (`id_user`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pelanggan` (`id_user`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pembayaran` (`id_pesanan`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pesanan` (`id_user`),
  ADD KEY `fk_outlet` (`id_outlet`),
  ADD KEY `fk_paket` (`id_paket`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD CONSTRAINT `fk_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `fk_pelanggan` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_pembayaran` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id`);

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `fk_outlet` FOREIGN KEY (`id_outlet`) REFERENCES `outlet` (`id`),
  ADD CONSTRAINT `fk_paket` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id`),
  ADD CONSTRAINT `fk_pesanan` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
