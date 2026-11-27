Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776852;
	b=Td8i3sWGHXoQxxpzFYrgOD1T5guhkD4o+1P09HGRPYeBSiXqgB9wW+A4ZroI+f1N9UJA
	 2WkU/xWI3PUvsWnrutPZmOtWssNJME2ZKOd9bTPJQVxeDd9nZQc13X36+0kDHWUSv0bO7
	 mtt4/KRuSHKVNu+NLcKz8e8MLGt71LVkGMLbWO+s51clt8WZf5Wi8cYM8P4JSSnVpE6Hk
	 dyjfYqIskhxs1TsKJNeOhFsoBERJG0e7gCqZ1uY1szandacpCSFswYiEtZGqsuhlPjJey
	 wXAqiU1+WE9iWlnle4O/XVu0y3cVcfVpmu2vcnZF0gtLabYIsII6/h0mZ2qzIqIs83w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6o6wwpsf6OkL2ZSFH1Jv+ohkliUZZst2ain93hx+srU=;
	b=MaI0+N0s/G9/nWKQcSBhv/XbP0yg+4BEPPu4TfUxK6VwrvX3LJHI66HUNePyEp8W6E/q
	 8SgIUD0015VMm7WOuQcOltMndaa5G+TdI4sFOjIu7qRi9lRwDZGIx9KcnS7vW6a2fb9qV
	 jkhqCJ98JDYroEylaUjFZwbxgwwths/y9/Lct8b4UqeeuBDRfJ+nd4RafItdeS5opzsDd
	 vOSWElz6ug45w8R2x6b1YqnTHVvhLNyyIPteefAeS39ehSjZHibBv9fN4EPvNXUfsGse3
	 GtasNLSRSZ5rfKCvUuizs+Lg+mdv+SxBLTS6WbPsI6+9A3+sb+oRQncGoQcAUPuh2sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0Z7gmyW;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20586606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 10:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20586606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0Z7gmyW
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b24f4b15c4so3732567c88.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 02:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795776851; x=1796381651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6o6wwpsf6OkL2ZSFH1Jv+ohkliUZZst2ain93hx+srU=;
        b=L0Z7gmyWDD1NV0Rl0P5B5KEd730ZW3wJm61yeKjW2ZS6lcj0yg9gXasllzaa5OaXBH
         kQCRbmMazReS0eCAnld9Omnj3RA8Cr+q1QZgKdEwSVp291EoejBacQ3Ml/I2SQREA3PT
         ZmFbl6NF6QYBkFnR31lmaY9EjhDile36nYboZC+tM9Jz5tILRXbv8CYr4igILI/4IVOc
         ux+B37VoEia0Nybv2HEG/KgDjXMF0d4+7Hrwf6HGykRrJt+X0mS/H+p5KE1BPmmZyweC
         u31llk0wNY5vi/hg4ZMcDkZlQslu/wh/mspzJkdMn/XmxdGNxoGvp9PjDd/DdZruwEr5
         zjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776851; x=1796381651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6o6wwpsf6OkL2ZSFH1Jv+ohkliUZZst2ain93hx+srU=;
        b=Ylj+1Zkg8xg4yX7PRnp2aIs/WILnkT2pro1qUVJcU8E3NgsHLGn4Vmjh1c+D9mDWUW
         tdz78cLDKURZ8zQ4kXOWHbtQe03WDmjsjonraT4k5OUih/1GIniClQUCb8nZ9swUvu2w
         KapGkYUXHj+YRleFF4PprU8tpfoKGkBTBz98Pddoey9KGnrwC9y+CvuxSHXFo/W8cH85
         IqH6XDtiX9Wt6ET2xIF/0X4MHgGGE1Rp8HDk1n1zrcY6Uzd/18C88z6t7+q9LdiqaaWh
         AAnej+khkcXefRSb8mVyqVMRhIn+H9s5ME0lqe2nzikozoPb8zA1m5sw+9lZd9xaFPrj
         VtVw==
X-Gm-Message-State: APuU4Z+IF9OtRUaszWwn2piYwhDVCiT5hnNUZcx9RoClVzbBSrqW1LrP
	4joazOXef1Om0g4UkKI/f0YnBfik5ZpLgb/V8+gOVyT73MDYXaDY7u4E
X-Gm-Gg: AZFdTZeQoxC27IKKbaYcodVu7xQJgJfjCctFL1QG9uNRq3seG8Es4pYWmy04MC6M5vj
	d/yPKXN6HVje8/yBu8ADzl0tISvriwa0/PgiD+s0qfB3FFwDuLmY4MKolYRi5PmIc84tsJRlFY7
	ZPoVhbKOqq6BHkzyI0zQSXkFuhYEit+36YI1U/V4VR9FOEK811QJKThWSPyKGabat1Ibn8JlOJX
	TvfOAyUYz7AJ2p5xckLshj0Em4bIYoBqAmVVEnuBOfqq+bd2Im6IDhKAuWhKEixLegN+UlLy9+8
	afdSJySF8+zG6sIQO7xHE0xgfxQajfSn6bU7/Jvgn+ybJH2V0sJDYu4yvXLc06CaCa+zAfAWHD0
	2jigX/QTohinpE7uT7Vn54SCZfv9ExqpfKBd2OESkVbK2JaxUHcThcW4xCr/BQstftD4lPZW5Lc
	XGVab+HDq9KqAMyIx0MDcyT4dw+ITkXiKF1nWDQ5CyHTkOzM+Usg6VsolfT5Z/ukdgi3tlVIiI0
	j7x3gBr1T65w6jdNVFBgkBZNEXD7qDhPGnoEPbbdjLizKLrb18oLSIbcBBOeuBCoa8O/VGZ0oLh
	+SH6xv/xcHpsmMXO5Ui6ukIEdom+viG2DDAUE7jpSofXj8iHurp3VkZ4ni+4N8OHm5OcMG0D1vb
	1FlmRhKPX+y7Xq+3vpXq3OCmgKR3rZeG5lc/wwRn7awN/Z1A3uIGXbP67fuSizxUSEKl0enZtuw
	==
X-Received: by 2002:a05:701a:8459:20b0:1ab:90a8:87a2 with SMTP id a92af1059eb24-1b5524b0f73mr23088055c88.11.1795776851201;
        Fri, 27 Nov 2026 02:54:11 -0800 (PST)
Received: from localhost.localdomain ([38.114.108.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm54992326c88.2.2026.11.27.02.54.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 02:54:10 -0800 (PST)
From: Jason Xing <kerneljasonxing@gmail.com>
To: willemb@google.com,
	magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	bjorn@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	Jason Xing <kerneljasonxing@gmail.com>,
	stable@vger.kernel.org,
	Petr Oros <poros@redhat.com>
Subject: [PATCH net v2 1/2] net: reset the mac header in __dev_direct_xmit()
Date: Fri, 27 Nov 2026 18:53:46 +0800
Message-ID: <20261127105347.72997-2-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261127105347.72997-1-kerneljasonxing@gmail.com>
References: <20261127105347.72997-1-kerneljasonxing@gmail.com>
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

Compared to __dev_queue_xmit(), __dev_direct_xmit() is the only open
gate for skbs whose mac_header might not be initialized. A few months
ago commit c2707480cfbf ("net/packet: reset the MAC header on the
packet-socket transmit path") solves the case where AF_PACKET skb can
miss resetting mac header if a few conditions in packet_parse_headers()
are not satisified and it will cause out-of-bounds access.

Similarly, Petr reported an issue about AF_XDP path where copy mode
can also trigger the uninitialized mac header problem.

In reply to Petr's patch, Eric suggested to add the reset logic in a
general layer to stop future issues like this happening instead of
dealing with scattered cases one by one[1]. So anchor the mac header in
__dev_direct_xmit() exactly as __dev_queue_xmit() does, before
validate_xmit_skb_list() so that ndo_features_check() and the vlan helpers
see it too.

For callers that already reset the header the operation is idempotent.

[1]: https://lore.kernel.org/all/CANn89i+aacS2PfaMXnimzGgbCLz-JSnqo6QyoS122Gf+kxya3w@mail.gmail.com/

Fixes: 35fcde7f8deb ("xsk: support for Tx")
Cc: stable@vger.kernel.org
Reported-by: Petr Oros <poros@redhat.com>
Closes: https://lore.kernel.org/all/20260817153957.3177627-1-poros@redhat.com/
Suggested-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Jason Xing <kerneljasonxing@gmail.com>
---
1. this patch will be backported to stable branches to fix the xsk problem
   and will also be merged in net-next. In the -next branch, I'm going to
   follow Eric's thoughts to handle the mac_header 'issues' from the driver
   side, and then finally remove the guarantee (reseting mac header in the
   core stack layer) like this patch and that af_packet case.
2. this patch is also a prep for the second patch in the series.
---
 net/core/dev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/core/dev.c b/net/core/dev.c
index 3c58db732761..6ea2fd3506f7 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -5149,6 +5149,8 @@ int __dev_direct_xmit(struct sk_buff *skb, u16 queue_id)
 		     !netif_carrier_ok(dev)))
 		goto drop;
 
+	skb_reset_mac_header(skb);
+
 	skb = validate_xmit_skb_list(skb, dev, &again);
 	if (skb != orig_skb)
 		goto drop;
-- 
2.43.7

