Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095679;
	b=5LzSwflTS0TMNJcURdAQ5jvvIcGBINMAkqUcy1lRn7JSUq6pwCOcISAaqZLPAXv/+B1W
	 43Hy5xQGa2f65XCI1tFUDQ+sA19zu9XAxahb7V/36a7KYGELOfXcjf61H9/ATL4macvt8
	 GtOTTRBA/0OzyoKfxU9BHyBUohmApjUGH4i3CwW/aF1kTifpbpFrJXhfa5Pl3k+mceWJc
	 8AYPvu287AKkNG7KLA2VS84BSC+JpiAinfSIO0J76zg38xsfGANmaHhRY+I8SPJf5v4sX
	 xpS36NKdNBZ6zEK/cKWfCHLIcR1krMP19XIent4PNNUNceIDtwHKeMHEJ0MNEwOVG+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+/1aPW2sN47IVO6KfZ/XPY38JhDzQlQVktdUgLy0gIY=;
	b=NjpnM5w3ZIUkk2tvLR5ukW2GnT9gEKTj7yVuwKCwptYD6iq/N8dZ0cDo7cr+4zEvdgyS
	 /U4lrJH1Wbcv/uPTAGoeMftlxvNhSpOTGlVy6HEIyop3omZYATFdobfP9Wph7brdXmZqD
	 4n9VNRYpvLSHGEW2X4wyG8Ix+PKujpQorWLxSRcDbiyAs+lywc0mftnlKskM2aOyNF/69
	 bjOM8Mov6ifpWU1OzcUlWc5nkKCSgIqw9ha6XQaqtTQvD1QRKtp0RmoDDDcdudDN6rLMN
	 67DHLVMWkNEHGBjgOyKAb18TJ+gyhh5Ui+sQ8J092xsNPgRNRe0UFCOLcCYLKl4rSXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LCWRpfQV;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FFD60A2627
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80FFD60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LCWRpfQV
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso2443602a12.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 05:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095678; x=1795700478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/1aPW2sN47IVO6KfZ/XPY38JhDzQlQVktdUgLy0gIY=;
        b=LCWRpfQV4dqgT6dBAbuXUx9xqe+vOcA5eKQZ9cJY9QQ9gX+groDau+9bU366T90D+c
         M2MPcZHDKFk1WboIIGi2kvpiRq3KR+Vk/LY3UnYeAbDrL3f/sf8iCpNsAAWmVVe7bFNJ
         vmS9bBKjbYeAOFEg/OwVzLxL3AK1t17Ro/qKuT1RAsTKi5hCBH++GYsjKa54F69nJGGX
         iYSL++iP/aHUdr77iz2LxXPMAyHPgQtUMQAu+ot2QwbLuqNSJ0lGPslszzc5Nd0OXS5g
         oJl+l6+u6JnM9iMJHN6+8wW1OU/V8NOdby3DYyNnLmHHMe0Fjcd6L6kySGDJWV6UlU+L
         e6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095678; x=1795700478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/1aPW2sN47IVO6KfZ/XPY38JhDzQlQVktdUgLy0gIY=;
        b=pNJoFznd9ifJZ8wxey8c6HNzapNnEeo32DVIHmf2/S5AUM8pXiOX20hXka+41giIsA
         nvf+9EkJ1gY/1Zno47plROP+z7EH5ufd/qff9rgsPP4vTNJIMU7wf6LfD3ZsS8m+qXd1
         TKMAaqskhD0r/DPk1NiC0eNFydKlimB8hOh/HwUy5uUTGb9cMYnJEQ2o/QZElPKS5wbi
         l/yD1bXQ24GvjV/djfbuo5s/F5SZTPdEPsR5K+CZjZabFm4JlyMBSrxqNd5qDd2pN+PG
         y8gd7MqsYzAucWxsMGSdl3ZnS3nn07BRMwSfBC6jzxxgyjPmSW4MrzglkHFZFyuSVH9r
         zHKw==
X-Forwarded-Encrypted: i=1; AL+hErF8BG0u+g/WZijTq5G2L98P1+bwjanHsBcnq7/0aXE7mErCt3NJLniXlA6DtUIb1b7SSqg9ems=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HnoxcIYD29tlBMF71MLuR0e5zqfTJ00FCvoMr1y4Cuq5AHn2B
	TgULDE58o5iEvzVwLsDljf/a/ciWI3CORgpIcSXzVN2+1voEtSrKPh2b
X-Gm-Gg: AYBFou2gx9XxPbIC0wDNSbCkJMr3zFIGITTdBJ33aEYhvjh9xRuIr9UimTypuuOVSsj
	jtE0HfypPbuIDIoOqY7PnUMa7wxgQylpYjocZy8DTsM/ToH6GxSIYv4Ri53BHgRj4jXRMUvg4TG
	d/tSe1Sc6SkZwFHhCppwsmyYjcd1HMHVjR72tK5nNEUmN1oug2MPXGRnN88JqASp98uckryNKlr
	eSRQ4xHKQ80iaLJqbH1QYPNHUTcmhwmlM30ySBZYAYZHbLtUKP3pVeAWfjZFF48jtKnnb+IWfN6
	qK0gHj5uuzIWlIyxjPaMFGgpGzXIsHcWJeDHD1YrOMmj9qfOiAzib+mS/O4xrzVN1CfoqGm7M7Q
	sjgwWJL3/Bvj4r12E4LBepuau8XwSdFPp9018jVo8TRMAsVx0u5J3L9WBd5UKenFGk6Ng6bvZRS
	DIolSS1Xek0z4hiIpx5ZNSzdQHLUT9IA9/2o2hxXFfxfP+bCWdpntSC4AgHpLfBeKM3hq2607u7
	qYQzw0g3SheLZw4TdE12UnhIOe8jxWbCVER86MhrXUw7OAKiPvIfRhMC2C16tZ7Kd3I8KKugDNa
	7ZIonkl5DhQhZsoAb+BsKE3GNjnR5OqqhMpKStrX8WSQ2/+nlDdDp6ix9AM07gY+W78h7y7Qb3V
	97FUvNEZF6XHAtw==
X-Received: by 2002:a17:906:5605:b0:c46:7645:86c with SMTP id a640c23a62f3a-c510e4f880fmr428831366b.47.1795095677744;
        Thu, 19 Nov 2026 05:41:17 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-31-175-182-49.play-internet.pl. [31.175.182.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c512346fc3fsm105582666b.59.2026.11.19.05.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:41:17 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yongzhao Chen <yongzhao.derek@gmail.com>,
	Alexey Immoreev <luixo-public@luixo.me>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 3/4] net: dsa: qca8k: check the length of MIB autocast frames
Date: Thu, 19 Nov 2026 14:41:09 +0100
Message-ID: <20261119134110.15048-4-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119134110.15048-1-kuncy7@gmail.com>
References: <20261119134110.15048-1-kuncy7@gmail.com>
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

qca_tag_rcv() makes only the 2 byte tag linear before it hands a MIB
frame to qca8k_mib_autocast_handler(). The handler then reads the
counters that follow the Ethernet header, up to 164 bytes on QCA833x,
straight from skb->data, without checking the frame length. A short or
non-linear frame makes it read past the packet data.

Pull the counters into the linear area before reading them. A frame
that is too short is left uncounted, so the request times out and
the caller reads the counters from the registers instead.

An LLM assistant (Claude, claude-fable-5-1) helped write the change
and this description; I reviewed both and built them with W=1 on
arm64.

Fixes: 5c957c7ca78c ("net: dsa: qca8k: add support for mib autocast in Ethernet packet")
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 4de7da9c8e..76c0f7c97b 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -1669,6 +1669,7 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	struct qca8k_priv *priv = ds->priv;
 	const struct qca8k_mib_desc *mib;
 	struct mib_ethhdr *mib_ethhdr;
+	unsigned int len = 0;
 	__le32 *data2;
 	u8 port;
 	int i;
@@ -1691,6 +1692,16 @@ static void qca8k_mib_autocast_handler(struct dsa_switch *ds, struct sk_buff *sk
 	if (port != mib_eth_data->req_port)
 		goto exit;
 
+	/* Past the first 3, the counters follow the header. Leave a short
+	 * frame uncounted, so that the request times out and the caller
+	 * reads the registers instead.
+	 */
+	for (i = 3; i < priv->info->mib_count; i++)
+		len += ar8327_mib[i].size * sizeof(u32);
+	if (!pskb_may_pull(skb, len))
+		goto unlock;
+
+	mib_ethhdr = (struct mib_ethhdr *)skb_mac_header(skb);
 	data2 = (__le32 *)skb->data;
 
 	for (i = 0; i < priv->info->mib_count; i++) {
-- 
2.43.0

