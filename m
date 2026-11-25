Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634095;
	b=Bw2yNl7LOk06/GvYz23v5gNkXqqKJUwr3k4UBTf1pmKvEZF5RD2AEq0aiMxKTLImeDG3
	 4fB3/snOXoggjKWxCOqhfWOymUs41JE7xYd1VubkBbeP4mUhVXEofufGYrr4LO0DkB5Xx
	 9S69H3Tw6YbmAmfcoddUIOloseZJOmBOxr57RRcLilatH0ci8tVFMd2/8kLFcD+/4TTGs
	 b9jjaX2nLG1znNwYDXjCcTCuCHlruO4UUdqDUihoEPG6bSkK+CV5AnuVX7RjfEh0Hsdol
	 WfwGKbVkigjMXgXvyxMxuB1/1TCJfxe4M88TanQfUNhOv7WXpdYV+p2Gbk1XvtXQ5Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/u8JtBXWrTUayWu9Ilvo6hMsG+mxMh8x/BdVXPiMsSk=;
	b=lWSggROxwr3n6gXpmcC+Dfp13stut2AerIVhAkFP9a9D0NwC2KfTee2GWB/Van9H2ABm
	 EkwROi0d40k7pS+0ntE8KyRGBEN6GnsHSyd5LmfqtpilgcOQY6u9tEsIfIK/mu//vGuQb
	 +FX/ea3hgqYdZ2l5YVWYylmN+JtCaWyqg2CwZXhojEXVC2wUrMiVtUwChsef+ooaOa+mc
	 zVmsuO7nJzuXI0dQlOEZyUuUYuQEVaPqaqi0tX1QfZr64ZCe5P9FiFjZV+4ivakLH+xm3
	 XcdJyoTnHUwrsJkyYCDsCq9mRKWauEmzVVs8j0/zzazytA3ki4PBnIdSKowqjgmdkJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=O2aUqdxr;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468FA606A336
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 468FA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=O2aUqdxr
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb2893531bso3267149a12.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634093; x=1796238893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/u8JtBXWrTUayWu9Ilvo6hMsG+mxMh8x/BdVXPiMsSk=;
        b=O2aUqdxrWCjg7dDaNkqMKwj5QsKJip9yrAyWbYm1i6328Dt7cKh9pGyObbHSa1MTgu
         OUjc9PiplFLo+3+r3EF+2qr7fnF0CctereiYWoCsaJOOY2WoVj8f2672qHEoXX8IR0aR
         XnvpywPlrIDlW4G2EoMxMLo8kslAPvSsxr9vab0Utc06SkccZXW2It83xdGu2J/4azVB
         Azh0srKy7BVovY8LxDSvnKpTd9lnrMohr48NPssmVDPpeFGnfYWJPqchDfIC5eFEG2tQ
         uR7XAVZFusswf1ukpVOsLo+vpoJ7BGqEz8ug2odaw7KGOqOWGSd6JN2TIIdzqD3r0fVx
         srQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634093; x=1796238893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/u8JtBXWrTUayWu9Ilvo6hMsG+mxMh8x/BdVXPiMsSk=;
        b=GimjaKFrA9phG3JrJLN3/OYK++NY1q+4vg+zJFVIKQBGoamUczsWmbwLyhwJj6Grah
         I2U/rvDdAFjMf5YAl2tQM2TrE94TJda1FJ6kPM/LxEo5qV2eAD28NZX4iy/tV4DnY2v+
         u+0fHVACUKY5BadRL89vRd1RknxJUrtYo+gnCjK/L5ZhJebqiltJfTxGmisLc1izlA4f
         jGM4DlflWOmvBDxtQXahI+LiSLDOz/JEM223ndtK5+bFikMtZrFNLcxwCrozR+6FpLVt
         CfCGG172sB0kpecfvMmOROCxeOyPtm4XiwvbuW9ykOjIylBf3bomh2UASXegbpYOZhFg
         bw9Q==
X-Forwarded-Encrypted: i=1; AL+hErHIjg2fnvZRjJhDsXD0XOtpXCuC8lLJYBZ3sGQUto9RJ8HfB49vwI4cVJIejqXAM+FG7ujvHHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OX3dX3vREB9VV34j36/mgnUzKh0xoEpymd1thx2XbR86mP+Xc
	T/2Paai7fobqOaLMWW8wykN6GanTO3jCtEoe7xQtJqPhHmeOnEpnIFQN/rxHa3ZRQlw=
X-Gm-Gg: AZFdTZf0jlhmufBmJGSaM6p5oyUHA7D9IAjhXrokxh0ZHvrvVBXdBTjqzLeuHqECWUs
	JkV+joI2xzCF4QIxi3NQwS8KbwLsGWfLOZYi2X9PQRwMYPJZQlEFzYMTWNGyJsvT5PT+ae0a5jW
	XJYfZXORPGoF1xpDvMiWjUmWABgk2gTQMjOsXGmhwWWMG1FBdouOuQd817K/iw5dReFriep1Xgk
	KITv9Cz8PMJ6I6pTMYPpCgQOU7EuPpS/3JNoJm4Zvia+h5pORMrfOjBHGhnRZMoe+JTIXZB6Bcz
	vil9XoIc1x0bV6bsxmiHsG9USNeuumrfLVXctp+te504mZV8sDhkLyYXR7C9rYVeYvthpznsHCT
	OI2RzCvU45GZB5nDt2FyvSyFIMKVG60UtcZgDefZ5qBJb1+GCFxI7oeRNDzCA8iuF9lSgGqIx2t
	21Pm1dCOkWnZrugROe7nkpbp2ozBomqBwstaH8WeT/gkWI3HieDfuoCqnwdeUcUklBfe3s4H9+/
	CzZ0mNLehH8G/ijY6Pu4gXb5Bxnbr+61LYo/2PRF+us2UTucNXqjuhRRvDJ4MsHBJft8mtu3MbC
	fR51Xwvb5Z0ogKlLoKb6O8rUR+Q1eMUp5aJsp362bFg9384QrujxmNVdqv4w32r2NTGy0CIG1GC
	oJA45n63AR95112jOQqk8W6HL7r7Z+QkRmTZ0xfCOmaWfVyPGlXY=
X-Received: by 2002:a17:903:41c2:b0:2dd:b795:9cb6 with SMTP id d9443c01a7336-2f03f1cfad8mr200173395ad.21.1795634093613;
        Wed, 25 Nov 2026 11:14:53 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:14:52 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 01/12] amt: create an AF_INET6 encapsulation socket for an IPv6 outer address
Date: Wed, 25 Nov 2026 19:14:39 +0000
Message-ID: <20261125191450.2497936-2-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125191450.2497936-1-omar@blockcast.net>
References: <20261125191450.2497936-1-omar@blockcast.net>
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

The amt device binds one AF_INET UDP socket on the relay port, so a
relay and its gateways can only talk AMT over IPv4. RFC 7450 defines
the protocol over either IP version: the Relay Advertisement carries
an IPv4 or an IPv6 relay address, and s5.2 selects the form from the
IP version of the outer header, so an IPv6-only access network needs
an IPv6 outer transport to reach the relay at all.

Add the outer IPv6 local address to struct amt_dev, and amt_v6(),
which reports the device's outer family from it. amt_create_sock()
binds an AF_INET6 socket for an IPv6 device. The socket sends and
verifies the UDP checksum, which RFC 8200 s8.1 makes mandatory over
IPv6, and it is V6ONLY, so that it does not also claim the IPv4
wildcard port, which an IPv4 amt device in the same netns may hold.

The socket is also bound to the underlying link, IFLA_AMT_LINK. The
IPv4 paths pass that link as the output interface, and an IPv4 route
lookup then only uses routes through it. An IPv6 lookup that has a
source address, as every AMT send does, treats the output interface as
a preference unless the socket is bound to a device, so without the
binding the outer IPv6 traffic could leave through another link while
the device's MTU and headroom are derived from this one. The binding
also keeps packets that arrive on other links away from the socket. A
link-local address is unique only on its link, and relay tunnels are
keyed on the gateway's address, so two gateways on different links
with the same link-local address would otherwise share a tunnel, and
the replies would go out the wrong link.

The new socket also hands ICMPv6 errors to amt_err_lookup(). This relies
on amt_parse_type() pulling the AMT header behind the transport header,
as "amt: pull the AMT header behind the transport header in
amt_parse_type()" in net makes it do, since on the error path skb->data
points at the quoted IPv6 header.

Nothing sets local_ipv6 yet. The netlink attribute that does is added
at the end of this series, once every path can use it, so there is no
functional change here.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 36 ++++++++++++++++++++++++++++++------
 include/net/amt.h |  2 ++
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index b145ed3ca..3f3205d2d 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -90,6 +90,14 @@ static struct in6_addr mld2_all_node = MLD2_ALL_NODE_INIT;
 static struct mld2_grec mldv2_zero_grec;
 #endif
 
+/* The outer transport family is fixed when the link is created: an IPv6
+ * local address selects IPv6, otherwise the device runs over IPv4.
+ */
+static bool amt_v6(const struct amt_dev *amt)
+{
+	return IS_ENABLED(CONFIG_IPV6) && !ipv6_addr_any(&amt->local_ipv6);
+}
+
 static void __amt_source_gc_work(void)
 {
 	struct amt_source_node *snode;
@@ -3310,19 +3318,35 @@ static int amt_err_lookup(struct sock *sk, struct sk_buff *skb)
 	return 0;
 }
 
-static struct sock *amt_create_sock(struct net *net, __be16 port)
+static struct sock *amt_create_sock(const struct amt_dev *amt)
 {
 	struct udp_port_cfg udp_conf;
 	struct socket *sock;
 	int err;
 
 	memset(&udp_conf, 0, sizeof(udp_conf));
-	udp_conf.family = AF_INET;
-	udp_conf.local_ip.s_addr = htonl(INADDR_ANY);
+	if (amt_v6(amt)) {
+		/* Bound to :: by the memset, and to the underlying link: a
+		 * bound socket makes every IPv6 route lookup strict about
+		 * the output interface, as the IPv4 lookup is, and receives
+		 * from that link only, where a link-local peer is unique.
+		 * V6ONLY keeps the socket off the IPv4 wildcard, so an IPv4
+		 * amt device can use the same port in the netns. The UDP
+		 * checksum is mandatory over IPv6.
+		 */
+		udp_conf.family = AF_INET6;
+		udp_conf.bind_ifindex = amt->stream_dev->ifindex;
+		udp_conf.use_udp6_tx_checksums = true;
+		udp_conf.use_udp6_rx_checksums = true;
+		udp_conf.ipv6_v6only = true;
+	} else {
+		udp_conf.family = AF_INET;
+		udp_conf.local_ip.s_addr = htonl(INADDR_ANY);
+	}
 
-	udp_conf.local_udp_port = port;
+	udp_conf.local_udp_port = amt->relay_port;
 
-	err = udp_sock_create(net, &udp_conf, &sock);
+	err = udp_sock_create(amt->net, &udp_conf, &sock);
 	if (err < 0)
 		return ERR_PTR(err);
 
@@ -3334,7 +3358,7 @@ static int amt_socket_create(struct amt_dev *amt)
 	struct udp_tunnel_sock_cfg tunnel_cfg;
 	struct sock *sk;
 
-	sk = amt_create_sock(amt->net, amt->relay_port);
+	sk = amt_create_sock(amt);
 	if (IS_ERR(sk))
 		return PTR_ERR(sk);
 
diff --git a/include/net/amt.h b/include/net/amt.h
index 9ba097127..ca35782f8 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -361,6 +361,8 @@ struct amt_dev {
 	__be16			gw_port;
 	/* Outer local ip */
 	__be32			local_ip;
+	/* Outer local IPv6 address, :: unless the outer transport is IPv6 */
+	struct in6_addr		local_ipv6;
 	/* Outer remote ip */
 	__be32			remote_ip;
 	/* Outer discovery ip */
-- 
2.47.3

