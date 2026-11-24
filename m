Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539960;
	b=TTZUZnJF+Luu1RABAQ11y5xMLwljLO2+fX7hWfQJFG8CDr/F/Ju35xhoraW+ePVVwuE/
	 RcywrNDzVKdr1tnpA94Bv8K6fMKZZaOTL3fcWyeDzgEri8vqT1i6giO7eP6Iy1wE8prO2
	 1e9j0Vsf2kbLACyRTBbsHdool4OWh8c+bZNqgqqVAuPBsAApVsiVD8XAwgBPf55TrSDoV
	 5AuGQUf7u0wXc78l38H6zeSgUi6WMAHy+LPWbL+gCvOtuYXx/yXPS4eeXMd3yzgoC6gOX
	 7zrfyWGiq/7Dm8xHJNVR+vDarSwd726pvYLiDiMf/rVNN/02hLTmq6BTDH4NTN9KIfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qs3FT83kQsPCphE7Ljd88j5encnRmoq6meY0QuEebxs=;
	b=BN3w78JdzBfLnXQw4wLHNTo4UbyVkSJ5aFsionuN0Uq52z8ZpRVoDj5/PDoZYnJ1KHBD
	 TcEEfK5+gQdjuZl2G7/UZ1VvPvZIlgJC30DuHGUe96cHgZ8XegCHyH6keeJJDVEzJ2jAN
	 dUg0840p6qMwh9yEN1smN+CTTaIX9+8nRbpLxzxbkoH680xZWf/5xE5dEkMpvJQxZQFSk
	 IRQfIXhVQ51kH41odEFmm50WhnCwGXLy9aL8WPVJ55p6s877qSM30or39o091Fv0sME1R
	 16RFTs+TXwYdirrQxvVTM69NzXsKvvd3HYaTXDel+xkcHRyLei0pS3cMa08GCqH3nVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+PthrNV;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A82606A33D
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80A82606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+PthrNV
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-9213f004a14so57574416d6.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539959; x=1796144759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qs3FT83kQsPCphE7Ljd88j5encnRmoq6meY0QuEebxs=;
        b=C+PthrNVdT8VrlTuLm/Zy6cSAsh/eeuD6WH8AzzTVnTAVTf2C/Ka57QWYf34RLMXo6
         79kXmgafd9ZSETPolw97hr/yKmOZt13F841ZizDsxE729hwMUidvXIfvtw6rjkFxYRJc
         l138GtboslK4ziSo0hWAGmt7ma2UyMbCOfEwUQmeHDdejHdn7WPCg9lZ5kG3dGXHPbZE
         09oqpLIoIwtrKTdhiDnfSHnoxiqdL8rjoJEIkoQ6aKNNyKylhvw9W1LJZUTk0BuGCk/C
         eYUhOGLej/ShxInPEWam7dR9AsDDt0ocaeiPjS+1nbmED12NdeRcYEVsuYBICrO5WTEv
         XPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539959; x=1796144759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qs3FT83kQsPCphE7Ljd88j5encnRmoq6meY0QuEebxs=;
        b=VOkX4rUl40K4b7KchTKJapvrK2y4cCWP+FSIykvjrbksecBLXA0FQt26IdUlL5HEHD
         uNkX34TH1nS19PreStm7q57xoa1hGsNh0sKlkIsMBNrolU4MjZ6sJ9PBSH7cGXDeHpDp
         i+SwrEEsa9lS7UrVi6qlQDdxCpqMmj2nE8s1aUcy+JVl55nAsOGQtK7kpTPMqeiojk97
         Z6ng2nX8OVVGo34PnqL+EfeXZu1cbKK+GsDlab+HkYOjogd93gRtVi3YrlRZEXh+gWlX
         6IJ5x8v/tocY0so1+TuznsrANQB7Ourdu3XsOC3Al54BNm8M4sN9KZooTKx5pE5AnCKg
         L4dg==
X-Gm-Message-State: APuU4Z8WTEBczZe4BpIiztxDBVaiZaoCm1DUZfcsGjwv4v/SDFGdUdBV
	8V6NK6Qhui+ZJLFMPo+3VYOVqa4p5yQn1+sGRlkWGVlxBBibYprcAGkkDeVEJw==
X-Gm-Gg: AZFdTZdfcqjs+bvfHq6DVT51mDjQIAMCy8yZ6gXm+lvFjs/boLPh2nz1dAWsRI0b6Ni
	bdDnWkCCV01o2u1o9lLGq9W3ay0ihEuMpwl2aEbfSuCyH6IJxCAQsZt+NX7c0PCzIjC9sVkvI2g
	Kn42oejKWkOdbg84MegQ5PF9lPR7IwnPeKajd5ipfxdRzasA4VNOj0A0x/BSUMjwqA7S1lmKYPN
	3ZHDlOvwe5fHeDDme+ZCZ/TGwU9Tz74KF6CqkLhmCAfbxxQXdHOSaY4ac3l6iermM84kHeiTM5c
	/Xi5vM5hyA+G20ItDeIfHLEKmbQBqIOzs6it/W/MQNebW0No/jXakE3Bsn8UDsKRVGESeEj586X
	ZySMC/qODkCUKBSa4GVARM4dQh2RchOOCSGDEEHpGqj8/85F1sr2m5/Z0kTgZjlvL6v7sRc7EQ0
	NtJNMOSf4I8g0ClvuljtA0dXCEDIbqMRVVZ6Way/Vxja7OlDWUbv5+MLfIlX4vu3yGm1vaueh+p
	qBrxZe7mdkc27iNVZryif9Og4P4KFz0sQQ3KKHGqSq3LNt9bLo/LQZL501jknr3jhfw8wfB9YsX
	Y5SmbIVR2Mrt9S/5q252SzRfHCgjs7Yp83P8ub/f35RkcXFwZJWbunD3qeoLx+Q4ZRFFVOvwarV
	ogdxWECROCHrM5umIq87F4UJynwC1ngP9W73o1TowL1aL2BR+84VSNp/M+/mkPw4sHFKbxW9w/O
	gziwb9Avc7W5HATFusy0PzVGcAKoSXYqY=
X-Received: by 2002:a05:6214:8616:b0:91e:b488:5e30 with SMTP id 6a1803df08f44-92134b0f79fmr268106946d6.58.1795539959342;
        Tue, 24 Nov 2026 09:05:59 -0800 (PST)
Received: from willemb.c.googlers.com.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349cdfbasm140078216d6.17.2026.11.24.09.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:05:58 -0800 (PST)
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	elder@kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next 4/6] packet: reset network header on all headerless devices
Date: Tue, 24 Nov 2026 12:05:42 -0500
Message-ID: <20261124170551.1874487-5-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261124170551.1874487-1-willemdebruijn.kernel@gmail.com>
References: <20261124170551.1874487-1-willemdebruijn.kernel@gmail.com>
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

From: Willem de Bruijn <willemb@google.com>

Some devices without a userspace-visible link layer header
(!dev_has_header()) still set hard_header_len > 0 instead of
needed_headroom to reserve space for headers they prepend internally in
ndo_start_xmit() (e.g., PPP, mctp-usb, routed br2684, and previously
sit). On SOCK_RAW sends, af_packet reserves hard_header_len and leaves
skb->network_header pointing that many bytes into the L3 header.

Commit 88a8121dc1d3 ("af_packet: fix raw sockets over 6in4 tunnel")
added a workaround in packet_snd(), explicitly noting in its commit
message that it was temporary and left to be cleaned up in net-next.
That heuristic misses longer packets and misfires on non-Ethernet
devices with a link layer header where min_header_len is 0.

Replace it with !dev_has_header(dev) in packet_snd() and apply the same
in tpacket_fill_skb().

For consistency, also switch packet_sendmsg_spkt() from dev->header_ops
to dev_has_header(dev). This has no effect today: the only header_ops
without ->create is ip_tunnel_header_ops, and all devices using it have
hard_header_len 0.

Signed-off-by: Willem de Bruijn <willemb@google.com>
---
 net/packet/af_packet.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index e8326cade94a..bf0ad6d5c1e3 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -2039,7 +2039,7 @@ static int packet_sendmsg_spkt(struct socket *sock, struct msghdr *msg,
 	if (!skb) {
 		size_t reserved = LL_RESERVED_SPACE_EX(dev, hard_header_len);
 		int tlen = dev->needed_tailroom;
-		unsigned int hhlen = dev->header_ops ? hard_header_len : 0;
+		unsigned int hhlen = dev_has_header(dev) ? hard_header_len : 0;
 
 		rcu_read_unlock();
 		skb = sock_wmalloc(sk, len + reserved + tlen, 0, GFP_KERNEL);
@@ -2638,6 +2638,8 @@ static int tpacket_fill_skb(struct packet_sock *po, struct sk_buff *skb,
 	} else if (copylen) {
 		skb_push(skb, hard_header_len);
 		skb_put(skb, copylen - hard_header_len);
+		if (!dev_has_header(dev))
+			skb_reset_network_header(skb);
 		err = skb_store_bits(skb, 0, data, copylen);
 		if (unlikely(err))
 			return err;
@@ -3109,8 +3111,7 @@ static int packet_snd(struct socket *sock, struct msghdr *msg, size_t len)
 			goto out_free;
 	} else if (reserve) {
 		skb_reserve(skb, -reserve);
-		if (len < reserve + sizeof(struct ipv6hdr) &&
-		    dev->min_header_len != hard_header_len)
+		if (!dev_has_header(dev))
 			skb_reset_network_header(skb);
 	}
 
-- 
2.56.1.839.g22a8290db9-goog

