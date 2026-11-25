Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566174;
	b=T9ndFZHLw7/NwIn5J6MfvC6KDYUUGs09PhR24TffV0iUJJ9jgqgvH6yedBrvw4LMjyxL
	 p4hClro4YZqpHyXA7uskq6/fohaBtSYABxhuoHtBw5/ABF1vqxXtOA2qfeaFeVspRIYQp
	 huWyCuQKfiqotscvGxCYVkuHwxDoYp6eiEjYS1pQrBl7ZAWGScSN26lyg1t4dBxoJyDHB
	 2+KpiJbd9xuAl1LxLym6CKH9IVgEpVsGrhl01mZ+omBMHuIpzM8+ZJ6YAWFCShPrQcn6m
	 dMqIQqIBlImY1vd/1O8lX+L5rHItx81Vv2fppm2q+TYs6Fp9YLE0/b/ddEwTQNV8zzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/rA7aFNfGC87qi/noxx/SboGnQSZ6l67j7aYWk1zxoo=;
	b=1MQx4vbELKrXIZ7fphM0fFMvWkoVJzi5OpGrO1al1cKoV7XemP/bfDvB+X7lu/8zVqiF
	 WqcPoLeTvZN+XOsjNCM3SgT79sYKNJ+AwQ6JojLwjqXISyKbFcQuPna85LPhlzcVGPa4q
	 khX4ujggMtmCDLKG3+Jgp3mV5wLsHtcfDl7nJjnhvLTBpMTbABYxxey6dm8CRS8GkHcTJ
	 1nQ6pJ6wODZDRk0YTjmMuZ0Shrby3v95Qcpn8S5EN0FSTqcMiIp33nrd6Lr29+3K3aS0h
	 V+NcjJRqvmil5ZfXlRed1x6RELrRXsySvWF1qpRj8v2AJ0OD90+gZ2mHAeB39XO7NFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvpn.net;
	spf=pass smtp.mailfrom=openvpn.com;
	dkim=pass header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b=WAogHuIY;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38D5606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E38D5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b=WAogHuIY
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso50873825e9.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1795566172; x=1796170972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rA7aFNfGC87qi/noxx/SboGnQSZ6l67j7aYWk1zxoo=;
        b=WAogHuIYoaIEpDvI/k7EwUCr4euu1bosxzz/onesufSWV5s2hFunm7EfVz5NPwCMFk
         PpVl5HGHqEDmcWdiUgro1ThexEG/GjgD1le02hVYFCZCyCfw7KIqSyQeSxN+nKXlNKfo
         Go5euykViOOsty6jgnAV4VA0pzr6y1/AmF78B0xw1s0g34vDaiiHCEk61lmkZUSIqsK+
         UlMBVaT1YAVCigxUy6AwdFBvvZ97NyYxur1Y8kEOlSE4nUMej+WHMRW7tWJ8rkyiJ67/
         rW5F41WqiTEKVJ8eKs5yPllxS3GS8mJssQCuJBPXQqCv0aqws1RqNHpixO3dAtchmTpq
         nMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795566172; x=1796170972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rA7aFNfGC87qi/noxx/SboGnQSZ6l67j7aYWk1zxoo=;
        b=GS9z65bCwvkv6noKIUQmZ7IJv0pAch9mzm+jrdu1PH3X9q21D5/38+fjzwAw4jjf4B
         8YawxVrW6zYnrCuIaW92yX2TXm+zFuk0GC8P5Ei4xKTIir6Z4OFyAx2+snwlfyL19N50
         3XxhUPw14VW8Z4gWFnQ+KWCrl73VcsTUbz/9bPf39XFFNWb0vlHK18I+s0CHl7PTXZF8
         MBDXkGMvm/F/nrIV0QlaDvkx/xH0RFod2WCXMYX4OJIQIpp13vFxGUwcaHNZq38ShvXL
         FWl5+874Q0h72eRGezLabVT78v0xJ6pdB4JYAgCA98mBXhANNuQSslYdztwXWWjysDDJ
         hJSw==
X-Gm-Message-State: APuU4Z9qFlkXLqS8451rHnuGuS+C4yjnLc3eNBNCBtdNv4yt9l7nXhdl
	l/Pdi2XhfAjXqxEMK94w1UKfl/nKn+sR7NgMmn8z5PqGBxVYbee41y2sux4GPVM7bJU2pCiEyT1
	ozAX4VtelT6Vqj7ASMDme1/jzyDJvjv4LKxMVgIbDkybc0nBbrOKJ2cjLddECabnJa/M=
X-Gm-Gg: AZFdTZcXWvuK6/EnxqeC3pnPt7N7fSW3hYrjsTVIQo1WhmyOIoBjkdAbn4fCXSVn8mS
	PEuiPFKkw6JF9MChX47btwc6gXtmYmOLfVlCp6gN631QjIjhThXlsUY2FmI/oWhH9kNxlHLlElF
	UtaQGcNF+4xgRv34kMWYnqN5mqy+8jnHveJs389Lv6H96RNsfCaPw0ifPaZwzzCY98iQyqTuNWo
	qKlUMJjMeSVCfIxinf5iWygyDedIur/xWYnjs3qrF6f9LE/M6tzbw/c8z6nTUI0DaT5DyErDP3Y
	kBXR+YMKH/7LMJfHM0oU2CF4aWa2VrWpfAzK2TwjqC7YWVT4cB9xCEKkHtteFh+aRdtzMKdcBBv
	GO6GZedShJn049bXN7iop3vrTxohBig3PudJ603QnhlrEKjJJ4dCkyCz4anYCemohkdSnBK7S7V
	CfXtJYwLcnRTwcKirr14flTI5yXmUaRNrJza6jUQ/3VPIUmxiVCj8T/ia4NiG97dWx23nDosaoS
	XWaK8vefN0CCeemomljFWqeSBB5jmakMLHGtYI3wv/Sj9Emo6Rq+f8Zm4LrGnMephLQSdukOtiV
	oWahLEhY1ZzyG5f1k70RP/9FqCiVgX+vB58rpQkjYx7kAjYPtb1J
X-Received: by 2002:a05:6000:1a8f:b0:4ae:43e9:da61 with SMTP id ffacd0b85a97d-4ae43e9daa2mr25718020f8f.4.1795566172340;
        Tue, 24 Nov 2026 16:22:52 -0800 (PST)
Received: from inifinity.homelan.mandelbit.com ([2001:67c:2fbc:1:5c82:5cd3:7bc5:2809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm31518448f8f.16.2026.11.24.16.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:22:51 -0800 (PST)
From: Antonio Quartulli <antonio@openvpn.net>
To: netdev@vger.kernel.org
Cc: Antonio Quartulli <antonio@openvpn.net>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Ralf Lici <ralf@mandelbit.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	stable@vger.kernel.org
Subject: [PATCH net 5/7] ovpn: account TX bytes like RX
Date: Wed, 25 Nov 2026 01:22:36 +0100
Message-ID: <20261125002239.1191542-6-antonio@openvpn.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125002239.1191542-1-antonio@openvpn.net>
References: <20261125002239.1191542-1-antonio@openvpn.net>
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

On RX the netdev byte counter accounts the decrypted payload, but TX
does not follow the same rule.

For UDP, the tunnel helpers compute the packet length from the inner
network header, which ovpn never sets: the value is inherited from the
plaintext skb and may point anywhere, leading to random counts. For TCP,
the whole encrypted packet, including the length prefix, is accounted.

Mark the payload with the inner network header before encryption and
account it on TX for both transports, as done on RX and by wireguard.
Userspace messages sent over TCP are not encrypted and are still
accounted entirely.

Fixes: 08857b5ec5d9 ("ovpn: implement basic TX path (UDP)")
Fixes: 11851cbd60ea ("ovpn: implement TCP transport")
Cc: stable@vger.kernel.org
Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 drivers/net/ovpn/io.c  | 2 ++
 drivers/net/ovpn/tcp.c | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ovpn/io.c b/drivers/net/ovpn/io.c
index 402a74a2a27b..a11ad979e9f3 100644
--- a/drivers/net/ovpn/io.c
+++ b/drivers/net/ovpn/io.c
@@ -328,6 +328,8 @@ static bool ovpn_encrypt_one(struct ovpn_peer *peer, struct sk_buff *skb)
 	}
 
 	memset(ovpn_skb_cb(skb), 0, sizeof(struct ovpn_cb));
+	/* TX stats account the payload only, like RX */
+	skb_reset_inner_network_header(skb);
 	ovpn_encrypt_post(skb, ovpn_aead_encrypt(peer, ks, skb));
 	return true;
 }
diff --git a/drivers/net/ovpn/tcp.c b/drivers/net/ovpn/tcp.c
index 5340860c0b82..00cab8d2aa6a 100644
--- a/drivers/net/ovpn/tcp.c
+++ b/drivers/net/ovpn/tcp.c
@@ -294,7 +294,8 @@ static void ovpn_tcp_send_sock(struct ovpn_peer *peer, struct sock *sk)
 
 	if (!peer->tcp.out_msg.len) {
 		local_bh_disable();
-		dev_dstats_tx_add(peer->ovpn->dev, skb->len);
+		dev_dstats_tx_add(peer->ovpn->dev,
+				  skb->len - skb_inner_network_offset(skb));
 		local_bh_enable();
 	}
 
@@ -446,6 +447,8 @@ static int ovpn_tcp_sendmsg(struct sock *sk, struct msghdr *msg, size_t size)
 		goto peer_free;
 	}
 
+	/* userspace messages are not encrypted: account them entirely */
+	skb_reset_inner_network_header(skb);
 	ovpn_skb_cb(skb)->nosignal = msg->msg_flags & MSG_NOSIGNAL;
 	ovpn_tcp_send_sock_skb(peer, sk, skb);
 	ret = size;
