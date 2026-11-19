Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099390;
	b=t50UFTnBwnD4vtvCWnvamHqBWKG6b9n6YDj1DqyiXIgKuEzF88OeWDOIdQe3CEdClqBk
	 vmNNUQC/hJqWYOKl7woWgzqfH1AozUdZMFHcDD9x6agjEqt6n36KQFZr+xczq++dgh8x0
	 0pvlMNyYPIgZuUKLF9HdMvUJawzXQjAO5YevkiHmgsWPOsPNWdedcwo93SPARhHHmntR3
	 daa0d03ucxewmeHS6BUVfkbZxNkl2ljweaXjTbXd8MIq9Zc22JFZ4H/XcuZS2W0sya9u8
	 J5B3RwM1wp3QRD75aSi86bbX96Gy0vvYEOjO+TFoKwY7iCFnzRpkgfZkKNt4YOBL6aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yiNGMOZ+T2aYXndxp6WNW2Z7eC3xgYW0cACgi8Pfxp8=;
	b=NejuJgT2kqoLvtxfcg4AAAayRUcZaTOG8wYA7yO1KH9pmXUVdPa6Whlv9KAuNP3j1V5g
	 SyUj3+Hbl4Oe2yr7j5XDCq1qFGV5jXD7XK6UPhhDgY+AZ2kLiZrXriY4CwPZXeiOTxDOx
	 V9C4qPAB/3/H43BpvIx2NrSEWDNThoT5jt2ahydp6iDJxv43mKEEdyNdx0SDe49HEYudm
	 JJ/tnFDfvOKjnx7guBlj1jSRpSCXRQz8mnxyMGajNPKZbg9ap43cd0Ck/brfPFhyQgIDZ
	 LpWVRzejgI8XAKcFQVvM55nj8JeTRnnB+vFQI/jBrox01CXzsxnXZWXrmJFW1GVteVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCfnoQPq;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4460A2633
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3A4460A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCfnoQPq
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso3491421eec.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099389; x=1795704189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yiNGMOZ+T2aYXndxp6WNW2Z7eC3xgYW0cACgi8Pfxp8=;
        b=GCfnoQPqg+rCDFqYxBpm9AKziIf+db5ejrjN3XzIAVXwywCajnXzzh4eEwiI/gLxIZ
         p3UK5+dBJyUS386omtr4Clr/kiVXlfjqXMJ0glNBhMIymhCnApZybKHV4TvVXOh3Nv3u
         SpL3s6Jqd2BcoXEaaK72PMwWGlRZAogU1UNYitXhG997WzgzRAjMgEuQRqOtrT1xkf5u
         2RpdW2VwHA0Kvp9GEcqpN6VByZQ/nN5N24VOXuNR2hdxyy/eEAXMAn1gYbVTaHxUcXiy
         piaRAyK351lHRur5sX87av2ea7Afg0SQbGMaGezLO3veV16PwqNXXK4r34aNEIyyESz6
         U54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099389; x=1795704189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yiNGMOZ+T2aYXndxp6WNW2Z7eC3xgYW0cACgi8Pfxp8=;
        b=AL9qjZX/GGYc8SMFhbPRh7BgzhtBu/54RebRncT2OHV0hcIlEPUHRslBjkS70UkEbG
         ftEouJB4rJDeype1EPmQA02l35oLlVCS9OfM4NwPSdNj64xGRQ8dg9Uy5uUum6aYsW92
         Y+POxVHfrlKmPlm0Jb+5UVJq8v3fD9BSzOk3zQkqeSuzZEYugjB1SY+E/TKMf4D9qk4m
         +fT7WhrFH12jGwSg87fL5/KCKcQ0FMRjOKKA+QVXpiHO6CYE1X57qmcDCw5tEe2LPBF+
         cpT0P7cajaLEt6wBTWQmKbPVaeUSfbOQIjdxW+gp63CH4vBKi/C2xq1MIWtyK4nxpJn2
         0HoA==
X-Forwarded-Encrypted: i=1; AL+hErHGZjCAy74hq0nUnH/wrOdDBUlsaBuTJnO1/76G8enjXAsTU9i7FLwpkzUdUFQ5Zt0fMfcvPH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MCz/Fh/8RpQd9Ad+J18frl743mHAeYkuqBNosM6VJItB5/q+u
	0q3woEYp/Lggfpv+iKZHyS0LK9MfDWqizn/JJRzE/tcg0meYjiCY7EbY
X-Gm-Gg: AZFdTZclpT2ilmF8oCNPKn1JpG7U45U06H5XILruX9Nr8p8FwBzxWFkCKvEhoyqFov8
	Sgky7Yg7v0hL+FGd/LXSPKMaebmC91xu7WOn9CR++QZJcZtxnivBBWADWJHJIVuYEfbFuBPAHAj
	8m/Tx7e6258uYkOLhMvwCdmhjMUBqrS34V/IrbW+/wNQ1/eTxKO0XTrQlT3a8aJIedUCyhiuKx8
	CABtHpzQoRZfCESIejC5mJfC0AYn6un3vWTQORIdWDAa+WADbRIpbaeQvh0inpj1hsnQVP0zL4n
	X26foqkaJzfbBh+rQpJ+XCtLvE+cRbRiyTc95QPh2eCWMKWhysZUCwQ8iXFTDXCRkUE1bMZwAu/
	H3qCcdlBnWHOCovfc1mS4i4KTCdY3ePUqP8nWtRfuC8AIL+uVDcxkNVoEMFxTU19+Zi6fCOY10X
	/0yFnkGE4rfcuT4N9Rlp5XbVok2NyFYgcxx7wvUeDXiJWFxN7ySXyzat+9B3Vae0s90MWAt8mRc
	JLq0Iu6UsgMdGw8B2H/i9w4qKtP0410bGh9aFofdxUlhdEEoGf8ueFMRwvE+V+QtLNVV2J6M9Rh
	3hRP6/q6HmnSYnX0KbfhkSmTIehGJJKkxvX9klUHYDdwkTQdZA==
X-Received: by 2002:a05:7300:cf98:b0:382:7375:1306 with SMTP id 5a478bee46e88-38280a38654mr5978419eec.14.1795099388796;
        Thu, 19 Nov 2026 06:43:08 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe733dsm16682848eec.16.2026.11.19.06.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:43:08 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 4/4] selftests: net: check padded vnet hdr_len in tun and tap
Date: Thu, 19 Nov 2026 23:42:39 +0900
Message-ID: <20261119144241.360238-5-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119144241.360238-1-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tun and macvtap write tests with a 512-byte virtio header and a
14-byte Ethernet frame. A hdr_len of 256 must fail with -EINVAL
because it exceeds the post-padding payload. A zero hdr_len must
continue to accept the same valid frame.

These tests exercise the common header parser through both drivers.
On the unpatched kernel, each oversized hdr_len test accepts the
packet instead of rejecting it.

In x86-64 QEMU, the patched kernel passed all 105 tun and five tap
selftests, including the new cases.

Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 tools/testing/selftests/net/tap.c | 29 +++++++++++++++++++++++++++++
 tools/testing/selftests/net/tun.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/tools/testing/selftests/net/tap.c b/tools/testing/selftests/net/tap.c
index a0c9418132c8..bf5d36cf73c9 100644
--- a/tools/testing/selftests/net/tap.c
+++ b/tools/testing/selftests/net/tap.c
@@ -425,4 +425,33 @@ TEST_F(tap, test_packet_crash_tap_invalid_eth_proto)
 	ASSERT_EQ(errno, EINVAL);
 }
 
+TEST_F(tap, padded_hdr_len_exceeds_payload)
+{
+	const int hdr_size = 512;
+	uint8_t pkt[512 + ETH_HLEN] = { 0 };
+	struct virtio_net_hdr *vh = (void *)pkt;
+	ssize_t ret;
+
+	ASSERT_EQ(ioctl(self->fd, TUNSETVNETHDRSZ, &hdr_size), 0);
+	vh->hdr_len = 256;
+	build_eth(pkt + hdr_size, ETH_P_IP);
+
+	ret = write(self->fd, pkt, sizeof(pkt));
+	ASSERT_EQ(ret, -1);
+	ASSERT_EQ(errno, EINVAL);
+}
+
+TEST_F(tap, padded_hdr_len_zero)
+{
+	const int hdr_size = 512;
+	uint8_t pkt[512 + ETH_HLEN] = { 0 };
+	ssize_t ret;
+
+	ASSERT_EQ(ioctl(self->fd, TUNSETVNETHDRSZ, &hdr_size), 0);
+	build_eth(pkt + hdr_size, ETH_P_IP);
+
+	ret = write(self->fd, pkt, sizeof(pkt));
+	ASSERT_EQ(ret, sizeof(pkt));
+}
+
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
index 34de2580e32e..525fd588d916 100644
--- a/tools/testing/selftests/net/tun.c
+++ b/tools/testing/selftests/net/tun.c
@@ -683,6 +683,37 @@ TEST_F(tun_vnet_gso, vlan_tcpv4_gso_no_csum_64k)
 	ASSERT_EQ(ret, len);
 }
 
+TEST_F(tun_vnet_gso, padded_hdr_len_exceeds_payload)
+{
+	const int hdr_size = 512;
+	uint8_t pkt[512 + ETH_HLEN] = { 0 };
+	struct virtio_net_hdr *vh = (void *)pkt;
+	ssize_t ret;
+
+	ASSERT_EQ(ioctl(self->fd, TUNSETVNETHDRSZ, &hdr_size), 0);
+	vh->hdr_len = 256;
+	build_eth(pkt + hdr_size, ETH_P_IP, param_hwaddr_outer_src,
+		  param_hwaddr_outer_dst);
+
+	ret = write(self->fd, pkt, sizeof(pkt));
+	ASSERT_EQ(ret, -1);
+	ASSERT_EQ(errno, EINVAL);
+}
+
+TEST_F(tun_vnet_gso, padded_hdr_len_zero)
+{
+	const int hdr_size = 512;
+	uint8_t pkt[512 + ETH_HLEN] = { 0 };
+	ssize_t ret;
+
+	ASSERT_EQ(ioctl(self->fd, TUNSETVNETHDRSZ, &hdr_size), 0);
+	build_eth(pkt + hdr_size, ETH_P_IP, param_hwaddr_outer_src,
+		  param_hwaddr_outer_dst);
+
+	ret = write(self->fd, pkt, sizeof(pkt));
+	ASSERT_EQ(ret, sizeof(pkt));
+}
+
 FIXTURE(tun_vnet_udptnl)
 {
 	char ifname[IFNAMSIZ];
-- 
2.43.0

