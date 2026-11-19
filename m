Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107839;
	b=5Rm23FOJVuNSB5TJ6ZYfGHJIo49mrtu/L8HqqEuprPud/+0ooPy8byL/Sutln+zapZjN
	 k1Ua2Fa+T37MwDP0DT0T5qG5b4YxiBjAlSeTyAibuTGi1s7QjqiFGVV3IcqAEVromW9Dx
	 UKLe8wwO4kQIJdq1uRG7u9gB0cvMrJDmZs2XxKbWPSdy3fg6rk2dDVbJ7Ro/2spmsNQUD
	 qEElgcbAjodiX7paytwv3dHwEPSLCS3AihUeq/Zao5tHZBMWx8x5AiztamAzu2S09O/SR
	 GZx81ptI9fVvnORnryMt//7KIwfoZGG/cuMep8s/iOoy74xxhmUWMvZHZfBc6Boz+uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=kDzxg4ba9uJgWZ+i6XZZvE8D/ozoXIo8ReEk/bEeEZE=;
	b=ABQovUffenlheRklrbqFH1L+s6a6JiAZr/cnAaRyvNuaZ2y1vjgpub7k2nrVLskih1P3
	 FAsZIzVDYx/kwRJA+GpNvqL6ZkU9iW/qgaHCCAj22eWAm4S3NlrA1k56rJGrmdt8KczYI
	 2PMVitSCs+WLk126yyydTa5LEvM+OLYc+60QVrtinyaHqdZb8t4fFIGgnspkLgUR8ZCen
	 r1Z+e6e1Jtk+H8C/naxf13R/JI93dmvST8yk4QKkixPK0qyg535cxVXq1LETlXL9RZskv
	 t1KvuWZOmtFNfMaMO5cNPTwKd7wYvypyN7G+PH9UJHLIf3/ponXV3Pn+2QjNViH2l3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SWTG4H7T;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800B0606A32F
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 800B0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SWTG4H7T
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-382af5cfc58so6011249eec.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107837; x=1795712637; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kDzxg4ba9uJgWZ+i6XZZvE8D/ozoXIo8ReEk/bEeEZE=;
        b=SWTG4H7THfkDUQrMuZ3rq3VvVI9TpbOoHm0ItNq3pUggQrTV/GIwJzUwAea3PEeH1R
         EOnDMQLr7dG51lrmmoWdghF4WhEBCAUm/Ux3E3hoAL/0/nleCOAvCHOLykdDttt+tD2J
         hwJMJvQA+4VaLs5j/HW1mCVooNDDwW60HhMTcZwJ/IJTpQKPAiKP9uYzKp1CX/FKlkTI
         m23er4pJG7b652AL1yQYj8EVAl1NIWc90xGukqiv7xqsOi+SQ13JhntbiYEVjZOnWsAQ
         eU1uaGT6Pekxcz7PF6BY0HzHKijWdF2tK7TSOpexCgCjXljVTzOeX5dx5ZyYv68UIvjO
         bXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107837; x=1795712637;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDzxg4ba9uJgWZ+i6XZZvE8D/ozoXIo8ReEk/bEeEZE=;
        b=0n496oBvShP1GGdUfPx13/Q1SgayklhaEdrs6QsmulrGyfJQI2Sgbv4NhkaUCtSaPI
         fRjhIMmzK6j9jx+WfKFnWYSBDInIAdD5O0Yghk37KHRTShBGKBx2TKxUTW9Qnb79meqW
         QWPcG59LSv4LPlCMIteg2IU5sjecRRLuAshYJLTkbGwebGjraK5PFF1NO3jsrwoVAcps
         KNbnQTtqs1dxMaTDa8hGjFxPADGJfw1IaAvPgwlUJauIZczJLhiDJYGk+ZsTUpk0g1Vi
         HXzbW9mJ2BzJ2wxY6/9ITxzzDvtx5FABvtjLrpFL6dtB+ZayUybiTeHtf5gZo/HmMRwg
         evnw==
X-Gm-Message-State: APuU4Z8Q/0MBhak3K4/qnfyJQI5/yk0zShtxY5BOMS7cPIG7UhH5rhfz
	kEOZTcmfzEfOzmEyhk0KNSwsVYf0SNgjmvRWCyk3l9akHfZBhq5PmXCHUlRRz/TsxC71f0yjK6l
	xnD1o1RS8Hg==
X-Received: from dycuf10.prod.google.com ([2002:a05:7300:10a:b0:379:1aaf:7a27])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d401:b0:362:fa87:2aa6
 with SMTP id 5a478bee46e88-38569256f32mr42571eec.0.1795107836309; Thu, 19 Nov
 2026 09:03:56 -0800 (PST)
Date: Thu, 19 Nov 2026 09:03:53 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170354.1509589-1-irogers@google.com>
Subject: [PATCH net] net: marvell: prestera: Fix skb leak on error in prestera_rxtx_xmit()
From: Ian Rogers <irogers@google.com>
To: Elad Nachman <enachman@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

prestera_rxtx_xmit() is invoked directly from prestera_port_xmit(), the
driver's .ndo_start_xmit() callback, whose return type is netdev_tx_t.
When skb_cow_head() or prestera_dsa_build() fails, prestera_rxtx_xmit()
returns NET_XMIT_DROP (0x01, a qdisc congestion code rather than a
netdev_tx_t value) without freeing skb.

In dev_hard_start_xmit(), any return code other than NETDEV_TX_OK (0x00)
is treated as a busy/requeue condition unless dev_xmit_complete() holds;
for an unrecognized positive value like 0x01, the core neither frees nor
requeues the skb (or hits the unrecognized-return WARN path), leaking
the packet buffer.

Free the skb with dev_kfree_skb_any(), increment the core tx_dropped
counter via dev_core_stats_tx_dropped_inc() (so .ndo_get_stats64 reports
the software drop), and return NETDEV_TX_OK.

Found by enabling Clang's -Wassign-enum on an x86_64 allyesconfig build,
with AI coding assistant help to audit the warning and prepare the fix.
Build-tested with Clang; not runtime-tested on Prestera switch hardware.

Fixes: 501ef3066c89 ("net: marvell: prestera: Add driver for Prestera family ASIC devices")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/ethernet/marvell/prestera/prestera_rxtx.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
index c4ea247d2470..7ac9220d33c5 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
@@ -817,13 +817,18 @@ netdev_tx_t prestera_rxtx_xmit(struct prestera_port *port, struct sk_buff *skb)
 	dsa.port_num = port->hw_id;
 
 	if (skb_cow_head(skb, PRESTERA_DSA_HLEN) < 0)
-		return NET_XMIT_DROP;
+		goto drop_skb;
 
 	skb_push(skb, PRESTERA_DSA_HLEN);
 	memmove(skb->data, skb->data + PRESTERA_DSA_HLEN, 2 * ETH_ALEN);
 
 	if (prestera_dsa_build(&dsa, skb->data + 2 * ETH_ALEN) != 0)
-		return NET_XMIT_DROP;
+		goto drop_skb;
 
 	return prestera_sdma_xmit(&port->sw->rxtx->sdma, skb);
+
+drop_skb:
+	dev_kfree_skb_any(skb);
+	dev_core_stats_tx_dropped_inc(port->dev);
+	return NETDEV_TX_OK;
 }
-- 
2.56.1.708.g77570a6a1d-goog

