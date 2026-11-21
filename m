Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222121;
	b=sqT/lwHndZ+Kj6ifb/XJ05WaJFgnoNWZZ6JOlGcbHa9kGzmjWYyOENx4f/d75/zC6id/
	 oTt9cjO/QlO0uPYjgdC2AM/5l3s3Crs6o5JlSppsS748kunYv1tWmqeZLVtq7JT9/3nEa
	 gp5dBuId0oiLq0Y7X3f0+KQXH2yMe2TmLvyYuCmMAcljsSEpviyClvHp9TSJWgX1+QYYa
	 OAS+IKFgKKHE19U1kmeXxF1K5Amq/Qy7ak5J4NMNZ3HFF9rJNfg3cok4RZFPBG4AWYy6z
	 2fHqynOO+YMGvYW61w1MG93v9/zjJcozPuusx7ria5Q7Me3pTgVKFGUG/UARIk5vyTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BEtJ2WqP+tt8+GCKUKFKbF/kVpKNshkodDn0UiC+JrM=;
	b=Rfehsr/+K3F0Dxe5n01B7IwRTYNVrpvc/9jZfWhF9VnfqDVJNlgJRODX0vlET7Qy11BT
	 NAaN7kVRgqgCI87UQqba9GNwNoACE7mmTHboBTJ9Gxe2rzpw80fHBifQAWTsu4AoGSNq+
	 1nKrRTI/jtN/ueNtcSaVf34H+zCd0OZPdeVBDOaZp9+bZXuN6NyGTMBqezbCgTKqreaXO
	 zcZWx5KzoRuTBtuvPc0TkGR61uhaMtGZ3NgHRpx5zk5h3tvRy3EwTK1G2zsQuv3hzekb5
	 WiE+nXgY/EJdkx/z4NLES3CY06ELLQxZ0V+DFIEHY2fTqjLHN7kpaKDZLqQaerhyqXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AfgFQQK1;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC71E60A6F44
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC71E60A6F44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AfgFQQK1
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-170135e43c7so2068644c88.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222115; x=1795826915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEtJ2WqP+tt8+GCKUKFKbF/kVpKNshkodDn0UiC+JrM=;
        b=AfgFQQK1ZDfym5EHT+6HaM+mNzpAoHF24RUdmmSU41Esftpdja/V1jT7HyuCZ4Tecz
         wYZQaPRjZxnC2fgPk1GktlFeMq+txDoeVssOOjm1TqERwXFxbkWNLoZHKFjgtFwMXMKL
         1mDt3GMldQyjea29BywWnsnlE9Hbambv+Fy42p24x5Ley295XWbaeshJs6lsl3p2Pd2T
         AmXuFkINNNBcUCmA5ths+wvw7Mr4jUBHaiJVjSU7Gxvt1TTsHeXdEVnPFPvULN/EzXs2
         T2Nj2xJ3N0Y8FOvFpK51bjxvy7L5m29uN81GHx4zqTlgPk2ZmWPtLog7DtqySBW1oBxx
         Ck/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222115; x=1795826915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BEtJ2WqP+tt8+GCKUKFKbF/kVpKNshkodDn0UiC+JrM=;
        b=PUfsXyF8SiMmCKyRQfRgvM5HPkoeZDZKfhxTNYw1uzbAl27CFeACeFKY5RKukts1C3
         EUgLaZsbE/WMhewgOBB+cBeCRp7qckToqtgkMPGQrvTDIg4BAcUU0U5U6TcB2sJkNlId
         +c6PPLyRdordKI3/YnLMH2RYSfhyBeof1SEKrNYqG/4utGwVBO2BTJkEfPhkbhmQahlD
         ogvFrKFL5eW1H+X3qVi72EeIJXUKaw6joU6BuNlnve4YyrEdI3TzwJPMik82ctFcm376
         u5NXApjbmZkXlhBbQe8ysfjXs9ZS6nbcYzjM+xUxVfJMUp5x4JvboYW47lfqPccmYsv+
         V3ag==
X-Gm-Message-State: APuU4Z9v7iyw1cXyXCiMul7CgEezL6PEM4PawtlB1IbdjvNyzW97zk/u
	dPzxSx+Qg+A5tp1lC/TpG03cuABMxwR3g9eiCUCSKV64zvlUa/e6XB1W8krLdA==
X-Gm-Gg: AYBFou2V2Sc2U6HxctBjpV84VP/iFXXlK2fATW1BeDEhpuGlDKrJWsPHy7/uMhn248v
	ZfJmmjARo/O5aJrao2NyBcja8tvNCgcSwrhDNMOAaWHScP2ekDfbIzcyw/ad2fdn/n+an6sn8EO
	rLLz9L4trvM3mDzKnKPoZs7diVDB7uCuRETR8l/OYUlCMLgJYsumIK9cGEy8BJTP9DuwtIvMVMC
	DilPblsbCegO0YlBvvJRZSqxRBkXyK2YhaBgfrzNKpmPkKK4Rr5qg/SrTZASnpO0sHc3zLsghNR
	tsN+kDUZd/zTv3/uPZi2sFsy7gxTYz/iYjFbOg4VKmfeK9OL9NE+J5DKneBCzjch1rImj3/oo4l
	Q4ywkBkRdlIlGSirCb4HIm1MvwhW/HJ/BwcbT5w8xOMRKIKNtNe65CNb1seQeS13K4/DSRvA+Eb
	kUrS285cy/UkRGcRHJuGD5CeFnbQ84Mk2CpqBCZAZvkuML3ZW4F0engWYo+Mt7Yno6IOudO0L64
	AbV/pfzqlKb7hp8ALGOePJyvZ6STJZGya93UV3RzrjfjxFJopjPd0Q4+TFXg0Pa2w1s8n7PUF2o
	qM/E/1Ci
X-Received: by 2002:a05:7022:b0c4:b0:1b3:b455:93db with SMTP id a92af1059eb24-1b5568eec9fmr4623791c88.24.1795222114969;
        Fri, 20 Nov 2026 16:48:34 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:34 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v4 10/10] net: au1000: reject frames larger than the TX bounce buffer
Date: Fri, 20 Nov 2026 16:48:09 -0800
Message-ID: <20261121004809.1690280-11-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121004809.1690280-1-f.fainelli@gmail.com>
References: <20261121004809.1690280-1-f.fainelli@gmail.com>
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

au1000_tx() copies skb->len bytes into a MAX_BUF_SIZE coherent buffer
without checking the length. The copy can corrupt neighboring DMA
buffers or run beyond the coherent allocation.

AF_PACKET with PACKET_VNET_HDR can deliver oversized frames through
both plain sendmsg() and PACKET_TX_RING. In packet_snd(), a nonzero
virtio GSO type bypasses the MTU checks, even when the supplied gso_size
is large enough that virtio_net_hdr_to_skb() leaves the skb non-GSO.
Genuine GSO packets can also reach the driver as oversized frames:
au1000 has no TSO, and software segmentation using a user-supplied
gso_size can produce segments larger than MAX_BUF_SIZE.

Drop oversized packets before touching the ring or copying any data,
and account them in tx_dropped. Use an IRQ-safe skb free for netpoll.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index aa5fa318b23e..3e4335368837 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -1091,6 +1091,12 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
 	int i;
 	unsigned long flags;
 
+	if (unlikely(skb->len > MAX_BUF_SIZE)) {
+		dev->stats.tx_dropped++;
+		dev_kfree_skb_any(skb);
+		return NETDEV_TX_OK;
+	}
+
 	netif_dbg(aup, tx_queued, dev, "tx: aup %x len=%d, data=%p, head %d\n",
 				(unsigned)aup, skb->len,
 				skb->data, aup->tx_head);
-- 
2.53.0

