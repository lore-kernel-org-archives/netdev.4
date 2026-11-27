Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762041;
	b=fj4mk7pv7ZRq2a86fK0WFKBCd1l5BQiJ1t6xFr5rYTmBNrFZUkVMT1LCqA8aO+mms2ma
	 A3BSaAQlbqEYHP76LTaTbuf97kTxfrlHUnHk4Q11YeGmIO2zbtkx2IVFAQsuanOwmWBCf
	 qewY20SUGkX/L2THFGLdK0u/XaNjOSUaLePq27mXDOv4B1Ok9w2rs9e5OMdI4GXdiPmua
	 E6CJrCKJx1+0BjfXHwrMKxuy/04Zqp86lTfa/ECcXZIpfv5JpqzO4btxwqy3JouwZrgrl
	 BsvfjAiLOBZQaTTjFGPMP4dYCrq9x0cZjjz4Vu344uP2Fz4lDILLTuu95LcRuuZOAjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/qlVD+W4EYAaz2b3JmMA2e/zNhIM7GUlB+7wqqJ0MxM=;
	b=NIHHSDgjpFwbBN0F90HHBj3MAqh1huEoHcVz3QjcS33EqvBs2cYY4BYIEQNb9c53fjrJ
	 7h6RPuz4aagJ/q3k6w7VtRQ66YIgiJyIPvFdWx7IlNGWaHTiI22EG8jluUI6985JPzgYY
	 jQSY2gR62OdnBB0BmIpVBlOkPyQQbsydl89QZ9ct5QD06c7Gm8ZA3wkv1gkZzekF+4gNN
	 Fc2k7+Cb9X/iDArmfifXC7fwB+NK8ss7b++Fu0tLO3nbVyW3TP7LdULbaOsR2RUCcjqPZ
	 26mXUfwi3J1D1VwJYeQmVH9CoAKr1OJP+DKeIVxrBU89ss9xa5Ge9MBrTw9BpfTcchQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n8v7oi4Y;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31D2606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 06:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B31D2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n8v7oi4Y
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2f04158d3cbso26590055ad.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 22:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762040; x=1796366840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/qlVD+W4EYAaz2b3JmMA2e/zNhIM7GUlB+7wqqJ0MxM=;
        b=n8v7oi4YdBWInqnNmqQS501csZVceCsWfpRCPE1dbgQEh7QHAjCL3mQZw/fYbc/Aku
         cv4EqtyifhjVv9I0W9l0MDJPSihD3wgu9lxmvG40i3ySfb6ybPGWMvLhapSf6v0aUjsl
         Le0RlYQTh+1r1KsGuL0bkfcEIaVBQxQb+s2y8krZIOh500fWxtGwwgOa73u0BsF6TxvO
         RZY22SGsb2vsXZBy7nLuE1NV6mi04yZxlXEI6q+tEpuFuYA0ZkyvbpQPWjrDfS4a1cYJ
         J0cVhOXrZSmRQ/gqqhG+hE7MLFfOzssxuEqWkEGPZrVXCxw1Vua1vzwbpwUS6fn83UH3
         0bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762040; x=1796366840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qlVD+W4EYAaz2b3JmMA2e/zNhIM7GUlB+7wqqJ0MxM=;
        b=PWcHP/wyBeGbMjoN4gNCjZS1T8dWhCOcKY+7KecM5jY+Z9ucgPsJwSrQxx6tFqmSX8
         UA9+WBoDewiuUKCBEoI/O4cD6EekVp7Gb7EZrNs+c0FGMwVoIG1Gjb7IhtOI5fNgUdx/
         ih567COcNHfGsC7fFlS6v81MjXCcDroBCbMWO8aYT1LVZ+nfJ5lG9reV068v89fotgI3
         MfdKT7bYXIlo0fIJ/4hqwU+gX/cY91w02oNRXtMHmnP+1lZrlFtt7/vkNAkrCNIoIKgH
         CW/YGHBpSu9QkBS77BEzVPVlUZw37cHZavC/ywD2b3qS+46N4spUXrA53FcDxPklbVdF
         uc4Q==
X-Gm-Message-State: APuU4Z+3sT+MaexLz1DubeySsOxwPoOe9ZviTgoQWrAQlfjtz3jcCucV
	+K5abz3o0LaiFqb6DUdGkcdC4snn3px0YkcceSPJUnOjdQkFIqDOFMKo
X-Gm-Gg: AZFdTZewg6nKPCQ7DpCg4JUT8tJ6xivMzawId+VOpgf/HH4t5gxNJ+1BPoI78EccKdf
	/lI0lsYiuZ+DG+7fO5gTrv18fYwmaDk5CmrsDB8ADBM/E3rM2J1Y3gQ+Lwjn0efpM6nVfPFXOk+
	86AfvORrEDTLbGsczIND9rwCLMoC0o/y+YdoZgI9MKxY7C72ZUSq2B94tI6YrtD8R53y6ofi0BJ
	V3ovE++lrkWfxNjRCewH07dI7nKsxD6us+x0tHeVcXQlJuwvRDBYHY21pgCAVAP9YCGWe7R9ITa
	xShbTtNTPlM1IEvgF+TfLWpKyBJQi1Dt5vY05WrMBD8JLkWY6po6MQedhBDy9qBLqa6t7qLWBN3
	tAaNG5F8oAOu0dDpCar9uZZ8P6CQfsxLJtSCg0xKYcKyBRLA7VMG/QFlEOzcUCiMb1o0NesqkPa
	fdTF7N3yr/2bXznBSsZka1QulgAGDJnpame8oAjWN37SVw+8Wl+a3qJSysI8Vw7aVCBloH1oLY/
	jUk+Tx37nuDmuaaPkBzV3CC2bBfxNs+itLRrbicothGiborOePjWqciFmXIBU9USfXyvLrkKUQZ
	ZrFyJ6wRD5ZVzlpHHsRKkwL58wqlT8oBcBaLszkWxLvLUnE68X4zYLvMvArq+8cTF4f5t8FHgJA
	hyMZGMsiAMH3knngFhNr3W9U=
X-Received: by 2002:a17:902:fc4b:b0:2ef:d82e:87ba with SMTP id d9443c01a7336-2f03ef870e9mr238228685ad.3.1795762040046;
        Thu, 26 Nov 2026 22:47:20 -0800 (PST)
Received: from BSDHENRYMA-PC1.localdomain ([43.132.141.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee85466sm112294185ad.4.2026.11.26.22.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:47:19 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Pieter Jansen van Vuuren <pieter.jansenvanvuuren@netronome.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] geneve: don't announce options that are not geneve options
Date: Fri, 27 Nov 2026 14:47:06 +0800
Message-ID: <20261127064706.2920854-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.53.0
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

geneve_build_header() announces info->options_len in the wire header
unconditionally, but only copies the option bytes when the tunnel
metadata carries the geneve option flag.  With metadata of another
tunnel type (vxlan, erspan), set for example by a tc tunnel_key action,
the announced option space is never written: the packet goes out with
whatever bytes __skb_push() left in the skb headroom, and the peer can
read 4 or 12 stale kernel bytes per packet, repeatedly.

Only announce and emit options that are actually geneve options.  Other
metadata is dropped from the wire header instead of being replaced by
stale headroom bytes: the option space sizing and the GRO hint offset
now both follow the same condition as the copy.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: 256c87c17c53 ("net: check tunnel option type in tunnel flags")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/net/geneve.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/geneve.c b/drivers/net/geneve.c
index 0ab729f055ea0..dd1734b82af59 100644
--- a/drivers/net/geneve.c
+++ b/drivers/net/geneve.c
@@ -1231,7 +1231,7 @@ static void geneve_build_header(struct genevehdr *geneveh,
 				__be16 inner_proto)
 {
 	geneveh->ver = GENEVE_VER;
-	geneveh->opt_len = info->options_len / 4;
+	geneveh->opt_len = 0;
 	geneveh->oam = test_bit(IP_TUNNEL_OAM_BIT, info->key.tun_flags);
 	geneveh->critical = test_bit(IP_TUNNEL_CRIT_OPT_BIT,
 				     info->key.tun_flags);
@@ -1240,8 +1240,15 @@ static void geneve_build_header(struct genevehdr *geneveh,
 	geneveh->proto_type = inner_proto;
 	geneveh->rsvd2 = 0;
 
-	if (test_bit(IP_TUNNEL_GENEVE_OPT_BIT, info->key.tun_flags))
+	/* Only announce and copy options that are actually geneve
+	 * options.  Metadata of another tunnel type (vxlan, erspan)
+	 * must not go on the wire: there is nothing to copy it from,
+	 * and the option space would carry stale headroom bytes.
+	 */
+	if (test_bit(IP_TUNNEL_GENEVE_OPT_BIT, info->key.tun_flags)) {
+		geneveh->opt_len = info->options_len / 4;
 		ip_tunnel_info_opts_get(geneveh->options, info);
+	}
 }
 
 static int geneve_build_gro_hint_opt(const struct geneve_dev *geneve,
@@ -1336,7 +1343,10 @@ static int geneve_build_skb(struct dst_entry *dst, struct sk_buff *skb,
 	skb_reset_mac_header(skb);
 	skb_scrub_packet(skb, xnet);
 
-	opt_size =  info->options_len + cb->gro_hint_len;
+	if (test_bit(IP_TUNNEL_GENEVE_OPT_BIT, info->key.tun_flags))
+		opt_size = info->options_len + cb->gro_hint_len;
+	else
+		opt_size = cb->gro_hint_len;
 	min_headroom = LL_RESERVED_SPACE(dst->dev) + dst->header_len +
 		       GENEVE_BASE_HLEN + opt_size + ip_hdr_len;
 	err = skb_cow_head(skb, min_headroom);
@@ -1353,7 +1363,8 @@ static int geneve_build_skb(struct dst_entry *dst, struct sk_buff *skb,
 	geneve_build_header(gnvh, info, inner_proto);
 
 	if (cb->gro_hint_len)
-		geneve_put_gro_hint_opt(gnvh, info->options_len, &cb->gro_hint);
+		geneve_put_gro_hint_opt(gnvh, opt_size - cb->gro_hint_len,
+					&cb->gro_hint);
 
 	udp_tunnel_set_inner_protocol(skb, double_encap, inner_proto);
 	return 0;
-- 
2.39.5

