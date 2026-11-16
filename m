Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846526;
	b=wpD9se0somu16Udw47Uc5CztI0ENGSD78lZa2FDCmMbro3AA7mIK6en2GzRY8fn1hCVG
	 sYN/BjAYPuTzP34sYx3vsren4Jqv+AaAitd+c+zqt4UadKhuh0IgSLZszgybsY3ovIfX5
	 nMOhwoXUXExvmYH96HzZ2mZ7sgJaRwmzoJ0wUk3c8IoOFusIxoLvppzg8nHNbs1rzYKQ9
	 kA8PoieOz3SrEBeCYWEO2fXCBEfxIOWO5iX6ovBoCkOfzm4za4qHdBzo/a2djXJt6YiSN
	 K0LALWUbwbBay4GC0XFWk+VhMBU80L8glZjoRjZ1NjeKA1bMsqRfwIY9rt1RQlg6c+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=m2qUVYEU4erka3R+8Mzo5flrWhCob2ySKiSLvFVhZag=;
	b=bS549iPTcHXGAWKKf506hbCdhP9UT6mP4rIHxhgz8AvtIFVdHGmlY3YVuyJlTJtUm6+u
	 JOFAxm5ogayOXIX+57XYBll6GGzAP0AUB0ivBcz9YtYVG39r90bMN+/QP5BfOWvinod+t
	 wR4h9mLAHKQE/+cQc5DHmuLgzI2qzPZWSUNuDWQa3N+9I/bOFhRZIi/oAGh6sQIAlawS2
	 vCXGcOj7EvYRv023W/kw24Y6c3GgWbNRMG9sEEkLFFcIcnhKTUnWHdyiD3omsmgIXGdK9
	 FtDw9pZmq7UuDHAF4QUxODSqIQR+rMc4pU0qWp070KPjOonFhz7MJ3nXTdMOSTT97eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Tk8oxXj9;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E283606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E283606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Tk8oxXj9
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c45551fa84eso702308266b.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794846523; x=1795451323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2qUVYEU4erka3R+8Mzo5flrWhCob2ySKiSLvFVhZag=;
        b=Tk8oxXj9BHFLTph+V0GNfvgoPR3BlwfYIK1obg18W2MCzFUc3JxDaqjWB7jk5oUstL
         dDl5+3g3s+RxPQtpL0pPw0DQqqzKoUDAs3rpjYeKIC0ABSlts4k59XTTVVFxGlzzFZwV
         6ZU0T3LluGqKZxAoDf+rmF2DSK3R8SoDSF6p/y17YV7s+OijCfTHeI/6iCZl+Wq2HhWz
         N3Z0j/qfkvZxE7F+q5UzsaLeQep8aG+9294pYvSqSUWAUU3/nOijUuNpGT00mvk7PsXq
         rel+YUirI8TD4rYPdNmgZDGkpSbxvfzzT4qdpVMyRRYhp/iy0rfNX8AsSCkIhuQfKHQ7
         LMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846523; x=1795451323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2qUVYEU4erka3R+8Mzo5flrWhCob2ySKiSLvFVhZag=;
        b=2yxDj0Fkx3SbHIH26HR5Oc3S2c+kxx8KxlWQx9zQuRTSdYsK8D+QyVlkcvlqEANe3O
         komIt+3hipHpHn8XK2MYCaWJ5CrcqL6hNYlYm8yhL1QqOcUFdOvY/0TjNVw74fgWln0c
         0hkBjm0NWc41X04HvuMiMRLNJ6UP3De0qsxehXP6k+LfUHlvO41HxRfbK0L8HmhaYNbX
         c2/O65yu8mr9QpB2pLW5o/7i0X/WVe9uczqCl42+xmcXTIQbxEU9HJAvOpX8n/NCphQ0
         JUDs36VsyJW3P8Plt9JYZzZrk9E1lwGesYlfHsltiqEkCzXWJ7T+8pjz9KQTcPowodJU
         jbWQ==
X-Gm-Message-State: APuU4Z+I0TkmtYcOBWVbr+eBh1nwVewjL+JwGR6144a3oQr5LFNO8zhb
	Nw6cHCj82tgug+Yo/ytuoO+3sGd8Aaf2YKp3I6mO/1HAg+7NYMTiGEitHuNjETxGNID5aFrGJXt
	jv5e51i7/yQ==
X-Gm-Gg: AYBFou1Y/xc3AThN6c80IezUu6qZU1SRTNHhO3sl0bNX+DEgEBcQ0mKu7sKFlUfpAEI
	yHdWW74GbdWG8MumWHp24vNOoSEIzzYTqqTnih6rWERwRM/+KPY2fdeIj7fGRby8ourAMIuqume
	f0b2meg3RF420ygj84Oe21CTu20N9IDrJfuzhwKOtzgbqANz+rIVoNl9ZoI3HtVni4Vet4G+ek1
	/kK9vcgN6enqIgmn5k+TGF9MKWe/swQSum6n+uuvl1tQ9IEN7J1fU/sSmEGuNMSykWXYERsJAmq
	alh/XD8D8HK2yitOC3234FIAbRk5s8ojjK1faZClHEHtKmeviHkPQfMcswxp7+3YsAQKqSOJDtA
	ZxBzi2a0tlt2woiQr36L74soYwPE4b7T3ZOys6aneCCkf/Q3RNDt68xRMT5NqUrtO6007tSL7zH
	eX2wYGySKTTOBdfJUnt8fodPcJnFbgqVpBH19jzDgbL7N6fAHIk4gwCCtjq573BVgBFeKkstUHH
	qFWERIqcAVW+jO1L5K+YaGHcyIvOLXn+Mtumd0ANWaZ4BrGA7X18j3v++OFYMHVqOnioeByyZYl
	v7CJP/1CNrX76bMaUi0RbzTK8lq4sVmU0JiYV6MDU+lkydTq
X-Received: by 2002:a17:906:d542:b0:c29:d31f:7d6a with SMTP id a640c23a62f3a-c509642ad87mr785783066b.35.1794846523503;
        Mon, 16 Nov 2026 08:28:43 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50b13a2ae7sm299639966b.62.2026.11.16.08.28.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 08:28:42 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org
Cc: magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	yoong.siang.song@intel.com,
	kerneljasonxing@gmail.com,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Tianyi Gao <tianyi@cloudflare.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net] xsk: reject TX checksum requests that overflow skb->csum_start
Date: Mon, 16 Nov 2026 16:28:34 +0000
Message-ID: <20261116162834.30087-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
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

xsk_skb_metadata() sets the u16 skb->csum_start to hr + csum_start. With
64K pages, csum_start can be close to U16_MAX, so the sum can overflow.
The checksum offset then becomes negative. With XDP_UMEM_TX_SW_CSUM,
skb_checksum_help() triggers a warning. Without it, the device gets a
CHECKSUM_PARTIAL skb with a negative offset.

Reject this with -EINVAL. Use the limit of skb_partial_csum_set(), which
also rejects U16_MAX, the "not set" value of transport_header. That
helper cannot be used here, as the skb built for an IFF_TX_SKB_NO_LINEAR
device has no linear data.

Fixes: 48eb03dd2630 ("xsk: Add TX timestamp and TX checksum offload support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-203545@kernel.org/
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
Sashiko reported this in [1], and earlier in [2][3].

Returning -EINVAL leaves the descriptor in the TX ring, as the current
check does [2]. That is a separate issue and out of scope here.

There is no selftest. The umem chunk size is at most PAGE_SIZE, so only
a 64K-page kernel can hit this.

[1] https://lore.kernel.org/all/sashiko-outbox-203545@kernel.org/
[2] https://lore.kernel.org/all/20260518063407.C3B99C2BCB7@smtp.kernel.org/
[3] https://lore.kernel.org/all/20260531042721.DBD4B1F00893@smtp.kernel.org/

 net/xdp/xsk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index f22f9a2cdbbe..ab2e4fa87a4f 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -1006,7 +1006,8 @@ static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
 		csum_offset = READ_ONCE(meta->request.csum_offset);
 
 		if (unlikely(csum_start + csum_offset +
-			     sizeof(__sum16) > desc->len))
+			     sizeof(__sum16) > desc->len ||
+			     hr + csum_start >= U16_MAX))
 			return -EINVAL;
 
 		skb->csum_start = hr + csum_start;

base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
-- 
2.56.0

